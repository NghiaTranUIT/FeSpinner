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
#define kFe_Circle_Width 180.0f
#define kFe_Color_Salmon @"#FA8072"

@interface FeRollingLoader ()
{
    NSString *_title;
}
// Container
@property (weak, nonatomic) UIView *containerView;

// Circle
@property (strong, nonatomic) CAShapeLayer *circleLayer;

// Group
@property (strong, nonatomic) CAAnimationGroup *group_0;
@property (strong, nonatomic) CAAnimationGroup *group_25;
@property (strong, nonatomic) CAAnimationGroup *group_50;
@property (strong, nonatomic) CAAnimationGroup *group_75;
@property (strong, nonatomic) CAAnimationGroup *group_100;

// Keyframe
@property (strong, nonatomic) CAKeyframeAnimation *keyframeAnimation;

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
    // 0 %
    if (YES)
    {
        // Path
        CGFloat length = kFe_Circle_Width / 2.0f;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.55f * length topRight:0.75f * length bottomLeft:0.55f * length bottomRight:0.75f * length];
        pathAnimation.toValue = (__bridge id)path;
        
        // Background
        CABasicAnimation *backgroundAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        backgroundAnimation.toValue = (id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;
        
        //Transfrom
        CABasicAnimation *transfromAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        transfromAnimation.toValue = (id)[NSNumber numberWithFloat:0.0f];
        
        // Group
        _group_0 = [CAAnimationGroup animation];
        _group_0.duration = 1.3f;
        _group_0.repeatCount = MAXFLOAT;
        _group_0.animations = @[pathAnimation, backgroundAnimation, transfromAnimation];
    }
    // 25 %
    if (YES)
    {
        // Path
        CGFloat length = kFe_Circle_Width / 2.0f;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.65f * length topRight:0.75f * length bottomLeft:0.65f * length bottomRight:0.75f * length];
        pathAnimation.toValue = (__bridge id)path;
        
        // Background
        CABasicAnimation *backgroundAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        backgroundAnimation.toValue = (id)[UIColor colorWithHexCode:kFe_Color_Salmon].CGColor;
        
        //Transfrom
        CABasicAnimation *transfromAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        transfromAnimation.toValue = (id)[NSNumber numberWithFloat:M_PI / 2.0f];
        
        // Group
        _group_25 = [CAAnimationGroup animation];
        _group_25.duration = 1.3f;
        _group_25.repeatCount = MAXFLOAT;
        _group_25.animations = @[pathAnimation, backgroundAnimation, transfromAnimation];
    }
    
    // 50 %
    if (YES)
    {
        // Path
        CGFloat length = kFe_Circle_Width / 2.0f;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.95f * length topRight:0.65f * length bottomLeft:0.95f * length bottomRight:0.65f * length];
        pathAnimation.toValue = (__bridge id)path;
        
        // Background
        CABasicAnimation *backgroundAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        backgroundAnimation.toValue = (id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;
        
        //Transfrom
        CABasicAnimation *transfromAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        transfromAnimation.toValue = (id)[NSNumber numberWithFloat:M_PI];
        
        // Group
        _group_50 = [CAAnimationGroup animation];
        _group_50.duration = 1.3f;
        _group_50.repeatCount = MAXFLOAT;
        _group_50.animations = @[pathAnimation, backgroundAnimation, transfromAnimation];
    }
    
    
    // 75 %
    if (YES)
    {
        // Path
        CGFloat length = kFe_Circle_Width / 2.0f;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.85f * length topRight:0.95f * length bottomLeft:0.85f * length bottomRight:0.95f * length];
        pathAnimation.toValue = (__bridge id)path;
        
        // Background
        CABasicAnimation *backgroundAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        backgroundAnimation.toValue = (id)[UIColor colorWithHexCode:kFe_Color_Salmon].CGColor;
        
        //Transfrom
        CABasicAnimation *transfromAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        transfromAnimation.toValue = (id)[NSNumber numberWithFloat:M_PI * 3 / 4];
        
        // Group
        _group_75 = [CAAnimationGroup animation];
        _group_75.duration = 1.3f;
        _group_75.repeatCount = MAXFLOAT;
        _group_75.animations = @[pathAnimation, backgroundAnimation, transfromAnimation];
    }

    
    // 100 %
    if (YES)
    {
        // Path
        CGFloat length = kFe_Circle_Width / 2.0f;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.55f * length topRight:0.75f * length bottomLeft:0.55f * length bottomRight:0.75f * length];
        pathAnimation.toValue = (__bridge id)path;
        
        // Background
        CABasicAnimation *backgroundAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
        backgroundAnimation.toValue = (id)[UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;
        
        //Transfrom
        CABasicAnimation *transfromAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        transfromAnimation.toValue = (id)[NSNumber numberWithFloat:M_PI * 2];
        
        // Group
        _group_100 = [CAAnimationGroup animation];
        _group_100.duration = 1.3f;
        _group_100.repeatCount = MAXFLOAT;
        _group_100.animations = @[pathAnimation, backgroundAnimation, transfromAnimation];
    }

    
    
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
    [_circleLayer addAnimation:_group_25 forKey:@"rolling"];
}
@end
