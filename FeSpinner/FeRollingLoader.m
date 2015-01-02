//
//  FeRollingLoader.m
//  FeSpinner
//
//  Created by Nghia Tran on 8/18/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeRollingLoader.h"
#import "UIColor+flat.h"

#define kFe_Color_DarkShalmon @"E9967A"
#define kFe_Circle_Width 120
#define kFe_Color_Salmon @"#FA8072"

@interface FeRollingLoader ()
{
    NSString *_title;
    
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
// Container
@property (weak, nonatomic) UIView *containerView;

// Circle
@property (strong, nonatomic) CAShapeLayer *circleLayer;

// Group
@property (strong, nonatomic) CAKeyframeAnimation *keyframePath;
@property (strong, nonatomic) CAKeyframeAnimation *keyframeBackground;
@property (strong, nonatomic) CABasicAnimation *animationTransfrom;

// Keyframe
@property (strong, nonatomic) CAAnimationGroup *groupAnimation;

//////
-(void) initCommon;
-(void) initCircle;
-(void) initAnimation;
@end
@implementation FeRollingLoader
-(instancetype) initWithView:(UIView *)view title:(NSString *)title
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        _title = title;
        
        [self initCommon];
        
        [self initCircle];
        
        [self initAnimation];
    }
    return self;
}
-(void) initCommon
{
    _isShowing = NO;
    self.frame = _containerView.bounds;
    self.backgroundColor = [UIColor colorWithHexCode:@"#FEEADF"];
}
-(void) initCircle
{
    // Circle
    _circleLayer = [CAShapeLayer layer];
    _circleLayer.frame = CGRectMake(0, 0, kFe_Circle_Width, kFe_Circle_Width);
    _circleLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _circleLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    //_circleLayer.backgroundColor = [UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;
    
    // Shape
    CGFloat length = kFe_Circle_Width / 2.0f;
    CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.85f * length topRight:0.95f * length bottomLeft:0.85f * length bottomRight:0.95f * length];
    
    // Set Path
    _circleLayer.path = path;
    _circleLayer.masksToBounds = YES;
    _circleLayer.fillColor = [UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;

    
    // Add
    [self.layer addSublayer:_circleLayer];
}

