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
    [self.timer invalidate];
    
    self.images = images;
    self.shouldLoop = shouldLoop;
    self.currentImageIndex = -1;
    self.transitionSeconds = transitionSeconds;
    
    if(images.count) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:showSeconds
                                                      target:self
                                                    selector:@selector(showNextImage)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.timer fire];
    }
    else {
        UIImageView *currentImageView = self.subviews.lastObject;
        currentImageView.image = nil;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.subviews.lastObject setFrame:self.bounds];
}
- (void)setContentMode:(UIViewContentMode)contentMode
{
    [self.subviews.lastObject setContentMode:contentMode];
    [super setContentMode:contentMode];
}

- (void)showNextImage
{
    UIImageView *nextImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    nextImageView.contentMode = self.contentMode;
    UIImageView *currentImageView = self.subviews.lastObject;
    
    UIImage *nextImage = self.images[++self.currentImageIndex];
    nextImageView.image = nextImage;

    if (currentImageView) {
        nextImageView.alpha = 0.f;
    }
    [self addSubview:nextImageView];
    
    [UIView animateWithDuration:self.transitionSeconds animations:^{
        if (currentImageView) {
            currentImageView.alpha = 0.f;
            nextImageView.alpha = 1.f;
        }
    } completion:^(BOOL finished) {
        if (finished && currentImageView) {
            [currentImageView removeFromSuperview];
        }
    }];
    
    if (self.currentImageIndex == self.images.count - 1) {
        if (self.shouldLoop) {
            self.currentImageIndex = -1;
        }
        else {
            [self.timer invalidate];
        }
    }
}

@end
