# JHSlideShowView

JHSlideShowView is a customizable slideshow view for iOS.

![JHSlideShowView](https://dl.dropboxusercontent.com/u/2024214/slideshow_s.gif)

## Installation

### From CocoaPods
Add pod `JHSlideShowView` to your Podfile.

### Manual
Drag the `JHSlideShowView` folder into your project.

## Usage

(see sample Xcode project in `/Demo`)

Initialize the `JHSlideShowView` in the `viewDidLoad` method of your controller:

```objective-c
#import "JHSlideShowView.h"

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *images = @[[UIImage imageNamed:@"image1.png"],
                        [UIImage imageNamed:@"image2.png"],
                        [UIImage imageNamed:@"image3.png"]];

    [self.slideShowView animateWithImages:images
                             showDuration:8.f
                       transitionDuration:3.f
                                     loop:YES];
}
```