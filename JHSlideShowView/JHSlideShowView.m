//
//  SlideShowView.m
//  PathShare
//
//  Created by Jaro Habr on 30.11.2013.
//  Copyright (c) 2013 freshbits GmbH. All rights reserved.
//

#import "JHSlideShowView.h"

@interface JHSlideShowView ()
@property (nonatomic) float transitionSeconds;
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

- (void)animateWithImages:(NSArray *)images showDuration:(float)showSeconds transitionDuration:(float)transitionSeconds loop:(BOOL)shouldLoop
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
    self.currentImageIndex++;
    
    UIImage *image = self.images[self.currentImageIndex];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    
    UIImageView *oldImageView = self.subviews.lastObject;
    if (oldImageView)
        imageView.alpha = 0.f;
    
    [self addSubview:imageView];
    
    [UIView animateWithDuration:self.transitionSeconds animations:^{
        if (oldImageView) {
            oldImageView.alpha = 0.f;
            imageView.alpha = 1.f;
        }
    } completion:^(BOOL finished) {
        if (finished && oldImageView)
            [oldImageView removeFromSuperview];
    }];
    
    if (self.currentImageIndex == self.images.count - 1) {
        if (self.shouldLoop)
            self.currentImageIndex = -1;
        else
            [self.timer invalidate];
    }
}

@end
