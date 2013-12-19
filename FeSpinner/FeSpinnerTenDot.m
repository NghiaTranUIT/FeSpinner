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
#define kPagingLabel 30

@interface FeSpinnerTenDot ()
// Blur View
@property (strong, nonatomic) FXBlurView *backgroundBlur;

// Background Static for Blur View
@property (strong, nonatomic) UIView *backgroundStatic;

// Arr of dot
@property (strong, nonatomic) NSMutableArray *arrDot;

// Container View
@property (weak, nonatomic) UIView *containerView;

// Timer
@property (strong, nonatomic) NSTimer *timer;

// Label
@property (strong, nonatomic) UILabel *label;

// BOOL
@property (assign, nonatomic) BOOL isShouldBlur;
@property (assign, nonatomic) BOOL isAnimating;

//****************************
// Common init
-(void) commonInit;
-(void) initBackgroundWithBlur:(BOOL) blur;
-(void) initDot;
-(void) initLabel;
-(void) resetLabel;
@end
@implementation FeSpinnerTenDot

-(id) initWithView:(UIView *)view withBlur:(BOOL)blur
{
    // CHeck
    if (view.bounds.size.height <= 100)
    {
        NSAssert(NO, @"Container View's height shouldn't less than 100");
    }
    
    self = [super init];
    if (self)
    {
        _containerView = view;
        _isShouldBlur = blur;
        _arrDot = [[NSMutableArray alloc] initWithCapacity:10];
        
        // init common
        [self commonInit];
        
        // BOOl
        _isAnimating = NO;
        
        self.hidden = YES;

    }
    return self;
}

#pragma mark Common Init
-(void) commonInit
{
    // init frame as bound container
    self.frame = _containerView.bounds;
    
    // init Background
    [self initBackgroundWithBlur:_isShouldBlur];
    
    // init Ten Dot
    [self initDot];
    
}
-(void) initBackgroundWithBlur:(BOOL)blur
{
    // init Background for Blur View
    if (_isShouldBlur)
    {
        _backgroundBlur = [[FXBlurView alloc] initWithFrame:_containerView.bounds];
        _backgroundBlur.blurRadius = 40;
        _backgroundBlur.tintColor = [UIColor colorWithHexCode:@"#32ce55"];
        _backgroundBlur.dynamic = NO;
        [_backgroundBlur.layer displayIfNeeded];
        
        // add background
        [_containerView addSubview:_backgroundBlur];
        _backgroundBlur.hidden = YES;
        
    }
    else
    {
        _backgroundStatic = [[UIView alloc] initWithFrame:_containerView.bounds];
        _backgroundStatic.backgroundColor = [UIColor colorWithHexCode:@"#32ce55"];
        
        [self addSubview:_backgroundStatic];
    }

}
-(void) initDot
{
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
-(void) initLabel
{
    // init Label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _label.textColor = [UIColor whiteColor];
    _label.text = _titleLabelText;
    _label.textAlignment = NSTextAlignmentCenter;
    
    // fit for size
    [_label sizeToFit];
    
    // set center
    _label.center = CGPointMake(self.center.x, self.center.y + kPagingLabel + 30 + _label.bounds.size.height / 2);
    
    [self addSubview:_label];
}
-(void) resetLabel
{
    if (_isAnimating)
    {
        // Animation Title label
        CATransition *animation = [CATransition animation];
        animation.duration = 0.8f;
        animation.type = kCATransitionFade;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_label.layer addAnimation:animation forKey:@"changeTextTransition"];
        
        // Change text
        _label.font = _fontTitleLabel;
        _label.text = _titleLabelText;
        
    }
    else
    {
        // Change the text
        _label.font = _fontTitleLabel;
        _label.text = _titleLabelText;
    }
    [_label sizeToFit];
    
    _label.center = CGPointMake(self.center.x, self.center.y  + kPagingLabel + 30 + _label.bounds.size.height / 2);
}
#pragma mark Setter / getter
-(void) setTitleLabelText:(NSString *)titleLabelText
{
    // Return if the same
    if ([_titleLabelText isEqualToString:titleLabelText])
        return;
    _titleLabelText = titleLabelText;
    
    
    if (!_label)
    {
        [self initLabel];
    }
    
    [self resetLabel];
}
-(void) setFontTitleLabel:(UIFont *)fontTitleLabel
{
    if (_fontTitleLabel == fontTitleLabel)
        return;
    
    _fontTitleLabel = fontTitleLabel;
    
    // Reset layout Label
    [self resetLabel];
    
}

#pragma mark Action Animate
-(void) show
{
    if (_isAnimating)
        return;
    
    [_containerView addSubview:self];
    self.hidden = NO;
    self.alpha = 0;
    
    if (_isShouldBlur)
    {
        _backgroundBlur.alpha = 0;
        _backgroundBlur.hidden = NO;
        [_containerView insertSubview:_backgroundBlur belowSubview:self];
    }
    
    [UIView animateWithDuration:0.5f delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^
    {
                         self.alpha = 1;
        
        if (_isShouldBlur)
        {
            _backgroundBlur.alpha = 1;
        }
                     } completion:^(BOOL finished)
    {
        _isAnimating = YES;
        
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
    if (!_isAnimating)
        return;
    
    [UIView animateWithDuration:0.4f delay:0
                        options:UIViewAnimationOptionCurveEaseIn animations:^{
                            self.alpha = 0;
                            
                            if (_isShouldBlur)
                            {
                                _backgroundBlur.alpha = 0;
                            }
                        } completion:^(BOOL finished) {
                            for (NSInteger i = 0 ; i < kMaxTenDot ; i++)
                            {
                                FeTenDot *dot = _arrDot[i];
                                [dot stop];
                                [dot reset];
                            }
                            
                            _isAnimating = NO;
                            
                            if (_isShouldBlur)
                                [_backgroundBlur removeFromSuperview];
                            
                            [self removeFromSuperview];
                            
                            
                        }];
    
    
}
-(void) showWhileExecutingBlock:(Block)block
{
    // Check block != nil
    if (block != nil)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
        {
            block();
            
            // Update UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        });
    }
}
-(void) showWhileExecutingTarget:(id)target action:(SEL)selector
{
    // Check Selector is responded
    if ([target respondsToSelector:selector])
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [target performSelector:selector withObject:nil];
            
            // Update UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        });;
    }
    
}
@end
