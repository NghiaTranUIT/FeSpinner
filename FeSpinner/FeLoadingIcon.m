//
//  FeLoadingIcon.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/19/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeLoadingIcon.h"
#import "FeLoadingIconBox.h"
#import "UIColor+flat.h"

@interface FeLoadingIcon ()
{
    
}
@property (weak, nonatomic) UIView *containerView;

@property (strong, nonatomic) NSMutableArray *arrBox;
@property (strong, nonatomic) NSArray *arrColor;
@property (strong, nonatomic) NSTimer *timer;
// ***********
-(void) commonInit;
-(void) initBox;
-(void) initColor;
-(void) animteColor;
@end
@implementation FeLoadingIcon

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithView:(UIView *)view
{
    CGRect frame = CGRectMake(0, 0, 100, 100);
    self = [super initWithFrame:frame];
    if (self)
    {
        _containerView = view;
        _isAnimating = NO;
        
        [self commonInit];
        [self initBox];
        [self initColor];
    }
    return self;
}
-(void) commonInit
{
    // Set center
    self.center = _containerView.center;
    [_containerView addSubview:self];
    self.hidden = NO;
    
    // BOOl
    _isAnimating = NO;
    
    _arrBox = [[NSMutableArray alloc ]initWithCapacity:16];
    
    
    self.layer.cornerRadius = 40.0f;
    self.clipsToBounds = YES;
}
-(void) initBox
{
    for (NSInteger i = 1; i <= 16; i++)
    {
        FeLoadingIconBox *box = [[FeLoadingIconBox alloc] initBoxAtIndex:i];
        [self addSubview:box];
        
        [_arrBox addObject:box];
    }
}
-(void) initColor
{
    _arrColor = @[[UIColor flatWisteriaColor],[UIColor flatSunFlowerColor],[UIColor flatPumpkinColor],[UIColor flatGreenSeaColor],[UIColor flatMidNightColor],[UIColor flatWisteriaColor]];
}
#pragma mark Action
-(void) show
{
    if (_isAnimating)
        return;
    
    self.hidden = NO;
    
    [self animteColor];
    _timer = [NSTimer scheduledTimerWithTimeInterval:8.0f target:self selector:@selector(animteColor) userInfo:nil repeats:YES];
    
    
    for (NSInteger i = 1; i <= 16; i++)
    {
        FeLoadingIconBox *box = _arrBox[i-1];
        CGFloat delay = [self delayAtIndex:i];
        
        [box performSelector:@selector(playAnimate) withObject:nil afterDelay:delay];
    }
    
    _isAnimating = YES;
}
-(void) animteColor
{
    [UIView animateWithDuration:1.6f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = _arrColor[0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.6f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.backgroundColor = _arrColor[1];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.6f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.backgroundColor = _arrColor[2];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.6f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    self.backgroundColor = _arrColor[3];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.6f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                        self.backgroundColor = _arrColor[4];
                    } completion:^(BOOL finished) {
                        
                    }];
                    
                }];
                
            }];
            
        }];
    }];
}
-(CGFloat) delayAtIndex:(NSInteger) index
{
    CGFloat delay = 0;
    switch (index) {
        case 1:
        {
            delay = 0.55f;
            break;
        }
        case 2:
        {
            delay = 0.5f;
            break;
        }
        case 3:
        {
            delay = 0.45f;
            break;
        }
        case 4:
        {
            delay = 0.4f;
            break;
        }
        case 8:
        {
            delay = 0.35f;
            break;
        }
        case 12:
        {
            delay = 0.3f;
            break;
        }
        case 16:
        {
            delay = 0.25f;
            break;
        }
        case 15:
        {
            delay = 0.2f;
            break;
        }
        case 14:
        {
            delay = 0.15f;
            break;
        }
        case 13:
        {
            delay = 0.1f;
            break;
        }
        case 9:
        {
            delay = 0.5f;
            break;
        }
        case 5:
        {
            delay = 0;
            break;
        }
        case 6:
        {
            delay = 0;
            break;
        }
        case 7:
        {
            delay = 0.18f;
            break;
        }
        case 10:
        {
            delay = 0.36f;
            break;
        }
        case 11:
        {
            delay = 0.55f;
            break;
        }
        default:
            break;
    }
    return delay;
}
-(void) dismiss
{
    if (!_isAnimating)
        return;
    
    for (NSInteger i = 1; i <= 16; i++)
    {
        FeLoadingIconBox *box = _arrBox[i-1];
        
        [box stopAnimate];
    }
}
@end
