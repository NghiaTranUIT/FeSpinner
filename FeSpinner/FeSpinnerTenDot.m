//
//  FeSpinnerTenDot.m
//  FeSpinner
//
//  Created by Nghia Tran on 11/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeSpinnerTenDot.h"
#import "FXBlurView.h"
#import "UIColor+flat.h"
#import "FeTenDot.h"
#define kMaxTenDot 10

@interface FeSpinnerTenDot ()
@property (strong, nonatomic) FXBlurView *backgroundBlur;
@property (strong, nonatomic) UIView *backgroundStatic;
@property (strong, nonatomic) NSMutableArray *arrDot;
@property (weak, nonatomic) UIView *containerView;

@property (strong, nonatomic) NSTimer *timer;


// Common init
-(void) commonInit;

@end
@implementation FeSpinnerTenDot

-(id) initWithView:(UIView *)view withBlur:(BOOL)blur
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        _isShouldBlur = blur;
        _arrDot = [[NSMutableArray alloc] initWithCapacity:10];
        
        // init common
        [self commonInit];
        
        // add Spinner as Subview
        [view addSubview:self];
        self.hidden = YES;

    }
    return self;
}

#pragma mark Common Init
-(void) commonInit
{
    // init frame as bound container
    self.frame = _containerView.bounds;
    
    
    
    if (_isShouldBlur)
    {
        _backgroundBlur = [[FXBlurView alloc] initWithFrame:_containerView.bounds];
        _backgroundBlur.blurRadius = 40;
        _backgroundBlur.tintColor = [UIColor colorWithHexCode:@"#32ce55"];
        
        // add background
        [self addSubview:_backgroundStatic];
        
    }
    else
    {
        _backgroundStatic = [[UIView alloc] initWithFrame:_containerView.bounds];
        _backgroundStatic.backgroundColor = [UIColor colorWithHexCode:@"#32ce55"];
        
        [self addSubview:_backgroundStatic];
    }
    
    
    CGPoint center = self.center;
    
    // init center dot
    UIView *centerDot = [[UIView alloc] initWithFrame:CGRectMake(center.x, center.y, 20, 20)];
    centerDot.clipsToBounds = YES;
    centerDot.layer.cornerRadius = centerDot.bounds.size.height /2;
    centerDot.backgroundColor = [UIColor whiteColor];
    centerDot.center = center;
    
    [self addSubview:centerDot];
    
    // init 10 dot
    
    for (NSInteger i = 0 ; i < kMaxTenDot; i++)
    {
        FeTenDot *dot = [[FeTenDot alloc] initDotAtMainView:self atIndex:i];
        [_arrDot addObject:dot];
        
        [self addSubview: dot];
    }
    
}
-(void) show
{
    self.hidden = NO;
    self.alpha = 0;
    
    [UIView animateWithDuration:0.5f delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^
    {
                         self.alpha = 1;
                     } completion:^(BOOL finished)
    {
        CGFloat delay = 0;
        for (NSInteger i = 0 ; i < kMaxTenDot ; i++)
        {
            FeTenDot *dot = _arrDot[i];
            [dot performSelector:@selector(start) withObject:nil afterDelay:delay];
            
            delay += 0.1f;
        }
    }];
    
}
-(void) dismiss
{
    [UIView animateWithDuration:0.5f delay:0
                        options:UIViewAnimationOptionCurveEaseIn animations:^{
                            self.alpha = 0;
                        } completion:^(BOOL finished) {
                            for (NSInteger i = 0 ; i < kMaxTenDot ; i++)
                            {
                                FeTenDot *dot = _arrDot[i];
                                [dot stop];
                            }
                            
                            [self removeFromSuperview];
                        }];
    
    
}
@end
