FeSpinner
======================

The collection Spinner for iOS app.

![](http://nghiatran.me/wp-content/uploads/2015/01/iTunesArtwork.png "Rocket Loader Collection")

======================
## REQUIREMENT
FeSpinner work on any version iOS and compatible with ARC or non-ARC.
But your project should include some Apple's framework.

+ Foundation.framework
+ UIKit.framework
+ CoreGraphics.framework
+ QuartzCore.framework

=======================
## Sreenshot

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

======================
## ADD FESPINNER TO YOUR PROJECT

Just simply copy file .h and .m in each type spinner you like.

======================
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

