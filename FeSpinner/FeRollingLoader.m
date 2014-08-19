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

@interface FeRollingLoader ()
{
    NSString *_title;
}
// Container
@property (weak, nonatomic) UIView *containerView;

// Circle
@property (strong, nonatomic) CAShapeLayer *circleLayer;

//////
-(void) initCommon;
-(void) initCircle;
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
    _circleLayer.frame = CGRectMake(0, 0, 180, 180);
    _circleLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _circleLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    //_circleLayer.backgroundColor = [UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;
    
    // Shape
    CGFloat length = 180.0f / 2.0f;
    CGPathRef path = [self pathRefForCornerRectWithTopLeftRadius:0.85f * length topRight:0.95f * length bottomLeft:0.85f * length bottomRight:0.95f * length];
    
    // Set Path
    _circleLayer.path = path;
    _circleLayer.masksToBounds = YES;
    _circleLayer.fillColor = [UIColor colorWithHexCode:kFe_Color_DarkShalmon].CGColor;

    
    // Add
    [self.layer addSublayer:_circleLayer];
}

#pragma mark - Private
-(CGPathRef) pathRefForCornerRectWithTopLeftRadius:(CGFloat) topLeftRadius topRight:(CGFloat) topRightRadius bottomLeft:(CGFloat) bottomLeftRadius bottomRight:(CGFloat) bottomRightRadius
{

    
    CGRect rect = CGRectMake(0, 0, 180, 180);
    
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
    //CGPathCloseSubpath(pathRef);
    
    
    
    return pathRef;
}

-(void) show
{
    
}
@end
