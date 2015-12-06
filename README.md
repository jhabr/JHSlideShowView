# JHSlideShowView

![Pod Version](https://img.shields.io/cocoapods/v/JHSlideShowView.svg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/JHSlideShowView.svg?style=flat)
![Pod Platform](https://img.shields.io/cocoapods/p/JHSlideShowView.svg?style=flat)

`JHSlideShowView` is a customizable slideshow view for iOS.

![JHSlideShowView](/Assets/slideshow_s.gif)

## Installation

### From CocoaPods
Add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'JHSlideShowView', '~> 1.0'
```

Then install `JHSlideShowView` into your project by executing the following code:

```ruby
pod install
```

### Manual
Drag the `JHSlideShowView` folder into your project.

## Usage

(see sample Xcode project in `/Demo`)

Initialize the `JHSlideShowView` in the `viewDidLoad` method of your controller:

###### Objective-C
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

If you're using Swift, don't forget to add an [Objective-C bridging header](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html#//apple_ref/doc/uid/TP40014216-CH10-ID122) to your project's ``build settings``.

###### Swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    let images: Array<UIImage!> = [
        UIImage(named: "image1.png"),
        UIImage(named: "image2.png"),
        UIImage(named: "image3.png")
    ]
    
    self.slideShowView.animateWithImages(images, showDuration: 8, transitionDuration: 3, loop: true)
}
```
