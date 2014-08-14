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

@interface FeHourGlass ()
{
    CGFloat width;
    CGFloat height;
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
    _containerLayer.backgroundColor = [UIColor blackColor].CGColor;
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
    _topLayer.position = CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
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
    
    //[_containerLayer addSublayer:_bottomLayer];
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
  
    [_containerLayer addSublayer:_lineLayer];
}
-(void) initAnimation
{
    if (YES) // Top Animation
    {
        _topAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        _topAnimation.duration = 5.0f;
        _topAnimation.repeatCount = MAXFLOAT;
        _topAnimation.keyTimes = @[@0.0f, @0.9f, @1.0f];
        _topAnimation.values = @[(id)[NSValue valueWithCATransform3D:CATransform3DIdentity],
                                 (id)[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0f, 0.0f, 0.0f)],
                                 (id)[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0f, 0.0f, 0.0f)]];
    }
}
#pragma mark - Action
-(void) show
{
    if (_isShowing)
        return;
    
    _isShowing =  YES;
    
    [_topLayer addAnimation:_topAnimation forKey:@"TopAnimatin"];
    
}
-(void) dismiss
{
    
}
@end
