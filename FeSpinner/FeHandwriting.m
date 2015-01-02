//
//  FeHandwriting.m
//  FeSpinner
//
//  Created by Nghia Tran on 1/2/15.
//  Copyright (c) 2015 fe. All rights reserved.
//

#import "FeHandwriting.h"

@interface FeHandwriting ()
{
    
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
// Container
@property (weak, nonatomic) UIView *containerView;

// Shape
@property (strong, nonatomic) CAShapeLayer *loadingShapeLayer;
@property (strong, nonatomic) CAShapeLayer *dotShapeLayer;

// Animation
@property (strong, nonatomic) CAKeyframeAnimation *loadingKeyframeAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *dotKeyframeAnimation;

//////
-(void) initCommon;
-(void) initLoadingShapeLayer;
-(void) initAnimation;

@end

@implementation FeHandwriting

#pragma mark - Shapre
+(UIBezierPath *) loadingShapeBezierPath
{
    //// Color Declarations

    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(12, 55.14)];
    [bezier2Path addCurveToPoint: CGPointMake(28.72, 13) controlPoint1: CGPointMake(43.08, 14.19) controlPoint2: CGPointMake(30.3, 13.07)];
    [bezier2Path addCurveToPoint: CGPointMake(24.38, 16.51) controlPoint1: CGPointMake(27.14, 12.94) controlPoint2: CGPointMake(25.83, 14.46)];
    [bezier2Path addCurveToPoint: CGPointMake(18.65, 46.28) controlPoint1: CGPointMake(17.66, 26.3) controlPoint2: CGPointMake(17.53, 43.17)];
    [bezier2Path addCurveToPoint: CGPointMake(26.35, 57.19) controlPoint1: CGPointMake(19.77, 49.39) controlPoint2: CGPointMake(21.68, 56.4)];
    [bezier2Path addCurveToPoint: CGPointMake(35.77, 52.3) controlPoint1: CGPointMake(29.97, 57.79) controlPoint2: CGPointMake(33.46, 55.27)];
    [bezier2Path addCurveToPoint: CGPointMake(42.48, 43.43) controlPoint1: CGPointMake(38.07, 49.39) controlPoint2: CGPointMake(39.72, 45.88)];
    [bezier2Path addCurveToPoint: CGPointMake(52.62, 42.31) controlPoint1: CGPointMake(45.25, 40.99) controlPoint2: CGPointMake(49.79, 39.86)];
    [bezier2Path addCurveToPoint: CGPointMake(42.81, 43.43) controlPoint1: CGPointMake(49.33, 42.04) controlPoint2: CGPointMake(45.84, 42.04)];
    [bezier2Path addCurveToPoint: CGPointMake(38.01, 51.44) controlPoint1: CGPointMake(39.78, 44.82) controlPoint2: CGPointMake(37.41, 48.13)];
    [bezier2Path addCurveToPoint: CGPointMake(47.36, 56.27) controlPoint1: CGPointMake(38.73, 55.34) controlPoint2: CGPointMake(43.6, 57.52)];
    [bezier2Path addCurveToPoint: CGPointMake(54.47, 47.34) controlPoint1: CGPointMake(51.11, 55.01) controlPoint2: CGPointMake(53.61, 51.24)];
    [bezier2Path addCurveToPoint: CGPointMake(53.35, 41.71) controlPoint1: CGPointMake(54.86, 45.35) controlPoint2: CGPointMake(54.8, 43.04)];
    [bezier2Path addCurveToPoint: CGPointMake(48.94, 43.23) controlPoint1: CGPointMake(51.9, 40.39) controlPoint2: CGPointMake(48.8, 41.25)];
    [bezier2Path addCurveToPoint: CGPointMake(51.83, 45.75) controlPoint1: CGPointMake(49.07, 44.62) controlPoint2: CGPointMake(50.52, 45.42)];
    [bezier2Path addCurveToPoint: CGPointMake(62.7, 43.96) controlPoint1: CGPointMake(55.45, 46.54) controlPoint2: CGPointMake(59.21, 45.29)];
    [bezier2Path addCurveToPoint: CGPointMake(73.56, 42.37) controlPoint1: CGPointMake(66.19, 42.71) controlPoint2: CGPointMake(69.94, 41.45)];
    [bezier2Path addCurveToPoint: CGPointMake(78.5, 50.84) controlPoint1: CGPointMake(77.18, 43.3) controlPoint2: CGPointMake(80.14, 47.47)];
    [bezier2Path addCurveToPoint: CGPointMake(68.95, 42.04) controlPoint1: CGPointMake(78.1, 46.08) controlPoint2: CGPointMake(73.69, 41.98)];
    [bezier2Path addCurveToPoint: CGPointMake(60.39, 51.5) controlPoint1: CGPointMake(64.21, 42.18) controlPoint2: CGPointMake(59.93, 46.74)];
    [bezier2Path addCurveToPoint: CGPointMake(70.66, 58.65) controlPoint1: CGPointMake(60.85, 56.27) controlPoint2: CGPointMake(66.05, 60.04)];
    [bezier2Path addCurveToPoint: CGPointMake(77.25, 46.01) controlPoint1: CGPointMake(75.6, 57.19) controlPoint2: CGPointMake(77.9, 51.17)];
    [bezier2Path addCurveToPoint: CGPointMake(77.77, 56.8) controlPoint1: CGPointMake(76.06, 48.13) controlPoint2: CGPointMake(76.26, 54.94)];
    [bezier2Path addCurveToPoint: CGPointMake(84.29, 58.65) controlPoint1: CGPointMake(79.29, 58.65) controlPoint2: CGPointMake(82.05, 59.44)];
    [bezier2Path addCurveToPoint: CGPointMake(90.55, 48.06) controlPoint1: CGPointMake(87.19, 57.66) controlPoint2: CGPointMake(88.83, 50.64)];
    [bezier2Path addCurveToPoint: CGPointMake(97.85, 43.3) controlPoint1: CGPointMake(92.26, 45.48) controlPoint2: CGPointMake(94.83, 42.84)];
    [bezier2Path addCurveToPoint: CGPointMake(103.84, 51.17) controlPoint1: CGPointMake(101.28, 43.83) controlPoint2: CGPointMake(102.86, 47.8)];
    [bezier2Path addCurveToPoint: CGPointMake(96.08, 43.5) controlPoint1: CGPointMake(104.04, 47.07) controlPoint2: CGPointMake(100.16, 43.23)];
    [bezier2Path addCurveToPoint: CGPointMake(89.36, 52.17) controlPoint1: CGPointMake(91.99, 43.76) controlPoint2: CGPointMake(88.64, 48.06)];
    [bezier2Path addCurveToPoint: CGPointMake(98.71, 57.92) controlPoint1: CGPointMake(90.08, 56.2) controlPoint2: CGPointMake(94.76, 59.11)];
    [bezier2Path addCurveToPoint: CGPointMake(106.15, 45.48) controlPoint1: CGPointMake(103.58, 56.47) controlPoint2: CGPointMake(105.49, 50.58)];
    [bezier2Path addCurveToPoint: CGPointMake(104.31, 16.57) controlPoint1: CGPointMake(107.4, 35.83) controlPoint2: CGPointMake(106.74, 25.97)];
    [bezier2Path addCurveToPoint: CGPointMake(103.71, 50.25) controlPoint1: CGPointMake(102.33, 27.69) controlPoint2: CGPointMake(102.13, 39.07)];
    [bezier2Path addCurveToPoint: CGPointMake(108.85, 60.04) controlPoint1: CGPointMake(104.24, 54.02) controlPoint2: CGPointMake(105.43, 58.38)];
    [bezier2Path addCurveToPoint: CGPointMake(119.38, 55.54) controlPoint1: CGPointMake(112.67, 61.89) controlPoint2: CGPointMake(117.34, 59.24)];
    [bezier2Path addCurveToPoint: CGPointMake(121.23, 43.1) controlPoint1: CGPointMake(121.36, 51.83) controlPoint2: CGPointMake(121.36, 47.34)];
    [bezier2Path addCurveToPoint: CGPointMake(120.3, 54.81) controlPoint1: CGPointMake(120.24, 46.94) controlPoint2: CGPointMake(119.19, 50.97)];
    [bezier2Path addCurveToPoint: CGPointMake(129.13, 60.7) controlPoint1: CGPointMake(121.36, 58.65) controlPoint2: CGPointMake(125.37, 61.96)];
    [bezier2Path addCurveToPoint: CGPointMake(134.2, 52.23) controlPoint1: CGPointMake(132.42, 59.64) controlPoint2: CGPointMake(134, 55.74)];
    [bezier2Path addCurveToPoint: CGPointMake(134.26, 41.78) controlPoint1: CGPointMake(134.39, 48.73) controlPoint2: CGPointMake(133.6, 45.22)];
    [bezier2Path addCurveToPoint: CGPointMake(135.91, 62.09) controlPoint1: CGPointMake(133.08, 48.53) controlPoint2: CGPointMake(133.67, 55.61)];
    [bezier2Path addCurveToPoint: CGPointMake(136.96, 47.93) controlPoint1: CGPointMake(136.24, 57.39) controlPoint2: CGPointMake(136.63, 52.63)];
    [bezier2Path addCurveToPoint: CGPointMake(138.54, 43.3) controlPoint1: CGPointMake(137.09, 46.28) controlPoint2: CGPointMake(137.29, 44.36)];
    [bezier2Path addCurveToPoint: CGPointMake(145.65, 46.74) controlPoint1: CGPointMake(140.91, 41.25) controlPoint2: CGPointMake(144.8, 43.7)];
    [bezier2Path addCurveToPoint: CGPointMake(145.65, 56.13) controlPoint1: CGPointMake(146.51, 49.78) controlPoint2: CGPointMake(145.59, 53.03)];
    [bezier2Path addCurveToPoint: CGPointMake(149.41, 62.55) controlPoint1: CGPointMake(145.72, 58.78) controlPoint2: CGPointMake(146.84, 61.89)];
    [bezier2Path addCurveToPoint: CGPointMake(155.46, 58.98) controlPoint1: CGPointMake(151.84, 63.21) controlPoint2: CGPointMake(154.34, 61.23)];
    [bezier2Path addCurveToPoint: CGPointMake(157.83, 51.7) controlPoint1: CGPointMake(156.65, 56.73) controlPoint2: CGPointMake(156.91, 54.08)];
    [bezier2Path addCurveToPoint: CGPointMake(164.68, 44.82) controlPoint1: CGPointMake(159.08, 48.59) controlPoint2: CGPointMake(161.52, 45.88)];
    [bezier2Path addCurveToPoint: CGPointMake(173.77, 47.27) controlPoint1: CGPointMake(167.84, 43.76) controlPoint2: CGPointMake(171.66, 44.62)];
    [bezier2Path addCurveToPoint: CGPointMake(173.04, 56.27) controlPoint1: CGPointMake(175.87, 49.92) controlPoint2: CGPointMake(175.67, 54.15)];
    [bezier2Path addCurveToPoint: CGPointMake(173.11, 44.69) controlPoint1: CGPointMake(175.94, 53.22) controlPoint2: CGPointMake(175.94, 47.87)];
    [bezier2Path addCurveToPoint: CGPointMake(161.59, 43.43) controlPoint1: CGPointMake(170.28, 41.51) controlPoint2: CGPointMake(165.07, 41.05)];
    [bezier2Path addCurveToPoint: CGPointMake(158.43, 54.75) controlPoint1: CGPointMake(158.1, 45.81) controlPoint2: CGPointMake(156.78, 50.84)];
    [bezier2Path addCurveToPoint: CGPointMake(171.4, 59.57) controlPoint1: CGPointMake(160.47, 59.51) controlPoint2: CGPointMake(166.79, 61.89)];
    [bezier2Path addCurveToPoint: CGPointMake(175.48, 46.28) controlPoint1: CGPointMake(176, 57.26) controlPoint2: CGPointMake(178.05, 50.78)];
    [bezier2Path addCurveToPoint: CGPointMake(177.65, 85.97) controlPoint1: CGPointMake(176.2, 59.51) controlPoint2: CGPointMake(176.93, 72.74)];
    [bezier2Path addCurveToPoint: CGPointMake(175.48, 92.59) controlPoint1: CGPointMake(177.78, 88.42) controlPoint2: CGPointMake(177.65, 91.39)];
    [bezier2Path addCurveToPoint: CGPointMake(168.43, 88.29) controlPoint1: CGPointMake(172.78, 94.11) controlPoint2: CGPointMake(169.62, 91.2)];
    [bezier2Path addCurveToPoint: CGPointMake(173.24, 66.52) controlPoint1: CGPointMake(165.4, 81.01) controlPoint2: CGPointMake(167.38, 71.88)];
    [bezier2Path addCurveToPoint: CGPointMake(183.64, 59.31) controlPoint1: CGPointMake(176.33, 63.68) controlPoint2: CGPointMake(180.35, 61.96)];
    [bezier2Path addCurveToPoint: CGPointMake(188.84, 48.46) controlPoint1: CGPointMake(186.93, 56.66) controlPoint2: CGPointMake(189.7, 52.63)];
    
