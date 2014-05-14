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
    // last position of VietNam Bar
    CGPoint lastPosition;
    
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
    
}
// Container
@property (weak, nonatomic) UIView *container;

// Background
@property (strong, nonatomic) FXBlurView *backgroundBlur;
@property (strong, nonatomic) UIView *backgroundStatic;

// Arr of VietnamBar
@property (strong, nonatomic) NSMutableArray *arrVietNamBars;

// Label
@property (strong, nonatomic) UILabel *label;

// init common properties
-(void) commonInit;

// init Background
-(void) initBackgroundBlur:(BOOL) blur;

// init VietNamBar
-(void) initVietNamBars;

// init Label
-(void) initLabel;

// Reset label's titile with animation
-(void) resetLabel;

// executing method
-(void) executingMethod;

// cleanup memory
-(void) cleanUp;
@end
@implementation FeVietNamLoader

-(id) initWithView:(UIView *)view blur:(BOOL)blur color:(NSArray *)arrColors
{
    self =[super initWithFrame:view.bounds];
    if (self)
    {
        // set default properties
        _container = view;
        _isBlur = blur;
        _isAnimating = NO;
        
        // check arr colors
        if (arrColors)
            _arrColors = arrColors;
        else
        {
            _arrColors = @[[UIColor flatAlizarinColor],[UIColor flatEmeraldColor],[UIColor flatSunFlowerColor]];
        }
        
        // add subView and hidden;
        [_container addSubview:self];
        self.hidden = YES;
        self.alpha = 0;
        
        // init common
        [self commonInit];
        
        // init Background
        [self initBackgroundBlur:blur];
        
        // init Vietnam bar
        [self initVietNamBars];
        
        // init Label
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
        _backgroundBlur = [[FXBlurView alloc] initWithFrame:_container.bounds];
        _backgroundBlur.blurRadius = 40;
        _backgroundBlur.tintColor = [UIColor flatWetAsphaltColor];
        _backgroundBlur.dynamic = NO;
        [_backgroundBlur.layer displayIfNeeded];
        
        // Hide background
        _backgroundBlur.hidden = YES;
    }
    else
    {
        _backgroundStatic = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _backgroundStatic.userInteractionEnabled = NO;
        _backgroundStatic.backgroundColor = [UIColor flatWetAsphaltColor];
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
#pragma mark Override setter / getter
-(void) setTitle:(NSString *)title
{
    if ([title isEqualToString:_title])
        return;
    
    
    // set new titile
    _title = title;
    
    // reset label with animation
    [self resetLabel];
    
}
-(void) setFontTitle:(UIFont *)fontTitle
{
    if (_fontTitle == fontTitle)
        return;
    
    // set new font
    _fontTitle = fontTitle;
    
    // reset with animation
    [self resetLabel];
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
        _label.font = _fontTitle;
        _label.text = _title;
        
    }
    else
    {
        // Change the text
        _label.font = _fontTitle;
        _label.text = _title;
    }
    [_label sizeToFit];
    
    // set center
   _label.center = CGPointMake(self.center.x, lastPosition.y + 40);
}

#pragma mark Action
-(void) show
{
    if (_isAnimating)
        return;
    
    self.hidden = NO;
    self.alpha = 0;
    
    // Add background
    if (_isBlur)
    {
        _backgroundBlur.alpha = 0;
        _backgroundBlur.hidden = NO;
        [_container insertSubview:_backgroundBlur belowSubview:self];
    }
    else
    {
        [self insertSubview:_backgroundStatic atIndex:0];
    }
    
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

-(void) showWhileExecutingBlock:(dispatch_block_t)block
{
    [self showWhileExecutingBlock:block completion:nil];
}
-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object
{
    [self showWhileExecutingSelector:selector onTarget:target withObject:object completion:nil];
    
}
-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t)completion
{
    // Check block != nil
    if (block != nil)
    {
        [self show];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
                       {
                           block();
                           
                           // Update UI
                           dispatch_async(dispatch_get_main_queue(), ^{
                               completion();
                               [self dismiss];
                           });
                       });
    }
}
-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t)completion
{
    // Check Selector is responded
    if ([target respondsToSelector:selector])
    {
        methodForExecuting = selector;
        targetForExecuting = target;
        objectForExecuting = object;
        completionBlock = completion;
        
        [self show];
        [NSThread detachNewThreadSelector:@selector(executingMethod) toTarget:self withObject:nil];
    }
}
#pragma mark Helper method
-(void) executingMethod
{
    @autoreleasepool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		// Start executing the requested task
		[targetForExecuting performSelector:methodForExecuting withObject:objectForExecuting];
#pragma clang diagnostic pop
		// Task completed, update view in main thread (note: view operations should
		// be done only in the main thread)
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock();
            [self performSelectorOnMainThread:@selector(cleanUp) withObject:nil waitUntilDone:NO];
        });
		
	}
}
-(void) cleanUp
{
    NSLog(@"Clean up");
    if (objectForExecuting)
        objectForExecuting = nil;
    if (methodForExecuting)
        methodForExecuting = nil;
    if (targetForExecuting)
        targetForExecuting = nil;
    if (completionBlock)
        completionBlock = nil;
    [self dismiss];
}
@end
