//
//  FeParticleLayer.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeParticleLayer.h"
#import "FeLoveLoader.h"

#define ARC4RANDOM_MAX      0x100000000

@interface FeParticleLayer ()
{
    CGFloat _x,_y;
    CGFloat _size;
    CGFloat _x_vel;
    CGFloat _y_vel;
    
    CGFloat _nx;
    CGFloat _ny;
    
    //Color
    CGFloat _r,_g,_b;
    CGFloat _a;
}
@property (weak, nonatomic) UIView *container;

-(void) commonInit;
-(BOOL) isInsideHeartX:(CGFloat) x Y:(CGFloat) y;
-(CGFloat) randomSize:(CGFloat) size freq:(CGFloat) freq;
@end
@implementation FeParticleLayer
-(id) initWithView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        _container = view;
        [self commonInit];
    }
    return self;
}
-(void) commonInit
{
    /*
     var x = center_x;
     var y = center_y;
     var size = ~~random(max_size,2.4);
     console.log(size);
     var x_vel = ((max_size + min_vel) - size)/2 - (Math.random() * ((max_size + min_vel) - size));
     var y_vel = ((max_size + min_vel) - size)/2 - (Math.random() * ((max_size + min_vel) - size));
     var nx = x;
     var ny = y;
     var r,g,b,a = 0.05 * size;
     */
    
    _x = _container.center.x;
    _y = _container.center.y;
    _size = [self randomSize:kMaxSize freq:2.4f];
    
    // velocity
    double randomX = ((double)arc4random() / ARC4RANDOM_MAX);
    double randomY = ((double)arc4random() / ARC4RANDOM_MAX);
    _x_vel = ((kMaxSize + kMinVel) - _size) / 2 - (randomX * ((kMaxSize + kMinVel) - _size));
    _y_vel = ((kMaxSize + kMinVel) - _size) / 2 - (randomY * ((kMaxSize + kMinVel) - _size));
    
    _nx = _x;
    _ny = _y;
    _a = 0.05f * _size;
    
    // init frame
    self.frame = CGRectMake(0, 0, _size, _size);
    self.position = CGPointMake(_x, _y);
    
    self.cornerRadius = _size / 2;
    
}
-(BOOL) isInsideHeartX:(CGFloat)x Y:(CGFloat)y
{
    CGPoint center = _container.center;
    /*
    CGFloat __x = ((x - center.x) / (center.x)) * 3;
    CGFloat __y = ((y - center.y) / (center.y)) * -3;
    */
    CGFloat __x = ((x - 140) / (140)) * 3;
    CGFloat __y = ((y - 240) / (240)) * -3;
    
    // Root square
    CGFloat x2 = __x * __x;
    CGFloat y2 = __y * __y;
    
    // Equation of love curve
    // (x^2+y^2-1)^3-x^2y^3=0.
    BOOL isInside = NO;
    
    if ((powf((x2 + y2 - 1), 3) - (x2 * (y2 * __y))) < 0)
        isInside = YES;
    else
        isInside = NO;
    
    return isInside;
}
-(CGFloat) randomSize:(CGFloat)size freq:(CGFloat)freq
{
    /*
     var val = 0;
     var iter = freq;
     do{
     size /= iter;
     iter += freq;
     val += size * Math.random();
     }while( size >= 1);
     return val;
     */
    
    CGFloat val = 0;
    CGFloat iter = freq;
    
    do {
        size /= iter;
        iter +=freq;
        double random = ((double)arc4random() / ARC4RANDOM_MAX);
        val += size * random;
    } while (size >= 1);
    
    return val;
}

#pragma mark render
/*
-(void) drawInContext:(CGContextRef)ctx
{
    NSLog(@"draw in context");
    
    CGContextSetAllowsAntialiasing(ctx, YES);
    CGContextSetShouldAntialias(ctx, YES);
    
    // begin path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, _x, _y);
    CGPathAddArc(path, nil, _x, _y, _size, 0, M_PI * 2, YES);
    CGPathCloseSubpath(path);
    
    // Fill
    CGContextAddPath(ctx, path);
    CGContextSetLineWidth(ctx, 0);
    
    // Color
    _r = ( _x / (CGFloat)_container.bounds.size.width);
    _g = (1 - ( _y / (CGFloat)_container.bounds.size.height));
    _b = 1 - _r;
    
    UIColor *fillColor = [ UIColor colorWithRed:_r green:_g blue:_b alpha:_a];
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);
}
 */
-(void) draw
{
    _r = ( _x / (CGFloat)_container.bounds.size.width);
    _g = (1 - ( _y / (CGFloat)_container.bounds.size.height));
    _b = 1 - _r;

    
    self.backgroundColor = [UIColor colorWithRed:_r green:_g blue:_b alpha:_a].CGColor;
    
}
-(void) move:(CGFloat)dt
{
    /*
     nx += x_vel * dt;
     ny += y_vel * dt;
     if( !isInsideHeart(nx,ny)){
     if( !isInsideHeart(nx,y)){
     x_vel *= -1;
     return;
     }
     if( !isInsideHeart(x,ny)){
     y_vel *= -1;
     return;
     }
     // Lets do the crazy furbidden
     x_vel = -1 * y_vel;
     y_vel = -1 * x_vel;
     return;
     }
     x = nx;
     y = ny;
     }

     */
    _nx += _x_vel * dt;
    _ny += _y_vel * dt;
    
    if (![self isInsideHeartX:_nx Y:_ny])
    {
        if (![self isInsideHeartX:_nx Y:_y])
        {
            _x_vel *= -1;
            return;
        }
        if (![self isInsideHeartX:_x Y:_ny])
        {
            _y_vel *= -1;
            return;
        }
        
        // Crazy furbidden
        _x_vel = -1 * _y_vel;
        _y_vel = -1 * _x_vel;
        return;
    }
    _x = _nx;
    _y = _ny;
    
    self.position = CGPointMake(_x, _y);
}
@end
