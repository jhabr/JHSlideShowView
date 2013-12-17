# JHSlideShowView

JHSlideShowView is a customizable slideshow view for iOS.

## Installation

* Drag the `JHSlideShowView` folder into your project.

## Usage

(see sample Xcode project in `/Demo`)

Initialize the `JHSlideShowView` in the `viewDidLoad` method of your controller:

```objective-c
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