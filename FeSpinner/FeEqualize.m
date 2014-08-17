//
//  FeEqualize.m
//  FeSpinner
//
//  Created by Nghia Tran on 8/14/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeEqualize.h"
#import "UIColor+flat.h"
#import <QuartzCore/QuartzCore.h>

#define kFe_Equalize_Width 100.0f
#define kFe_Equalize_Height 50.0f

#define kFe_Equalize_Bar_Width 20.0f
#define kFe_Equalize_Bar_Height 50.0f

@interface FeEqualize ()
{
    NSString *_title;
    
    // Target, method, object and block
    id targetForExecuting;
    SEL methodForExecuting;
    id objectForExecuting;
    dispatch_block_t completionBlock;
}
// Container View
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) CALayer *containerLayer;

// Bars
@property (strong, nonatomic) CAShapeLayer *firstBar;
@property (strong, nonatomic) CAShapeLayer *secondBar;
@property (strong, nonatomic) CAShapeLayer *thirdBar;
@property (strong, nonatomic) CAShapeLayer *fourthBar;
@property (strong, nonatomic) CAShapeLayer *fifthBar;

// Bezier path
@property (strong, nonatomic) UIBezierPath *originalBezierPath;
@property (strong, nonatomic) UIBezierPath *endBezierPath;

// Animation
@property (strong, nonatomic) CABasicAnimation *firstAnimation;
@property (strong, nonatomic) CABasicAnimation *secondAnimation;
@property (strong, nonatomic) CABasicAnimation *thirdAnimation;
@property (strong, nonatomic) CABasicAnimation *fourthAnimation;
@property (strong, nonatomic) CABasicAnimation *fifthAnimation;

// Title
@property (strong, nonatomic) UILabel *titleLbl;
/////////
-(void) initCommon;
-(void) initContainerLayer;
-(void) initBars;
-(void) initBezierPath;
-(void) initTitle;
-(void) initAnimation;
@end

@implementation FeEqualize

-(instancetype) initWithView:(UIView *)view title:(NSString *)title
{
    self = [super init];
    if (self)
    {
        _title = title;
        
        _containerView = view;
        
        [self initCommon];
        
        [self initContainerLayer];
        
        [self initBezierPath];
        
        [self initBars];
        
        [self initTitle];
        
        [self initAnimation];
    }
    return self;
}
-(void) initCommon
{
    _isShowing = NO;
    
    self.frame = CGRectMake(0, 0, _containerView.bounds.size.width, _containerView.bounds.size.height);
    self.backgroundColor = [UIColor colorWithHexCode:@"#141517"];
}

