//
//  FeLoveLoader.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeLoveLoader.h"
#import "FXBlurView.h"
#import "FeParticleLayer.h"

@interface FeLoveLoader ()
{
    CGFloat _height;
    CGFloat _center_y;
    CGFloat _width;
    CGFloat _center_x;
    BOOL _animate;
    NSTimeInterval _last;
    NSTimeInterval _now;
    NSInteger _died;
    NSInteger _len;
    CGFloat _dt;
}
@property (strong, nonatomic) NSMutableArray *arrParticles;
@property (weak, nonatomic) UIView *container;
@property (strong, nonatomic) UIImageView *backgroundStatic;
@property (strong, nonatomic) FXBlurView *backgroundBlur;
@property (strong, nonatomic) CADisplayLink *displayLink;

-(void) drawHeart;

-(void) commonInit;
-(void) initBackgroundBlur:(BOOL) blur;
@end
@implementation FeLoveLoader

-(id) initWithView:(UIView *)view blur:(BOOL)blur
{
    self = [super initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
    if (self)
    {
        _container = view;
        
        [self commonInit];
        
        [self initBackgroundBlur:blur];
    }
    return self;
}
-(void) commonInit
{
    /*
     var height = canvas.height;
     var center_y = height/2;
     var width = canvas.width;
     var center_x = width / 2;
     var animate = true;
     var particles = [];
     var last = Date.now(),now = 0;
     var died = 0,len = 0,dt;
     */
    
    _height = self.bounds.size.height;
    _center_y = self.center.y;
    _width = self.bounds.size.width;
    _center_x = self.center.x;
    
    _animate = YES;
    
    // Particles
    _arrParticles = [[NSMutableArray alloc] init];
    
    // Time eslaped
    NSDate *now = [NSDate date];
    _last = [now timeIntervalSince1970];
    _now = 0;
    
    _died = 0;
    _len = 0;
    
    
}
-(void) initBackgroundBlur:(BOOL)blur
{
    if (blur)
    {
        
    }
    else
    {
        _backgroundStatic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _backgroundStatic.image = [UIImage imageNamed:@"bgLoveLoader.jpg"];
        [self addSubview:_backgroundStatic];
    }
}
-(void) show
{
    [_container addSubview:self];
    
    if (!_displayLink)
    {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawHeart)];
        _displayLink.frameInterval = 2;
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}
-(void) dismiss
{
    
}
-(void)drawHeart
{
    /*
     var len = particles.length;
     dead = max_particles - len;
     for( var i = 0; i < dead && i < max_generation_per_frame; i++ ){
     particles.push(new Particle());
     }
     
     // Update the date
     now = Date.now();
     dt = last - now;
     dt /= 1000;
     last = now;
     particles.forEach(function(p){
     p.move(dt);
     });
     */
    
    _len = _arrParticles.count;
    _died = kMaxParticels - _len;
    
    for (NSInteger i = 0; i < _died && i < kMaxGenerationPerFrame; i++)
    {
        FeParticleLayer *partLayer = [[FeParticleLayer alloc] initWithView:self];
        [partLayer setNeedsDisplay];
        
        [_arrParticles addObject:partLayer];
        
        // add
        [self.layer addSublayer:partLayer];
    }
    
    // Update
    NSDate *now = [NSDate date];
    _now = [now timeIntervalSince1970];
    
    _dt = _last - _now;
    NSLog(@"dt = %f",_dt);
    
    //_dt /= 10;
    _last = _now;
    for (FeParticleLayer *layer in _arrParticles)
    {
        
        
        [layer move:_dt];
        [layer draw];
    }
    
}
@end
