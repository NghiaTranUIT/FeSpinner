FeSpinner
======================

The collection Spinner for iOS app.

======================
REQUIREMENT

FeSpinner work on any version iOS and compatible with ARC or non-ARC.
But your project should include some Apple's framework.

+ Foundation.framework
+ UIKit.framework
+ CoreGraphics.framework
+ QuartzCore.framework

======================
ADD FESPINNER TO YOUR PROJECT

Just simply copy file .h and .m in each type spinner you like.

======================
HOW TO USE

FeSpinner is very similar MBProgessHUB.

FeSpinner have some helpful method.

-(id) initWithView:(UIView *) view blur:(BOOL) blur backgroundColors:(NSArray *) arrColor;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;

