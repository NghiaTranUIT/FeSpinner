//
//  FeZeroLoader.m
//  FeSpinner
//
//  Created by Nghia Tran on 8/17/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeZeroLoader.h"
#import "UIColor+flat.h"

#define CATransform3DPerspective(t, x, y) (CATransform3DConcat(t, CATransform3DMake(1, 0, 0, x, 0, 1, 0, y, 0, 0, 1, 0, 0, 0, 0, 1)))
#define CATransform3DMakePerspective(x, y) (CATransform3DPerspective(CATransform3DIdentity, x, y))

CG_INLINE CATransform3D
CATransform3DMake(CGFloat m11, CGFloat m12, CGFloat m13, CGFloat m14,
				  CGFloat m21, CGFloat m22, CGFloat m23, CGFloat m24,
				  CGFloat m31, CGFloat m32, CGFloat m33, CGFloat m34,
				  CGFloat m41, CGFloat m42, CGFloat m43, CGFloat m44)
{
	CATransform3D t;
	t.m11 = m11; t.m12 = m12; t.m13 = m13; t.m14 = m14;
	t.m21 = m21; t.m22 = m22; t.m23 = m23; t.m24 = m24;
	t.m31 = m31; t.m32 = m32; t.m33 = m33; t.m34 = m34;
	t.m41 = m41; t.m42 = m42; t.m43 = m43; t.m44 = m44;
	return t;
}

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface FeZeroLoader ()
// Container View
@property (weak, nonatomic) UIView *containerView;

// Container Layer
@property (strong, nonatomic) CALayer *containerLayer;

// Bars
@property (strong, nonatomic) CALayer *topBar;
@property (strong, nonatomic) CALayer *middleBar;
@property (strong, nonatomic) CALayer *bottombar;

-(void) initCommon;
-(void) initContainer;
-(void) initBars;
@end

@implementation FeZeroLoader

-(instancetype) initWithView:(UIView *)view title:(NSString *)title
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        
        [self initCommon];
        
        [self initContainer];
        
        [self initBars];
    }
    return self;
}

-(void) initCommon
{
    self.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    self.backgroundColor = [UIColor colorWithHexCode:@"#282828"];
}
-(void) initContainer
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor blackColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, 100, 100);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    [self.layer addSublayer:_containerLayer];
}
-(void) initBars
{
    float theta = -15.0f;
    CGAffineTransform t = CGAffineTransformIdentity;
    t.b = tan(theta*M_PI/180.0f);

    // First
    _topBar = [CALayer layer];
    _topBar.frame = CGRectMake(20, 0, 53, 20);
    _topBar.transform = CATransform3DMakeAffineTransform(t);
    _topBar.backgroundColor = [UIColor whiteColor].CGColor;
    
    [_containerLayer addSublayer:_topBar];
    
}
-(void) show
{
    
}
@end