-(void) initContainerLayer
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, kFe_Equalize_Width, kFe_Equalize_Height);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    [self.layer addSublayer:_containerLayer];
}
-(void) initBars
{
    for (NSInteger i = 0; i < 5 ; i++)
    {
        CGPoint origin = CGPointMake(kFe_Equalize_Bar_Width * i, 0);
        if (i == 0)
        {
            _firstBar = [CAShapeLayer layer];
            _firstBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Width, kFe_Equalize_Width);
            _firstBar.path = _originalBezierPath.CGPath;
            _firstBar.fillColor = [UIColor colorWithHexCode:@"#0B486B"].CGColor;
            
            
            [_containerLayer addSublayer:_firstBar];
        }
        if (i == 1)
        {
            _secondBar = [CAShapeLayer layer];
            _secondBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _secondBar.fillColor = [UIColor colorWithHexCode:@"#3B8686"].CGColor;
            _secondBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_secondBar];
        }
        if (i == 2)
        {
            _thirdBar = [CAShapeLayer layer];
            _thirdBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _thirdBar.fillColor = [UIColor colorWithHexCode:@"#79BD9A"].CGColor;
            _thirdBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_thirdBar];
        }
        if (i == 3)
        {
            _fourthBar = [CAShapeLayer layer];
            _fourthBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _fourthBar.fillColor = [UIColor colorWithHexCode:@"#A8DBA8"].CGColor;
            _fourthBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_fourthBar];
        }
        if (i == 4)
        {
            _fifthBar = [CAShapeLayer layer];
            _fifthBar.frame = CGRectMake(origin.x, origin.y, kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height);
            _fifthBar.fillColor = [UIColor colorWithHexCode:@"#CFF09E"].CGColor;
            _fifthBar.path = _originalBezierPath.CGPath;
            
            [_containerLayer addSublayer:_fifthBar];
        }
    }
}
-(void) initBezierPath
{
    // Original Path
    _originalBezierPath = [UIBezierPath bezierPath];
    [_originalBezierPath moveToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width / 2.0f, kFe_Equalize_Bar_Height - 2.0f)];
    [_originalBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_originalBezierPath closePath];
    
    // end Path
    _endBezierPath = [UIBezierPath bezierPath];
    [_endBezierPath moveToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width / 2.0f, 0)];
    [_endBezierPath addLineToPoint:CGPointMake(kFe_Equalize_Bar_Width, kFe_Equalize_Bar_Height)];
    [_endBezierPath addLineToPoint:CGPointMake(0, kFe_Equalize_Bar_Height)];
    [_endBezierPath closePath];

}
-(void) initAnimation
{
    // First
    _firstAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _firstAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _firstAnimation.toValue = (id) _endBezierPath.CGPath;
    _firstAnimation.autoreverses = YES;
    _firstAnimation.duration = 0.5f;
    _firstAnimation.repeatCount = MAXFLOAT;
    _firstAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _secondAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _secondAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _secondAnimation.toValue = (id) _endBezierPath.CGPath;
    _secondAnimation.autoreverses = YES;
    _secondAnimation.duration = 0.5f;
    _secondAnimation.repeatCount = MAXFLOAT;
    _secondAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _thirdAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _thirdAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _thirdAnimation.toValue = (id) _endBezierPath.CGPath;
    _thirdAnimation.autoreverses = YES;
    _thirdAnimation.duration = 0.5f;
    _thirdAnimation.repeatCount = MAXFLOAT;
    _thirdAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _fourthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _fourthAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _fourthAnimation.toValue = (id) _endBezierPath.CGPath;
    _fourthAnimation.autoreverses = YES;
    _fourthAnimation.duration = 0.5f;
    _fourthAnimation.repeatCount = MAXFLOAT;
    _fourthAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
    
    _fifthAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    _fifthAnimation.fromValue = (id) _originalBezierPath.CGPath;
    _fifthAnimation.toValue = (id) _endBezierPath.CGPath;
    _fifthAnimation.autoreverses = YES;
    _fifthAnimation.duration = 0.5f;
    _fifthAnimation.repeatCount = MAXFLOAT;
    _fifthAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1];
}
-(void) initTitle
{
    _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _titleLbl.text = _title;
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.textColor = [UIColor colorWithHexCode:@"#CFF09E"];
    _titleLbl.font = [UIFont boldSystemFontOfSize:20];
    [_titleLbl sizeToFit];
    _titleLbl.center = CGPointMake(self.bounds.size.width  / 2.0f, _containerLayer.frame.origin.y + _containerLayer.frame.size.height + 16);
    
    [self addSubview:_titleLbl];
}

#pragma mark - Action
-(void) show
{
    if (_isShowing)
        return;
    
    _isShowing =  YES;
    
    [self performSelector:@selector(addFirstAniamtion) withObject:nil afterDelay:0];
    [self performSelector:@selector(addSecondAnimation) withObject:nil afterDelay:0.1f];
    [self performSelector:@selector(addThirdAnimation) withObject:nil afterDelay:0.2f];
    [self performSelector:@selector(addFourthAnimation) withObject:nil afterDelay:0.3f];
    [self performSelector:@selector(addFifthAnimation) withObject:nil afterDelay:0.4f];
}

-(void) dismiss
{
    if (!_isShowing)
        return;
    
    _isShowing = NO;
    
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
#pragma mark - Private
-(void) addFirstAniamtion
{
    [_firstBar addAnimation:_firstAnimation forKey:@"firstAnimation"];
}
-(void) addSecondAnimation
{
    [_secondBar addAnimation:_secondAnimation forKey:@"secondAnimation"];
}
-(void) addThirdAnimation
{
    [_thirdBar addAnimation:_thirdAnimation forKey:@"thirdAnimatin"];
}
-(void) addFourthAnimation
{
    [_fourthBar addAnimation:_fourthAnimation forKey:@"fourthAnimation"];
}
-(void) addFifthAnimation
{
    [_fifthBar addAnimation:_fifthAnimation forKey:@"fifthAnimation"];
}
@end
