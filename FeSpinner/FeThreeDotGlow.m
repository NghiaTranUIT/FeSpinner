//
//  FeThreeDotGlow.m
//  FeSpinner
//
//  Created by Nghia Tran on 1/4/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeThreeDotGlow.h"
#import "UIColor+flat.h"

@interface FeThreeDotGlow()
@property (weak, nonatomic) UIView *container;
@property (strong, nonatomic) CALayer *containerDotLayer;
@property (strong, nonatomic) NSMutableArray *arrThreeDots;
@property (strong, nonatomic) CABasicAnimation *rotateAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *glowAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *colorGlowAnimation;
@property (strong, nonatomic) CAKeyframeAnimation *colorDotAnimation;
@property (strong, nonatomic) CAAnimationGroup *groupAnimation;

-(void) commonInit;
-(void) initBackgroundBlur:(BOOL) blur;
-(void) initThreeDot;
-(void) initAniamtion;
@end
@implementation FeThreeDotGlow

-(id) initWithView:(UIView *)view blur:(BOOL)blur
{
    self = [super initWithFrame:view.bounds];
    if (self)
    {
        _container = view;
        
        [self commonInit];
        [self initBackgroundBlur:blur];
        [self initThreeDot];
        [self initAniamtion];
    }
    return self;
}
-(void) commonInit
{
    
}
-(void) initBackgroundBlur:(BOOL)blur
{
    self.backgroundColor = [UIColor flatWetAsphaltColor];
}
-(void) initThreeDot
{
    _arrThreeDots = [[NSMutableArray alloc] initWithCapacity:3];
    
    _containerDotLayer = [CALayer layer];
    _containerDotLayer.frame = CGRectMake(0, 0, 50, 50);
    _containerDotLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerDotLayer.position = self.center;
    
    for (NSInteger i = 0; i < 3; i++)
    {
        CALayer *dot = [CALayer layer];
        CGRect frame;
        
        switch (i) {
            case 0:
            {
                frame = CGRectMake(15, 0, 20, 20);
                break;
            }
            case 1:
            {
                frame = CGRectMake(0, 29.5, 20, 20);
                break;
            }
            case 2:
            {
                frame = CGRectMake(30.5, 29.5, 20, 20);
                break;
            }
            default:
                break;
        }
        dot.frame = frame;
        dot.backgroundColor = [UIColor flatCarrotColor].CGColor;
        dot.cornerRadius = 10;;
        dot.shadowColor = [UIColor flatCarrotColor].CGColor;
        dot.shadowOpacity = 1;
        dot.shadowOffset = CGSizeMake(0, 0);
        dot.shadowRadius = 15;
        
        [_containerDotLayer addSublayer:dot];
        [_arrThreeDots addObject:dot];
        
    }
    
    [self.layer addSublayer:_containerDotLayer];
}
-(void) initAniamtion
{
    _rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    _rotateAnimation.repeatCount = HUGE_VAL;
    _rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    _rotateAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    _rotateAnimation.duration = 1.5f;
    
    _glowAnimation = [CAKeyframeAnimation animationWithKeyPath:@"shadowRadius"];
    _glowAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.5f],
                                [NSNumber numberWithFloat:1.0f]];
    _glowAnimation.values = @[[NSNumber numberWithFloat:5.0f],
                              [NSNumber numberWithFloat:20.0f],
                              [NSNumber numberWithFloat:5.0f]];
    _glowAnimation.repeatCount = HUGE_VAL;
    _glowAnimation.duration = 1.5f;
    
    _colorGlowAnimation = [CAKeyframeAnimation animationWithKeyPath:@"shadowColor"];
    _colorGlowAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.5f],
                                [NSNumber numberWithFloat:1.0f]];
    _colorGlowAnimation.values = @[(id)[UIColor colorWithHexCode:@"#ff0000"].CGColor,
                              (id)[UIColor colorWithHexCode:@"#00ff00"].CGColor,
                              (id)[UIColor colorWithHexCode:@"#ff0000"].CGColor];
    _colorGlowAnimation.repeatCount = HUGE_VAL;
    _colorGlowAnimation.duration = 1.5f;
    
    _colorDotAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    _colorDotAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.5f],
                                [NSNumber numberWithFloat:1.0f]];
    _colorDotAnimation.values = @[(id)[UIColor colorWithHexCode:@"#ff0000"].CGColor,
                                  (id)[UIColor colorWithHexCode:@"#00ff00"].CGColor,
                                  (id)[UIColor colorWithHexCode:@"#ff0000"].CGColor];
    _colorDotAnimation.repeatCount = HUGE_VAL;
    _colorDotAnimation.duration = 1.5f;
    
    _groupAnimation = [CAAnimationGroup animation];
    _groupAnimation.duration = 1.5f;
    _groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _groupAnimation.repeatCount = HUGE_VAL;
    _groupAnimation.animations = @[_glowAnimation, _colorDotAnimation, _colorGlowAnimation];
    
}
-(void) show
{
    [_containerDotLayer addAnimation:_rotateAnimation forKey:@"transform.rotation"];
    
    for (CALayer *dot in _arrThreeDots) {
        [dot addAnimation:_groupAnimation forKey:@"shadowRadius"];
    }
}

@end
