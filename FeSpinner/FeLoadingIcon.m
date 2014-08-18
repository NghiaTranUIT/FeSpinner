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
#import "FXBlurView.h"

#define kDurationPerColor 2.0f

@interface FeLoadingIcon ()
{
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
@property (weak, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIView *bigBoxView;

@property (strong, nonatomic) UIView *backgroundStatic;
@property (strong, nonatomic) FXBlurView *backgroundBlur;

@property (strong, nonatomic) NSMutableArray *arrBox;
@property (strong, nonatomic) NSArray *arrColor;
@property (strong, nonatomic) NSTimer *timer;

// ***********
-(void) commonInit;
-(void) initBackgroundWithBlur:(BOOL) blur;
-(void) initBox;
-(void) initColor;
-(void) animteColor;
-(void) cleanUp;
-(void) executeSelector;
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

-(id) initWithView:(UIView *)view blur:(BOOL)blur backgroundColors:(NSArray *)arrColor
{
    CGRect frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height);
    self = [super initWithFrame:frame];
    if (self)
    {
        _containerView = view;
        _isAnimating = NO;
        
        [self commonInit];
        [self initBackgroundWithBlur:blur];
        
        // init color as default
        if (!arrColor)
            [self initColor];
        else
            _arrColor = arrColor;
        
        // init small Box
        [self initBox];
    }
    return self;
}
-(void) commonInit
{
    self.hidden = YES;
    self.alpha = 0;
    
    
}
-(void) initBackgroundWithBlur:(BOOL)blur
{
    _isBlur = blur;
    
    if (blur)
    {
        _backgroundBlur = [[FXBlurView alloc] initWithFrame:_containerView.bounds];
        _backgroundBlur.blurRadius = 40;
        _backgroundBlur.tintColor = [UIColor colorWithHexCode:@"#32ce55"];
        _backgroundBlur.dynamic = NO;
        [_backgroundBlur.layer displayIfNeeded];
        
        // Hide background
        _backgroundBlur.hidden = YES;
    }
    else
    {
        _backgroundStatic = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _backgroundStatic.userInteractionEnabled = NO;
        _backgroundStatic.backgroundColor = [UIColor flatCarrotColor];
    }
}
-(void) initBox
{
    // init Big Box
    _bigBoxView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _bigBoxView.center = self.center;
    _bigBoxView.layer.cornerRadius = 40.0f;
    _bigBoxView.clipsToBounds = YES;
    _bigBoxView.alpha = 0;
    
    [self addSubview:_bigBoxView];
    
    // init small box
    _arrBox = [[NSMutableArray alloc ]initWithCapacity:16];
    for (NSInteger i = 1; i <= 16; i++)
    {
        FeLoadingIconBox *box = [[FeLoadingIconBox alloc] initBoxAtIndex:i];
        [_bigBoxView addSubview:box];
        
        // add small to big box
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
    self.alpha = 0;
    
    // Add background
    if (_isBlur)
    {
        _backgroundBlur.alpha = 0;
        _backgroundBlur.hidden = NO;
        [_containerView insertSubview:_backgroundBlur belowSubview:self];
    }
    else
    {
        [self insertSubview:_backgroundStatic atIndex:0];
    }
    // call delegate
    if ([_delegate respondsToSelector:@selector(FeLoadingIconWillShow:)])
    {
        [_delegate FeLoadingIconWillShow:self];
    }
    
    // animatin
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.alpha = 1;
                         
                         if (_isBlur)
                         {
                             _backgroundBlur.alpha = 1;
                         }
                     } completion:^(BOOL finished) {
                         
                         _isAnimating = YES;
                         
                         // Call delgate method
                         if ([_delegate respondsToSelector:@selector(FeLoadingIconDidShow:)])
                         {
                             [_delegate FeLoadingIconDidShow:self];
                         }
                         
                         // animate color
                         [self animteColor];
                         
                         // animate Big Box
                         [UIView animateWithDuration:[self delayAtIndex:0] animations:^{
                             _bigBoxView.alpha = 1;
                         } completion:^(BOOL finished) {
                             
                         }];
                         
                         // animate small Box
                         for (NSInteger i = 1; i <= 16; i++)
                         {
                             FeLoadingIconBox *box = _arrBox[i-1];
                             CGFloat delay = [self delayAtIndex:i];
                             
                             [box performSelector:@selector(playAnimate) withObject:nil afterDelay:delay];
                         }
                         
                         
                         
                     }];
    
    
}
-(void) animteColor
{
    // Sum duration of each box
    CGFloat allDuration = kDurationPerColor * _arrColor.count;
    
    [UIView animateKeyframesWithDuration:allDuration delay:0 options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  for (NSInteger i = 0; i < _arrColor.count; i++)
                                  {
                                      CGFloat percentStartTime = (kDurationPerColor * i) / allDuration;
                                      CGFloat percentDuration = kDurationPerColor / allDuration;
                                      
                                      // Add keyframe
                                      [UIView addKeyframeWithRelativeStartTime:percentStartTime relativeDuration:percentDuration animations:^{
                                          _bigBoxView.backgroundColor = _arrColor[i];
                                      }];
                                  }
                                  
                                  
                              } completion:^(BOOL finished) {
                                  
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
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        // Stop big box
        [_bigBoxView.layer removeAllAnimations];
        
        // Stop small Box
        for (NSInteger i = 1; i <= 16; i++)
        {
            FeLoadingIconBox *box = _arrBox[i-1];
            
            [box stopAnimate];
        }
        
        // Call delgate method
        if ([_delegate respondsToSelector:@selector(FeLoadingIconDidDismiss:)])
        {
            [_delegate FeLoadingIconDidDismiss:self];
        }
        
        [self removeFromSuperview];
        
        _isAnimating = NO;
        
    }];
    
   
}
-(void) showWhileExecutingBlock:(dispatch_block_t)block
{
    [self showWhileExecutingBlock:block completion:nil];
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

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object
{
    [self showWhileExecutingSelector:selector onTarget:target withObject:object completion:nil];
}
-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t)completion
{
    if ([target respondsToSelector:selector])
    {
        methodForExecuting = selector;
        targetForExecuting = target;
        objectForExecuting = object;
        completionBlock = completion;
        
        // Run
        [self show];
        
        // execute selector in background thread
        [NSThread detachNewThreadSelector:@selector(executeSelector) toTarget:self withObject:nil];
    }
}
-(void) executeSelector
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
