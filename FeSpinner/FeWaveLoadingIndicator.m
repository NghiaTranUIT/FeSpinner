//
//  FeWaveLoadingIndicator.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeWaveLoadingIndicator.h"
#import "UIColor+flat.h"
#import "FeWaveLayer.h"

#define kFontSize 80

@interface FeWaveLoadingIndicator ()
// Container View
@property (strong, nonatomic) UIView *containerView;

// Label
@property (strong, nonatomic) UILabel *bgLabel;
@property (strong, nonatomic) UILabel *foreLabel;

// Color
@property (strong, nonatomic) UIColor *bgColor;
@property (strong, nonatomic) UIColor *foreColor;

// Title
@property (strong, nonatomic) NSString *title;

// Mask layer
@property (strong, nonatomic) FeWaveLayer *waveLayer;

//*************************
-(void) commonInit;
-(void) initLable;
-(void) initMaskLayer;
@end
@implementation FeWaveLoadingIndicator

#pragma mark Init
-(id) initWithView:(UIView *)view title:(NSString *)title backgroundColor:(UIColor *)bgColor foregroundColor:(UIColor *)foreColor
{
    self = [super init];
    if (self)
    {
        // Set vairable
        _containerView = view;
        _title = title;
        _bgColor = bgColor;
        _foreColor = foreColor;
        
        //************************
        // init Common
        [self commonInit];
        
        // Init lable
        [self initLable];
        
        // init Mask
        [self initMaskLayer];
    }
    
    return self;
}
-(void) commonInit
{
    self.frame = _containerView.bounds;
    
    // Background
    self.backgroundColor = [UIColor colorWithHexCode:@"#141414"];
    
    // Percent
    _percent = 0;
    
}
-(void) initLable
{
    // Background Label
    _bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _bgLabel.font = [UIFont fontWithName:@"CabinCondensed-Bold" size:kFontSize];
    _bgLabel.backgroundColor = [UIColor clearColor];
    _bgLabel.textColor = _bgColor;
    _bgLabel.textAlignment = NSTextAlignmentCenter;
    _bgLabel.text = _title;
    
    // Set center
    [_bgLabel sizeToFit];
    _bgLabel.center = self.center;
    
    //***************
    // Foreground label
    _foreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _foreLabel.font = [UIFont fontWithName:@"CabinCondensed-Bold" size:kFontSize];
    _foreLabel.backgroundColor = [UIColor clearColor];
    _foreLabel.textColor = _foreColor;
    _foreLabel.textAlignment = NSTextAlignmentCenter;
    _foreLabel.text = _title;
    
    // Set center
    [_foreLabel sizeToFit];
    _foreLabel.center = self.center;
    
    //*********
    [self addSubview:_bgLabel];
    [self addSubview:_foreLabel];
    
}
-(void) initMaskLayer
{
    CGRect frame = CGRectMake(0, 0, _foreLabel.bounds.size.width,_foreLabel.bounds.size.height);
    _waveLayer = [[FeWaveLayer alloc ] initWithFrame:frame];

    // Set Clips to Bounds = NO
    _foreLabel.clipsToBounds = NO;
    
    // Set waveLayer as ForeLabel's Mask
    _foreLabel.layer.mask = _waveLayer;
    
    // Redraw itself
    [_waveLayer setNeedsDisplay];
}

#pragma mark Action
-(void) show
{
    
}
-(void) dismiss
{
    
}
-(void) setPercent:(CGFloat)percent animate:(BOOL)animate
{
    if (_percent == percent)
        return;
    
    [_waveLayer setPercent:percent animate:animate];
}
@end
