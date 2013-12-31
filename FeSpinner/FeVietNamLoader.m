//
//  FeVietNamLoader.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/30/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeVietNamLoader.h"
#import "FXBlurView.h"
#import "FeVietNamBar.h"
#import "UIColor+flat.h"

#define kCountVietNamBar 31

@interface FeVietNamLoader ()
{
    CGPoint lastPosition;
}
@property (weak, nonatomic) UIView *container;
@property (strong, nonatomic) FXBlurView *backgroundBlur;
@property (strong, nonatomic) UIView *backgroundStatic;
@property (strong, nonatomic) NSMutableArray *arrVietNamBars;
@property (strong, nonatomic) UILabel *label;

-(void) commonInit;
-(void) initBackgroundBlur:(BOOL) blur;
-(void) initVietNamBars;
-(void) initLabel;
@end
@implementation FeVietNamLoader

-(id) initWithView:(UIView *)view blur:(BOOL)blur color:(NSArray *)arrColors
{
    self =[super initWithFrame:view.bounds];
    if (self)
    {
        _container = view;
        _isBlur = blur;
        _isAnimating = NO;
        if (arrColors)
            _arrColors = arrColors;
        else
        {
            _arrColors = @[[UIColor flatAlizarinColor],[UIColor flatEmeraldColor],[UIColor flatSunFlowerColor]];
        }
        
        self.hidden = YES;
        self.alpha = 0;
        
        [self commonInit];
        
        [self initBackgroundBlur:blur];
        
        [self initVietNamBars];
        
        [self initLabel];
    }
    return self;
}
-(void) commonInit
{
    _arrVietNamBars = [[NSMutableArray alloc] initWithCapacity:kCountVietNamBar];
}
-(void) initBackgroundBlur:(BOOL)blur
{
    if (blur)
    {
        
    }
    else
    {
        self.backgroundColor = [UIColor flatWetAsphaltColor];
    }
}
-(void) initVietNamBars
{
    for (NSInteger i = 1 ; i <= kCountVietNamBar; i++)
    {
        FeVietNamBar *bar = [[FeVietNamBar alloc ] initAtIndex:i colors:_arrColors];
        
        [self.layer addSublayer:bar];
        [_arrVietNamBars addObject:bar];
        
        if (i == 26)
        {
            lastPosition = bar.position;
        }
    }
}
-(void) initLabel
{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"LOADING";
    _label.font = [UIFont fontWithName:@"Neou-Thin" size:36];
    _label.textColor = [UIColor whiteColor];
    
    // Size to fit
    [_label sizeToFit];
    _label.center = CGPointMake(self.center.x, lastPosition.y + 40);
    
    [self addSubview:_label];
}
-(void) show
{
    if (_isAnimating)
        return;
    
    self.hidden = NO;
    self.alpha = 0;
    
    [UIView animateWithDuration:0.4f
                          delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.alpha = 1;
                     } completion:^(BOOL finished) {
                         
                         
                         _isAnimating = YES;
                         
                         for (FeVietNamBar *bar in _arrVietNamBars) {
                             [bar startAnimation];
                         }
                     }];
}
-(void) dismiss
{
    if (!_isAnimating)
        return;
    
    // Fade out
    // and remove from super view
    [UIView animateWithDuration:0.4f delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.alpha = 0;
                     } completion:^(BOOL finished) {
                         _isAnimating = NO;
                         
                         // remove all animation
                         for (FeVietNamBar *bar in _arrVietNamBars) {
                             [bar stopAnimation];
                         }
                         
                         [self removeFromSuperview];
                     }];
}
@end