    return bezier2Path;
}
+(UIBezierPath *) dotShapeBezierPath
{
    UIColor* color0 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    
    [bezier4Path moveToPoint: CGPointMake(124.76, 27.14)];
    [bezier4Path addCurveToPoint: CGPointMake(118.51, 27.69) controlPoint1: CGPointMake(123.13, 25.41) controlPoint2: CGPointMake(119.79, 25.69)];
    [bezier4Path addCurveToPoint: CGPointMake(120.85, 33.33) controlPoint1: CGPointMake(117.23, 29.68) controlPoint2: CGPointMake(118.51, 32.71)];
    [bezier4Path addCurveToPoint: CGPointMake(125.26, 31.68) controlPoint1: CGPointMake(122.49, 33.74) controlPoint2: CGPointMake(124.34, 33.06)];
    [bezier4Path addCurveToPoint: CGPointMake(124.76, 27.14) controlPoint1: CGPointMake(126.18, 30.3) controlPoint2: CGPointMake(125.9, 28.37)];
    
    
    
    return bezier4Path;
}

#pragma marl - Init
-(instancetype) initWithView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        self.frame = CGRectMake(0, 0, 200, 100);
        self.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height  /2);
        
        _containerView = view;
        
        [self initCommon];
        
        [self initLoadingShapeLayer];
        
        [self initAnimation];
    }
    return self;
}
-(void) initCommon
{
    _isShowing = NO;
    self.backgroundColor = [UIColor clearColor];
}
-(void) initLoadingShapeLayer
{
    // Loading Shape
    UIBezierPath *loadingBezierpath = [FeHandwriting loadingShapeBezierPath];
    _loadingShapeLayer = [CAShapeLayer layer];
    _loadingShapeLayer.frame = self.bounds;
    _loadingShapeLayer.path = loadingBezierpath.CGPath;
    _loadingShapeLayer.strokeEnd = 0;
    _loadingShapeLayer.strokeColor = [UIColor blackColor].CGColor;
    _loadingShapeLayer.fillColor = [UIColor clearColor].CGColor;
    _loadingShapeLayer.lineWidth = 2.5f;
    _loadingShapeLayer.lineCap = kCALineCapRound;
    _loadingShapeLayer.lineJoin = kCALineJoinRound;

    
    // Dot Shape
    UIBezierPath *dotBezierPath = [FeHandwriting dotShapeBezierPath];
    _dotShapeLayer = [CAShapeLayer layer];
    _dotShapeLayer.frame = self.bounds;
    _dotShapeLayer.path = dotBezierPath.CGPath;
    _dotShapeLayer.strokeEnd = 0;
    _dotShapeLayer.strokeColor = [UIColor blackColor].CGColor;
    _dotShapeLayer.fillColor = [UIColor clearColor].CGColor;
    _dotShapeLayer.lineWidth = 2.5f;
    _dotShapeLayer.lineCap = kCALineCapRound;
    _dotShapeLayer.lineJoin = kCALineJoinRound;
    
    // Add
    [self.layer addSublayer:_loadingShapeLayer];
    [self.layer addSublayer:_dotShapeLayer];
}
-(void) initAnimation
{
    // Loading
    _loadingKeyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    _loadingKeyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _loadingKeyframeAnimation.keyTimes = @[@0.0f, @0.6f, @1.0f];
    _loadingKeyframeAnimation.values =  @[@0.0f, @1.0f, @1.0f];
    _loadingKeyframeAnimation.duration = 4.0f;
    _loadingKeyframeAnimation.repeatCount = CGFLOAT_MAX;
    
    // Dot
    _dotKeyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    _dotKeyframeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _dotKeyframeAnimation.keyTimes = @[@0.0f, @0.6f, @0.65f, @1.0f];
    _dotKeyframeAnimation.values =  @[@0.0f, @0.0f, @1.0f, @1.0f];
    _dotKeyframeAnimation.duration = 4.0f;
    _dotKeyframeAnimation.repeatCount = CGFLOAT_MAX;
}

#pragma mark - ACtion
-(void) show
{
    if (_isShowing)
    {
        return;
    }
    
    _isShowing = YES;
    
    [_loadingShapeLayer addAnimation:_loadingKeyframeAnimation forKey:@"stoke"];
    [_dotShapeLayer addAnimation:_dotKeyframeAnimation forKey:@"stoke"];
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
