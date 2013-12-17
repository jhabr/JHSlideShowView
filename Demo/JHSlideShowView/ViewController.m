//
//  ViewController.m
//  JHSlideShowView
//
//  Created by Jaro Habr on 17.12.2013.
//  Copyright (c) 2013 freshbits GmbH. All rights reserved.
//

#import "ViewController.h"
#import "JHSlideShowView.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet JHSlideShowView *slideShowView;
@end

@implementation ViewController
@synthesize slideShowView = _slideShowView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *images = @[[UIImage imageNamed:@"image1.png"],
                        [UIImage imageNamed:@"image2.png"],
                        [UIImage imageNamed:@"image3.png"]];
    
    [self.slideShowView animateWithImages:images
                             showDuration:8.f
                       transitionDuration:3.f
                                     loop:NO];
}

@end