-(void) initAnimation
{
    if (YES) // Path
    {
        // Path 0
        CGFloat length = kFe_Circle_Width / 2;
        CGPathRef path_0 = [self pathRefForCornerRectWithTopLeftRadius:0.65f * length topRight:0.85f * length bottomLeft:0.85f * length bottomRight:0.65f * length];
        
        // Path 25
        CGPathRef path_25 = [self pathRefForCornerRectWithTopLeftRadius:0.75f * length topRight:0.85f * length bottomLeft:0.85f * length bottomRight:0.75f * length];

        // Path 50
        CGPathRef path_50 = [self pathRefForCornerRectWithTopLeftRadius:0.95f * length topRight:0.75f * length bottomLeft:0.75f * length bottomRight:0.95f * length];

        // Path 75
        CGPathRef path_75 = [self pathRefForCornerRectWithTopLeftRadius:0.95f * length topRight:0.95f * length bottomLeft:0.95f * length bottomRight:0.95f * length];
        
        // Paht 1-00
        CGPathRef path_100 = [self pathRefForCornerRectWithTopLeftRadius:0.65f * length topRight:0.85f * length bottomLeft:0.85f * length bottomRight:0.65f * length];
        
        _keyframePath = [CAKeyframeAnimation animationWithKeyPath:@"path"];
        _keyframePath.keyTimes = @[@0.0f, @0.25f, @0.5f, @0.75f, @1.0f];
        _keyframePath.values = @[(__bridge id) path_0, (__bridge id) path_25, (__bridge id) path_50, (__bridge id) path_75, (__bridge id) path_100];
        _keyframePath.duration = 1.3f;
        _keyframePath.repeatCount = MAXFLOAT;
    }
    
    if (YES) // Background
    {
        _keyframeBackground = [CAKeyframeAnimation animationWithKeyPath:@"fillColor"];
        _keyframeBackground.keyTimes = @[@0.0f, @0.25f, @0.5f, @0.75f, @1.0f];
        _keyframeBackground.values = @[(id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor,
                                       (id)[UIColor colorWithHexCode:kFe_Color_Salmon].CGColor,
                                       (id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor,
                                       (id)[UIColor colorWithHexCode:kFe_Color_Salmon].CGColor,
                                       (id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor];
        _keyframeBackground.duration = 1.3f;
        _keyframeBackground.repeatCount = MAXFLOAT;
    }
    
    if (YES)// Transfrom
    {
        _animationTransfrom = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        [_animationTransfrom setFromValue:[NSNumber numberWithDouble:0.0f]];
        [_animationTransfrom setToValue:[NSNumber numberWithDouble:(M_PI * 2.0f)]];
    }
    
    
    
    // Group
    _groupAnimation = [CAAnimationGroup animation];
    _groupAnimation.duration = 1.3f;
    _groupAnimation.repeatCount = MAXFLOAT;
    _groupAnimation.animations = @[_keyframePath, _keyframeBackground, _animationTransfrom];
    
}
#pragma mark - Private
-(CGPathRef) pathRefForCornerRectWithTopLeftRadius:(CGFloat) topLeftRadius topRight:(CGFloat) topRightRadius bottomLeft:(CGFloat) bottomLeftRadius bottomRight:(CGFloat) bottomRightRadius
{

    
    CGRect rect = CGRectMake(0, 0, kFe_Circle_Width, kFe_Circle_Width);
    
    CGFloat minx = CGRectGetMinX( rect );
    CGFloat midx = CGRectGetMidX( rect );
    CGFloat maxx = CGRectGetMaxX( rect );
    CGFloat miny = CGRectGetMinY( rect );
    CGFloat midy = CGRectGetMidY( rect );
    CGFloat maxy = CGRectGetMaxY( rect );
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, minx, midy);
    CGPathAddArcToPoint(pathRef, NULL, minx, miny, midx, miny, bottomLeftRadius);
    CGPathAddArcToPoint(pathRef, NULL, maxx, miny, maxx, midy, bottomRightRadius);
    CGPathAddArcToPoint(pathRef, NULL, maxx, maxy, midx, maxy, topRightRadius);
    CGPathAddArcToPoint(pathRef, NULL, minx, maxy, minx, midy, topLeftRadius);
    
    return pathRef;
}

-(void) show
{
    if (_isShowing)
    {
        return;
    }
    
    _isShowing = YES;
    [_circleLayer addAnimation:_groupAnimation forKey:@"rolling"];
}
-(void) dismiss
{
    if (!_isShowing)
        return;
    
    _isShowing = NO;
    
}
-(void) showWhileExecutingBlock:(dispatch_block_t)block
{
    [self showWhileExecutingBlock:block completion:nil];
}
-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object
{
    [self showWhileExecutingSelector:selector onTarget:target withObject:object completion:nil];
    
}
-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t)completion
{
    // Check block != nil
    if (block != nil)
    {
        [self show];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
                       {
                           block();
                           
                           // Update UI
                           dispatch_async(dispatch_get_main_queue(), ^{
                               completion();
                               [self dismiss];
                           });
                       });
    }
}
-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t)completion
{
    // Check Selector is responded
    if ([target respondsToSelector:selector])
    {
        methodForExecuting = selector;
        targetForExecuting = target;
        objectForExecuting = object;
        completionBlock = completion;
        
        [self show];
        [NSThread detachNewThreadSelector:@selector(executingMethod) toTarget:self withObject:nil];
    }
}
#pragma mark Helper method
-(void) executingMethod
{
    @autoreleasepool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        // Start executing the requested task
        [targetForExecuting performSelector:methodForExecuting withObject:objectForExecuting];
#pragma clang diagnostic pop
        // Task completed, update view in main thread (note: view operations should
        // be done only in the main thread)
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock();
            [self performSelectorOnMainThread:@selector(cleanUp) withObject:nil waitUntilDone:NO];
        });
        
    }
}
-(void) cleanUp
{
    NSLog(@"Clean up");
    if (objectForExecuting)
        objectForExecuting = nil;
    if (methodForExecuting)
        methodForExecuting = nil;
    if (targetForExecuting)
        targetForExecuting = nil;
    if (completionBlock)
        completionBlock = nil;
    [self dismiss];
}
@end
