## Rocket Loader Collection

The loader collection for iOS app.

![](http://nghiatran.me/wp-content/uploads/2015/01/iTunesArtwork.png "Rocket Loader Collection")

## REQUIREMENT
FeSpinner work on any version iOS and compatible with ARC or non-ARC.
But your project should include some Apple's framework.

+ Foundation.framework
+ UIKit.framework
+ CoreGraphics.framework
+ QuartzCore.framework

## Sreenshot

**Handwriting Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/Handwriting.gif)

**Rolling Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/RollingLoader.gif)

**Equalizer Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/EqualizerLoader.gif)

**Hourglass Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/HourGlassLoader.gif)

**Wifihub Loader** : Here is loader which i created for my friend few month ago. Wifi Chùa - http://www.wifichuaapp.com.

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/WifiHubLoader.gif)

**Threedots Glow**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/TheeDotGlow.gif)

**Vietnam Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/VietnamLoader.gif)

**Loading Box Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/LoadingBox.gif)

**Ten Dots Loader**

![GIF](http://nghiatran.me/wp-content/uploads/2015/01/TenDot.gif)

## ADD ROCKET LOADER TO YOUR PROJECT

Just simply copy file .h and .m in each type loader you like.

##  HOW TO USE

FeSpinner is very similar MBProgessHUB.

FeSpinner have some helpful method.

```objc
-(id) initWithView:(UIView *) view blur:(BOOL) blur backgroundColors:(NSArray *) arrColor;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;
```
## MIT License
Copyright (c) 2014 Nghia Tran

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Release notes

Version 1.0

Initial release
