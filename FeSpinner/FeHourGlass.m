//
//  FeCandyLoader.m
//  FeSpinner
//
//  Created by Nghia Tran on 8/14/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeHourGlass.h"
#import "UIColor+flat.h"
#import <QuartzCore/QuartzCore.h>

#define kFe_HourGlass_Length 30.0f
#define kFe_HourGlass_Duration 3.5f

@interface FeHourGlass ()
{
    CGFloat width;
    CGFloat height;
    
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
// Top
@property (strong, nonatomic) CAShapeLayer *topLayer;

// Bottom
@property (strong, nonatomic) CAShapeLayer *bottomLayer;

// Dash line
@property (strong, nonatomic) CAShapeLayer *lineLayer;

// container Layer
@property (strong, nonatomic) CALayer *containerLayer;

// Container view
@property (weak, nonatomic) UIView *containerView;

// Animaiton
@property (strong, nonatomic) CAKeyframeAnimation *topAnimation;

@property (strong, nonatomic) CAKeyframeAnimation *bottomAnimation;

@property (strong, nonatomic) CAKeyframeAnimation *lineAnimation;

@property(strong, nonatomic) CAKeyframeAnimation *containerAnimation;

///////////
// Init
-(void) initCommon;
-(void) initContainer;
-(void) initTop;
-(void) initBottom;
-(void) initLine;
-(void) initAnimation;
@end

@implementation FeHourGlass

-(instancetype) initWithView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        
        [self initCommon];
        
        [self initContainer];
        
        [self initTop];
        
        [self initBottom];
        
        [self initLine];
        
        [self initAnimation];
    }
    return self;
}
-(void) initCommon
{
    _isShowing = NO;
    
    self.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    self.backgroundColor = [UIColor colorWithHexCode:@"#DB7769"];
    
    width = sqrtf(kFe_HourGlass_Length * kFe_HourGlass_Length + kFe_HourGlass_Length * kFe_HourGlass_Length);
    height = sqrtf((kFe_HourGlass_Length * kFe_HourGlass_Length) - ((width / 2.0f) * (width / 2.0f)));
}
-(void) initContainer
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, width, height * 2);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

    [self.layer addSublayer:_containerLayer];
}
-(void) initTop
{
    // BezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(width / 2.0f, height)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    [path closePath];
    
    // Top Layer
    _topLayer = [CAShapeLayer layer];
    _topLayer.frame = CGRectMake(0, 0, width, height);
    _topLayer.path = path.CGPath;
    _topLayer.fillColor = [UIColor whiteColor].CGColor;
    _topLayer.strokeColor = [UIColor whiteColor].CGColor;
    _topLayer.lineWidth = 0.0f;
    _topLayer.anchorPoint = CGPointMake(0.5f, 1);
    _topLayer.position = CGPointMake(width / 2.0f, height);
    
    [_containerLayer addSublayer:_topLayer];
}
-(void) initBottom
{
    // BezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width / 2, 0)];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height )];
    [path addLineToPoint:CGPointMake(width / 2, 0)];
    
    [path closePath];
    
    // Top Layer
    _bottomLayer = [CAShapeLayer layer];
    _bottomLayer.frame = CGRectMake(0, height, width, height);
    _bottomLayer.path = path.CGPath;
    _bottomLayer.fillColor = [UIColor whiteColor].CGColor;
    _bottomLayer.strokeColor = [UIColor whiteColor].CGColor;
    _bottomLayer.lineWidth = 0.0f;
    _bottomLayer.anchorPoint = CGPointMake(0.5f, 1.0f);
    _bottomLayer.position = CGPointMake(width / 2.0f, height * 2.0f);
    _bottomLayer.transform = CATransform3DMakeScale(0, 0, 0);
    
    [_containerLayer addSublayer:_bottomLayer];
}
-(void) initLine
{
    // BezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width / 2, 0)];
    [path addLineToPoint:CGPointMake(width / 2, height)];
    
    // Line Layer
    _lineLayer = [CAShapeLayer layer];
    _lineLayer.frame = CGRectMake(0, height, width, height);
    _lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    _lineLayer.lineWidth = 1.0;
    _lineLayer.lineJoin = kCALineJoinMiter;
    _lineLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1], nil];
    _lineLayer.lineDashPhase = 3.0f;
    _lineLayer.path = path.CGPath;
    _lineLayer.strokeEnd = 0.0f;
    
    [_containerLayer addSublayer:_lineLayer];
}
-(void) initAnimation
{
    if (YES) // Top Animation
    {
        _topAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _topAnimation.duration = kFe_HourGlass_Duration;
        _topAnimation.repeatCount = HUGE_VAL;
        _topAnimation.keyTimes = @[@0.0f, @0.9f, @1.0f];
        _topAnimation.values = @[@1.0f, @0.0f, @0.0f];
    }
    if (YES) // Bottom Animation
    {
        _bottomAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _bottomAnimation.duration = kFe_HourGlass_Duration;
        _bottomAnimation.repeatCount = HUGE_VAL;
        _bottomAnimation.keyTimes = @[@0.1f, @0.9f, @1.0f];
        _bottomAnimation.values = @[@0.0f, @1.0f, @1.0f];
    }
    if (YES) // Bottom Animation
    {
        _lineAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        _lineAnimation.duration = kFe_HourGlass_Duration;
        _lineAnimation.repeatCount = HUGE_VAL;
        _lineAnimation.keyTimes = @[@0.0f, @0.1f, @0.9f, @1.0f];
        _lineAnimation.values = @[@0.0f, @1.0f, @1.0f, @1.0f];
    }
    if (YES) // Container Animation
    {
        _containerAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        _containerAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2f :1 :0.8f :0.0f];
        _containerAnimation.duration = kFe_HourGlass_Duration;
        _containerAnimation.repeatCount = HUGE_VAL;
        _containerAnimation.keyTimes = @[@0.8f, @1.0f];
        _containerAnimation.values = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:M_PI]];
        //_containerAnimation.calculationMode = kCAAnimationCubic;
    }
}
#pragma mark - Action
-(void) show
{
    if (_isShowing)
        return;
    
    _isShowing =  YES;
    
    [_topLayer addAnimation:_topAnimation forKey:@"TopAnimatin"];
    [_bottomLayer addAnimation:_bottomAnimation forKey:@"BottomAnimation"];
    [_lineLayer addAnimation:_lineAnimation forKey:@"LineAnimation"];
    [_containerLayer addAnimation:_containerAnimation forKey:@"ContainerAnimation"];
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
