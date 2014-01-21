//
//  SlideShowView.m
//  PathShare
//
//  Created by Jaro Habr on 30.11.2013.
//  Copyright (c) 2013 freshbits GmbH. All rights reserved.
//

#import "JHSlideShowView.h"

@interface JHSlideShowView ()
@property (nonatomic) NSTimeInterval transitionSeconds;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic) BOOL shouldLoop;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) int currentImageIndex;
@end

@implementation JHSlideShowView

@synthesize transitionSeconds   = _transitionSeconds,
            images              = _images,
            shouldLoop          = _shouldLoop,
            timer               = _timer,
            currentImageIndex   = _currentImageIndex;

- (void)animateWithImages:(NSArray *)images
             showDuration:(NSTimeInterval)showSeconds
       transitionDuration:(NSTimeInterval)transitionSeconds
                     loop:(BOOL)shouldLoop
{
    self.images = images;
    self.shouldLoop = shouldLoop;
    self.currentImageIndex = -1;
    self.transitionSeconds = transitionSeconds;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:showSeconds
                                                  target:self
                                                selector:@selector(showNextImage)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer fire];
}

- (void)showNextImage
{
    UIImage *nextImage = self.images[++self.currentImageIndex];
    UIImageView *nextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, nextImage.size.width, nextImage.size.height)];
    nextImageView.image = nextImage;
    
    UIImageView *currentImageView = self.subviews.lastObject;
    if (currentImageView)
        nextImageView.alpha = 0.f;
    
    [self addSubview:nextImageView];
    
    [UIView animateWithDuration:self.transitionSeconds animations:^{
        if (currentImageView) {
            currentImageView.alpha = 0.f;
            nextImageView.alpha = 1.f;
        }
    } completion:^(BOOL finished) {
        if (finished && currentImageView)
            [currentImageView removeFromSuperview];
    }];
    
    if (self.currentImageIndex == self.images.count - 1) {
        if (self.shouldLoop)
            self.currentImageIndex = -1;
        else
            [self.timer invalidate];
    }
}

@end
