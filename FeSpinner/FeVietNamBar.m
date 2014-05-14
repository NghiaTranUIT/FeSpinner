//
//  FeVietNamBar.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/30/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeVietNamBar.h"
#import "UIColor+flat.h"

@interface FeVietNamBar()
// First, second, third color for animating
@property (weak, nonatomic) UIColor *firstColor;
@property (weak, nonatomic) UIColor *secondColor;
@property (weak, nonatomic) UIColor *thirdColor;

// Group animation
@property (strong, nonatomic) CAAnimationGroup *animationGroup;
@property (assign, nonatomic, readonly) NSInteger indexBar;

// init something
-(void) commonInit;

// Calculator frame for VietnamBar at index
-(CGRect) frameAtIndex:(NSInteger) index;

// Animation
-(void) animate;

// Calculator and return CAAnimationGroup for animating
-(CAAnimationGroup *) animationGroupAtIndex:(NSInteger) index;
@end
@implementation FeVietNamBar
#pragma mark Init
-(id) initAtIndex:(NSInteger)index colors:(NSArray *)colors
{
    self = [super init];
    if (self)
    {
        self.frame = [self frameAtIndex:index];
        _indexBar = index;
        
        // set color
        _firstColor = colors[0];
        _secondColor = colors[1];
        _thirdColor = colors[2];
        
        // init;
        [self commonInit];
        
    }
    return self;
}
-(void) commonInit
{
    // color
    self.backgroundColor = [UIColor clearColor].CGColor;
}
-(CGRect)frameAtIndex:(NSInteger)index
{
    
    CGRect frame;
    switch (index) {
        case 1:
        {
            frame = CGRectMake(129, 36, 31, 10);
            break;
        }
        case 2:
        {
            frame = CGRectMake(116.5, 48, 61, 10);
            break;
        }
        case 3:
        {
            frame = CGRectMake(84.5, 59.5, 101, 10);
            break;
        }
        case 4:
        {
            frame = CGRectMake(90.5, 71.5, 112, 10);
            break;
        }
        case 5:
        {
            frame = CGRectMake(97.5, 84.5, 88, 10);
            break;
        }
        case 6:
        {
            frame = CGRectMake(123.5, 95.5, 48, 10);
            break;
        }
        case 7:
        {
            frame = CGRectMake(126.5, 107.5, 39, 10);
            break;
        }
        case 8:
        {
            frame = CGRectMake(115.5, 119.5, 39, 10);
            break;
        }
        case 9:
        {
            frame = CGRectMake(128.5, 131.5, 31, 10);
            break;
        }
        case 10:
        {
            frame = CGRectMake(138.5, 144.5, 26, 10);
            break;
        }
        case 11:
        {
            frame = CGRectMake(153.5, 155.5, 21, 10);
            break;
        }
        case 12:
        {
            frame = CGRectMake(162.5, 167.5, 21, 10);
            break;
        }
        case 13:
        {
            frame = CGRectMake(173.5, 178.5, 21, 10);
            break;
        }
        case 14:
        {
            frame = CGRectMake(182.5, 190.5, 22, 10);
            break;
        }
        case 15:
        {
            frame = CGRectMake(188.5, 202.5, 24, 10);
            break;
        }
        case 16:
        {
            frame = CGRectMake(183.5, 214.5, 34, 10);
            break;
        }
        case 17:
        {
            frame = CGRectMake(181.5, 226.5, 42, 10);
            break;
        }
        case 18:
        {
            frame = CGRectMake(184.5, 238.5, 36, 10);
            break;
        }
        case 19:
        {
            frame = CGRectMake(186.5, 250.5, 37, 10);
            break;
        }
        case 20:
        {
            frame = CGRectMake(174.5, 262.5, 47, 10);
            break;
        }
        case 21:
        {
            frame = CGRectMake(153.5, 274.5, 64, 10);
            break;
        }
        case 22:
        {
            frame = CGRectMake(141.5, 286.5, 69, 10);
            break;
        }
        case 23:
        {
            frame = CGRectMake(123.5, 298.5, 71, 10);
            break;
        }
        case 24:
        {
            frame = CGRectMake(127.5, 311.5, 47, 10);
            break;
        }
        case 25:
        {
            frame = CGRectMake(120.5, 324.5, 38, 10);
            break;
        }
        case 26:
        {
            frame = CGRectMake(127.5, 336.5, 20, 10);
            break;
        }
        case 27:
        {
            frame = CGRectMake(266.5, 239.5, 11, 10);
            break;
        }
        case 28:
        {
            frame = CGRectMake(266.5, 251.5, 25, 10);
            break;
        }
        case 29:
        {
            frame = CGRectMake(259.5, 262.5, 25, 10);
            break;
        }
        case 30:
        {
            frame = CGRectMake(236.5, 310.5, 23, 10);
            break;
        }
        case 31:
        {
            frame = CGRectMake(230.5, 323.5, 22, 10);
            break;
        }
        default:
            break;
    }
    
    return frame;
}

#pragma mark Action
-(CAAnimationGroup *) animationGroupAtIndex:(NSInteger)index
{
    CAAnimationGroup *group;
    
    if (index == 1 || index == 14)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 2 || index == 15)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 3 || index == 16)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.2f]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 4 || index == 17)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.2f]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 5 || index == 18 || index == 27)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 6 || index == 19 || index == 28)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 7 || index == 20 || index == 29)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 8 || index == 21)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.0]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 9 || index == 22)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 10 || index == 23)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 11 || index == 24 || index == 30)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 12 || index == 25 || index == 31)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.2]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    if (index == 13 || index == 26)
    {
        CAKeyframeAnimation *colorKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        colorKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                   [NSNumber numberWithFloat:0.1667f],
                                   [NSNumber numberWithFloat:0.333f],
                                   [NSNumber numberWithFloat:0.5f],
                                   [NSNumber numberWithFloat:0.667f],
                                   [NSNumber numberWithFloat:0.833f],
                                   [NSNumber numberWithFloat:1.0f]];
        colorKeyframe.values = @[(id)_firstColor.CGColor,
                                 (id)_firstColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_secondColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_thirdColor.CGColor,
                                 (id)_firstColor.CGColor,];
        colorKeyframe.duration = 3.0f;
        colorKeyframe.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *transformKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        transformKeyframe.keyTimes = @[[NSNumber numberWithFloat:0],
                                       [NSNumber numberWithFloat:0.1667f],
                                       [NSNumber numberWithFloat:0.333f],
                                       [NSNumber numberWithFloat:0.5f],
                                       [NSNumber numberWithFloat:0.667f],
                                       [NSNumber numberWithFloat:0.833f],
                                       [NSNumber numberWithFloat:1.0f]];
        transformKeyframe.values = @[[NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.0f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2f],
                                     [NSNumber numberWithFloat:1.2],
                                     [NSNumber numberWithFloat:1.0]];
        transformKeyframe.duration = 3.0f;
        transformKeyframe.repeatCount = HUGE_VAL;
        
        group = [CAAnimationGroup animation];
        group.duration = 3.0f;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        group.repeatCount  =HUGE_VAL;
        group.animations = @[colorKeyframe,transformKeyframe];
    }
    return group;
}
-(void) animate
{
    _animationGroup = [self animationGroupAtIndex:_indexBar];
    [self addAnimation:_animationGroup forKey:@"group"];
}
-(void) startAnimation
{
    [self animate];
    //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}
-(void) stopAnimation
{
    [self removeAllAnimations];
}
@end
