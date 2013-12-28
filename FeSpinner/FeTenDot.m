//
//  FeTenDot.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/13/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeTenDot.h"

#define kMargeCenterX 10
#define kMargeCenterY 10
#define kDurationDot 0.15f

@interface FeTenDot ()
//Timer
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) BOOL isAnimating;

// Main View
@property (weak, nonatomic) UIView *mainView;
@property (assign, nonatomic) NSInteger indexDot;
@property (assign, nonatomic) CGPoint originCenter;

-(CGPoint) centerAtIndex:(NSInteger) index;
-(CATransform3D ) transform3DAtIndex:(NSInteger) index;
-(void) animate;
@end
@implementation FeTenDot

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id) initDotAtMainView:(UIView *) mainView atIndex:(NSInteger) index
{
    
    CGRect frame = CGRectMake(mainView.center.x, mainView.center.y, 20, 20);
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Deafault
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = self.bounds.size.width / 2;
        self.clipsToBounds = YES;
        _isAnimating = NO;
        _mainView = mainView;
        _indexDot = index;
        
        self.center = [self centerAtIndex:index];
        _originCenter = self.center;
        
        _originalTransform3D = [self transform3DAtIndex:index];
        self.layer.transform = _originalTransform3D;
        
        self.userInteractionEnabled = NO;
    }
    
    return self;
}

#pragma mark Main method
-(void) start
{
    if (_isAnimating)
    {
        return;
    }
    
    // Animate
    if (!_isAnimating)
    {
        // Set bool
        _isAnimating = YES;
        
        // First animate
        [self animate];
        
        // Run loop
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.7f target:self selector:@selector(animate) userInfo:nil repeats:HUGE_VAL];
    }
}
-(void) stop
{
    if (!_timer || !_isAnimating)
        return;
    
    if (_timer && _isAnimating)
    {
        [_timer invalidate];
        _isAnimating = NO;
    }
}
-(void) animate
{
    [UIView animateWithDuration:kDurationDot
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.layer.transform = CATransform3DIdentity;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:kDurationDot delay:1.2f options:UIViewAnimationOptionCurveEaseOut animations:^{
                             self.layer.transform = _originalTransform3D;
                             
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:0 delay:1.2f options:UIViewAnimationOptionCurveEaseOut animations:^{
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
                         }];
                     }];
}
-(void) reset
{
    [_timer invalidate];
    
    self.layer.transform = CATransform3DIdentity;
    
    self.center = _originCenter;
    
    _originalTransform3D = [self transform3DAtIndex:_indexDot];
    self.layer.transform = _originalTransform3D;
}

#pragma mark Helper method
-(CGPoint) centerAtIndex:(NSInteger)index
{
    CGPoint center;
    
    switch (index)
    {
        case 0:
        {
            center = CGPointMake(self.center.x - 10, self.center.y - 50);
            break;
        }
        case 1:
        {
            center = CGPointMake(self.center.x + 14, self.center.y - 43);
            
            break;
        }
        case 2:
        {
            center = CGPointMake(self.center.x + 29, self.center.y - 24);
            break;
        }
        case 3:
        {
            center = CGPointMake(self.center.x + 29, self.center.y);
            break;
        }
        case 4:
        {
            center = CGPointMake(self.center.x + 15, self.center.y + 22);
            break;
        }
        case 5:
        {
            center = CGPointMake(self.center.x - 10, self.center.y + 30);
            break;
        }
        case 6:
        {
            center = CGPointMake(self.center.x -35, self.center.y + 22);

            break;
        }
        case 7:
        {
            center = CGPointMake(self.center.x -49, self.center.y );
            break;
        }
        case 8:
        {
            center = CGPointMake(self.center.x - 49, self.center.y - 24);
            
            break;
        }
        case 9:
        {
            center = CGPointMake(self.center.x - 34, self.center.y - 43);
            break;
        }
        default:
            break;
    }
    return center;
}
-(CATransform3D) transform3DAtIndex:(NSInteger)index
{
    CATransform3D t = CATransform3DIdentity;
    switch (index) {
        case 0:
        {
            t = CATransform3DTranslate(t, 10 - kMargeCenterX, 50 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 1:
        {
            t = CATransform3DTranslate(t, -14 - kMargeCenterX, 43 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 2:
        {
            t = CATransform3DTranslate(t, -29 - kMargeCenterX, 24 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 3:
        {
            t = CATransform3DTranslate(t, -29 - kMargeCenterX, 0 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 4:
        {
            t = CATransform3DTranslate(t, -15 - kMargeCenterX, -22 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 5:
        {
            t = CATransform3DTranslate(t, 10 - kMargeCenterX, -30 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 6:
        {
            t = CATransform3DTranslate(t, 35 - kMargeCenterX, -22 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 7:
        {
            t = CATransform3DTranslate(t, 49 - kMargeCenterX, 0 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        case 8:
        {
            t = CATransform3DTranslate(t, 49 - kMargeCenterX, 24 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            
            break;
        }
        case 9:
        {
            t = CATransform3DTranslate(t, 34 - kMargeCenterX, 43 - kMargeCenterY, 0);
            t = CATransform3DScale(t, 0.1f, 0.1f, 0.1f);
            break;
        }
        default:
            break;
    }
    return t;
}
@end
