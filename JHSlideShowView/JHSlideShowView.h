//
//  SlideShowView.h
//  PathShare
//
//  Created by Jaro Habr on 30.11.2013.
//  Copyright (c) 2013 freshbits GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHSlideShowView : UIView

- (void)animateWithImages:(NSArray *)images showDuration:(float)showSeconds transitionDuration:(float)transitionSeconds loop:(BOOL)shouldLoop;

@end
