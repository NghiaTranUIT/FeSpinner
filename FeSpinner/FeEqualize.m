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
        
        [self initAnimation];
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
    [_originalBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height - 2.0f)];
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
        if (i == 0)
        {
            _firstBar = [CAShapeLayer layer];
            _firstBar.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        }
        if (i == 1)
        {
            
        }
        if (i == 2)
        {
            
        }
        if (i == 3)
        {
            
        }
        if (i == 4)
        {
            
        }
    }
}

-(void) initBezierPath
{
    
}
@end
