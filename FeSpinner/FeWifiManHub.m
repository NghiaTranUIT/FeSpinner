//
//  FeWifiManHub.m
//  FeSpinner
//
//  Created by Nghia Tran on 5/28/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeWifiManHub.h"
#define kFe_WifiMan_Width 85.0f
#define kFe_WifiMan_Height 85.0f

@interface FeWifiManHub ()
{
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
@property (strong, nonatomic) UIImageView *wifimanImageView_colored;
@property (strong, nonatomic) UIImageView *wifiManImageView_grayScale;
@property (strong, nonatomic) CALayer *contentLayer;

@property (strong, nonatomic) UILabel *titleLbl;
@property (strong, nonatomic) UILabel *subTitleLbl;

// Mask
@property (strong, nonatomic) CALayer *maskLayer;

// Window
@property (weak, nonatomic) UIView *containerView;

-(void) initCommon;
-(void) initWifimanImageView;
-(void) initMaskLayer;
-(void) initTitle;
-(void) initWifiManHub;
@end
@implementation FeWifiManHub

-(id) initWithView:(UIView *)view withMode:(FeWifiManHubMode)mode
{
    self = [super init];
    if (self)
    {
        _containerView = view;
        self.frame = CGRectMake(0, 0, 181, 147);
        self.center = view.center;
        _currentMode = mode;
        
        self.hidden = YES;
        
        [self initCommon];
        
        [self initTitle];
        
        if (_currentMode == FeWifiManHubModeOnlyPercent)
        {
            [self initWifimanImageView];
            
            [self initMaskLayer];
        }
        else
        {
            [self initWifiManHub];
        }
    }
    return self;
}
-(void) initCommon
{
    _isAnimate = NO;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8f];
    self.layer.cornerRadius = 10.0f;
    self.clipsToBounds = YES;
}
-(void) initWifimanImageView
{
    CGRect frame = CGRectMake(48, 12, kFe_WifiMan_Width, kFe_WifiMan_Height);
    UIImage *imageColored = [UIImage imageNamed:@"wifimanhub"];
    UIImage *imageGray = [UIImage imageNamed:@"wifimanhub_grayscale"];
    
    // Colored
    _wifimanImageView_colored = [[UIImageView alloc] initWithFrame:frame];
    _wifimanImageView_colored.image = imageColored;
    
    // Gray
    _wifiManImageView_grayScale = [[UIImageView alloc] initWithFrame:frame];
    _wifiManImageView_grayScale.image = imageGray;
    
    [self addSubview:_wifiManImageView_grayScale];
    [self addSubview:_wifimanImageView_colored];
}
-(void) initTitle
{
    // Title
    _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 88, 181, 31)];
    _titleLbl.text = @"Đang tải";
    _titleLbl.font = [UIFont boldSystemFontOfSize:17];
    _titleLbl.backgroundColor = [UIColor clearColor];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.textColor = [UIColor whiteColor];
    
    // Sub
    _subTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 181, 31)];
    _subTitleLbl.text = @"Vui lòng chờ trong giây lát...";
    _subTitleLbl.font = [UIFont systemFontOfSize:12];
    _subTitleLbl.backgroundColor = [UIColor clearColor];
    _subTitleLbl.textAlignment = NSTextAlignmentCenter;
    _subTitleLbl.textColor = [UIColor whiteColor];
    
    [self addSubview:_titleLbl];
    [self addSubview:_subTitleLbl];
}
-(void) initMaskLayer
{
    _maskLayer = [CALayer layer];
    _maskLayer.frame = CGRectMake(0, 0, kFe_WifiMan_Width, kFe_WifiMan_Height);
    _maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    _maskLayer.anchorPoint = CGPointMake(0, 0);
    _maskLayer.position = CGPointMake(0,kFe_WifiMan_Height);
    
    _wifimanImageView_colored.layer.mask = _maskLayer;
}
-(void) initWifiManHub
{
    CGRect frame = CGRectMake(48, 12, kFe_WifiMan_Width, kFe_WifiMan_Height);
    UIImage *imageColored = [UIImage imageNamed:@"WifiMan_Sign_1"];
    
    /*
    // Colored
    _wifimanImageView_colored = [[UIImageView alloc] initWithFrame:frame];
    _wifimanImageView_colored.image = imageColored;
    [self addSubview:_wifimanImageView_colored];
     */
    
    _contentLayer = [CALayer layer];
    _contentLayer.frame = frame;
    _contentLayer.backgroundColor = [UIColor clearColor].CGColor;
    _contentLayer.contents = (id)imageColored.CGImage;
    [self.layer addSublayer:_contentLayer];
}
#pragma mark Action
-(void) show
{
    if (_isAnimate)
        return;
    
    _isAnimate = YES;
    self.hidden = NO;
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    NSArray *times = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1.0f], nil];
    [anim setKeyTimes:times];
    
    UIImage *image_1 = [UIImage imageNamed:@"WifiMan_Sign_1"];
    UIImage *image_2 = [UIImage imageNamed:@"WifiMan_Sign_2"];
    UIImage *image_3 = [UIImage imageNamed:@"WifiMan_Sign_3"];
    UIImage *image_4 = [UIImage imageNamed:@"WifiMan_Sign_4"];
    
    NSArray *values = @[(id)image_1.CGImage,(id)image_2.CGImage,(id)image_3.CGImage,(id)image_4.CGImage,(id)image_1.CGImage];
    
    [anim setValues:values];
    [anim setDuration:3.0f];
    [anim setKeyTimes:times];
    anim.repeatCount = MAXFLOAT;
    
    [_contentLayer addAnimation:anim forKey:@"content"];
    
}
-(void) dismiss
{
    if (!_isAnimate)
        return;
    
    [self removeFromSuperview];
    _isAnimate = NO;
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
-(void) setPercent:(CGFloat)percent
{
    if (_percent == percent)
        return;
    
    if (percent < 0 || percent > 1 || _currentMode != FeWifiManHubModeOnlyPercent)
        return;
    
    _percent = percent;
    
    // Update on Main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat denta = _percent * kFe_WifiMan_Height;
        _maskLayer.position = CGPointMake(0, kFe_WifiMan_Height - denta);
    });
    
    
}
@end
