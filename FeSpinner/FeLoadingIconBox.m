//
//  FeLoadingIconBox.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/19/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeLoadingIconBox.h"
#define kBoxHeight 25

@interface FeLoadingIconBox ()
@property (strong, nonatomic) NSTimer *timer;

-(CGRect) frameAtIndex:(NSInteger) index;
-(void) animate;

@end
@implementation FeLoadingIconBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id) initBoxAtIndex:(NSInteger)index
{
    CGRect frame = [self frameAtIndex:index];
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _isAnimating = NO;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
        self.userInteractionEnabled = NO;
    }
    return self;
}
-(void) setupAlphaBoxAtIndex:(NSInteger) index
{
    switch (index) {
        case 6:
        {
            self.alpha = 0.5f;
            break;
        }
        case 7:
        {
            self.alpha = 0.5f;
            break;
        }
        case 10:
        {
            self.alpha = 0.5f;
            break;
        }
        case 11:
        {
            self.alpha = 0.5f;
            break;
        }
        default:
            break;
    }
}
-(CGRect) frameAtIndex:(NSInteger)index
{
    CGRect frame;
    switch (index) {
        case 1:
        {
            frame = CGRectMake(0, 0, kBoxHeight, kBoxHeight);
            break;
        }
        case 2:
        {
            frame = CGRectMake(25, 0, kBoxHeight, kBoxHeight);
            break;
        }
        case 3:
        {
            frame = CGRectMake(50, 0, kBoxHeight, kBoxHeight);
            break;
        }
        case 4:
        {
            frame = CGRectMake(75, 0, kBoxHeight, kBoxHeight);
            break;
        }
        case 5:
        {
            frame = CGRectMake(0, 25, kBoxHeight, kBoxHeight);
            break;
        }
        case 6:
        {
            frame = CGRectMake(25, 25, kBoxHeight, kBoxHeight);
            break;
        }
        case 7:
        {
            frame = CGRectMake(50, 25, kBoxHeight, kBoxHeight);
            break;
        }
        case 8:
        {
            frame = CGRectMake(75, 25, kBoxHeight, kBoxHeight);
            break;
        }
        case 9:
        {
            frame = CGRectMake(0, 50, kBoxHeight, kBoxHeight);
            break;
        }
        case 10:
        {
            frame = CGRectMake(25, 50, kBoxHeight, kBoxHeight);
            break;
        }
        case 11:
        {
            frame = CGRectMake(50, 50, kBoxHeight, kBoxHeight);
            break;
        }
        case 12:
        {
            frame = CGRectMake(75, 50, kBoxHeight, kBoxHeight);
            break;
        }
        case 13:
        {
            frame = CGRectMake(0, 75, kBoxHeight, kBoxHeight);
            break;
        }
        case 14:
        {
            frame = CGRectMake(25, 75, kBoxHeight, kBoxHeight);
            break;
        }
        case 15:
        {
            frame = CGRectMake(50, 75, kBoxHeight, kBoxHeight);
            break;
        }
        case 16:
        {
            frame = CGRectMake(75, 75, kBoxHeight, kBoxHeight);
            break;
        }
        default:
            break;
    }
    return frame;
}

#pragma mark Action
-(void) playAnimate
{
    if (_isAnimating) {
        return;
    }
    
    [self animate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.55f target:self selector:@selector(animate) userInfo:nil repeats:YES];
    NSLog(@"animating");
    
}
-(void) stopAnimate
{
    if (!_isAnimating)
        return;
    
    [_timer invalidate];
}
-(void) animate
{
    [UIView animateWithDuration:0.275f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.275f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
        } completion:^(BOOL finished) {
            
        }];
    }];
}
@end
