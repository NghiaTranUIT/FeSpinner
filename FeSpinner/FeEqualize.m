//
//  FeEqualize.m
//  FeSpinner
//
//  Created by Nghia Tran on 8/14/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeEqualize.h"
#import "UIColor+flat.h"
#import <QuartzCore/QuartzCore.h>

#define kFe_Equalize_Width 100.0f
#define kFe_Equalize_Height 50.0f

#define kFe_Equalize_Bar_Width 20.0f
#define kFe_Equalize_Bar_Height 50.0f

@interface FeEqualize ()
// Container View
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) CALayer *containerLayer;

// Bars
@property (strong, nonatomic) CAShapeLayer *firstBar;
@property (strong, nonatomic) CAShapeLayer *secondBar;
@property (strong, nonatomic) CAShapeLayer *thirdBar;
@property (strong, nonatomic) CAShapeLayer *fourthBar;
@property (strong, nonatomic) CAShapeLayer *fifthBar;

// Bezier path
@property (strong, nonatomic) UIBezierPath *originalBezierPath;
@property (strong, nonatomic) UIBezierPath *endBezierPath;

// Animation
@property (strong, nonatomic) CAKeyframeAnimation *firstAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *secondAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *thirdAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *fourthAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *fifthAnimation;

/////////
-(void) initCommon;
-(void) initContainerLayer;
-(void) initBars;
-(void) initBezierPath;
-(void) initAnimation;
@end

@implementation FeEqualize

-(instancetype) initWithView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        
        [self initCommon];
        
        [self initContainerLayer];
        
        [self initBars];
        
        //[self initAnimation];
    }
    return self;
}
-(void) initCommon
{
    _isShowing = NO;
    
    self.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    self.backgroundColor = [UIColor colorWithHexCode:@"#141517"];
}

-(void) initContainerLayer
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, kFe_Equalize_Width, kFe_Equalize_Height);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    [self.layer addSublayer:_containerLayer];
}
-(void) initBars
{
    // Original Path
    _originalBezierPath = [UIBezierPath bezierPath];
    [_originalBezierPath moveToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width / 2.0f, kFe_Equalize_Bar_Height - 2.0f)];
    [_originalBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_originalBezierPath closePath];
    
    // end Path
    _endBezierPath = [UIBezierPath bezierPath];
    [_endBezierPath moveToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width / 2.0f, 0)];
    [_endBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_endBezierPath closePath];
    
    for (NSInteger i = 0; i < 5 ; i++)
    {
        CGPoint origin = CGPointMake(kFe_Equalize_Bar_Width * i, 0);
        if (i == 0)
        {
            _firstBar = [CAShapeLayer layer];
            _firstBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Width, kFe_Equalize_Width);
            _firstBar.path = _endBezierPath.CGPath;
            _firstBar.fillColor = [UIColor colorWithHexCode:@"#0B486B"].CGColor;
            
            
            [_containerLayer addSublayer:_firstBar];
        }
        if (i == 1)
        {
            _secondBar = [CAShapeLayer layer];
            _secondBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _secondBar.fillColor = [UIColor colorWithHexCode:@"#3B8686"].CGColor;
            _secondBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_secondBar];
        }
        if (i == 2)
        {
            _thirdBar = [CAShapeLayer layer];
            _thirdBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _thirdBar.fillColor = [UIColor colorWithHexCode:@"#79BD9A"].CGColor;
            _thirdBar.path = _endBezierPath.CGPath;
            
            [_containerLayer addSublayer:_thirdBar];
        }
        if (i == 3)
        {
            _fourthBar = [CAShapeLayer layer];
            _fourthBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _fourthBar.fillColor = [UIColor colorWithHexCode:@"#A8DBA8"].CGColor;
            _fourthBar.path = _endBezierPath.CGPath;
            
            [_containerLayer addSublayer:_fourthBar];
        }
        if (i == 4)
        {
            _fifthBar = [CAShapeLayer layer];
            _fifthBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _fifthBar.fillColor = [UIColor colorWithHexCode:@"#CFF09E"].CGColor;
            _fifthBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_fifthBar];
        }
    }
}

-(void) initBezierPath
{
    
}
-(void) show
{
    if (_isShowing)
        return;
    
    _isShowing =  YES;
    

}
@end
