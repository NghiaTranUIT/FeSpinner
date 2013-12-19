//
//  FeWaveLayer.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeWaveLayer.h"

#define kMaxIndex 30

@interface FeWaveLayer ()
{
    //*******************
    // Control point
    // Curve
    // Quad Curve
    // 1
    CGPoint quadCurvePoint_1;
    CGPoint endQuadCurvePoint_2;
    
    // 2
    CGPoint controlPoint_3;
    CGPoint controlPoint_4;
    CGPoint endControlPoint_5;
    
    // 3
    CGPoint quadCurvePoint_6;
    CGPoint endQuadCurvePoint_7;
    
    // 4
    CGPoint quadCurvePoint_8;
    CGPoint endQuadCurvePoint_9;
    
    // 5
    CGPoint controlPoint_10;
    CGPoint controlPoint_11;
    CGPoint endControlPoint_12;
    
    // Close path
    // Low Right
    CGPoint lowRightPoint;
    
    // Low Left
    CGPoint lowLeftPoint;
    
    // *********************
    // Start / end point
    CGPoint startPoint;
    CGPoint endPoint;
    
    // Index
    NSInteger index;
    
    // Increase / Decrease
    BOOL isIncrease;
}
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) BOOL isAnimating;

@property (strong, nonatomic) UIBezierPath *path;

// Caculator control Point
-(void) calculatorPoint;
-(CGFloat) factorWidth:(CGFloat) number;
-(CGFloat) factorHeight:(CGFloat) number;
-(void) smoothPath;
@end

@implementation FeWaveLayer
@synthesize path = _path;

-(id) initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self)
    {
        self.frame = frame;
        
        //self.allowsEdgeAntialiasing = YES;
        self.magnificationFilter = kCAFilterNearest;
        
        _isAnimating = NO;
        index = 0;
        isIncrease = YES;
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
        _displayLink.frameInterval = 2.0f;
        [self setNeedsDisplayOnBoundsChange:YES];
        
        startPoint = CGPointMake(0, frame.size.height / 2);
        endPoint = CGPointMake(frame.size.width, frame.size.height /2);
        
        lowRightPoint = CGPointMake(self.frame.size.width, self.frame.size.height);
        lowLeftPoint = CGPointMake(0, self.frame.size.height);
    }
    return self;
}
-(void) drawInContext:(CGContextRef)ctx
{
    CGContextSetAllowsAntialiasing(ctx, YES);
    CGContextSetShouldAntialias(ctx, YES);
    
    
    if (!_isAnimating)
    {
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _isAnimating = YES;
        return;
    }
    // Calculator Point
    [self calculatorPoint];
    
    //**************
    // Draw it self
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, nil, startPoint.x, startPoint.y);
    
    /*
    CGPathAddQuadCurveToPoint(pathRef, nil, quadCurvePoint_1.x, quadCurvePoint_1.y, endQuadCurvePoint_2.x, endQuadCurvePoint_2.y);
    CGPathAddCurveToPoint(pathRef, nil, controlPoint_3.x, controlPoint_3.y, controlPoint_4.x, controlPoint_4.y, endControlPoint_5.x, endControlPoint_5.y);
    CGPathAddQuadCurveToPoint(pathRef, nil, quadCurvePoint_6.x, quadCurvePoint_6.y, endQuadCurvePoint_7.x, endQuadCurvePoint_7.y);
    CGPathAddQuadCurveToPoint(pathRef, nil, quadCurvePoint_8.x, quadCurvePoint_8.y, endQuadCurvePoint_9.x, endQuadCurvePoint_9.y);
    CGPathAddCurveToPoint(pathRef, nil, controlPoint_10.x, controlPoint_10.y, controlPoint_11.x, controlPoint_11.y, endControlPoint_12.x, endControlPoint_12.y);
    */
    //******************
    // Smooth Drawing
    
    controlPoint_3 = CGPointMake((endQuadCurvePoint_2.x + controlPoint_4.x) / 2, (endQuadCurvePoint_2.y + controlPoint_4.y) / 2);
    quadCurvePoint_6 = CGPointMake((endControlPoint_5.x + endQuadCurvePoint_7.x) / 2, (endControlPoint_5.y + endQuadCurvePoint_7.y) / 2);
    endQuadCurvePoint_9 = CGPointMake((quadCurvePoint_8.x + controlPoint_10.x) / 2, (quadCurvePoint_8.y + controlPoint_10.y) / 2);
    
    
    CGPathAddCurveToPoint(pathRef, nil, quadCurvePoint_1.x, quadCurvePoint_1.y, endQuadCurvePoint_2.x, endQuadCurvePoint_2.y, controlPoint_3.x, controlPoint_3.y);
    CGPathAddCurveToPoint(pathRef, nil, controlPoint_4.x, controlPoint_4.y, endControlPoint_5.x, endControlPoint_5.y, quadCurvePoint_6.x, quadCurvePoint_6.y);
    CGPathAddCurveToPoint(pathRef, nil, endQuadCurvePoint_7.x, endQuadCurvePoint_7.y, quadCurvePoint_8.x, quadCurvePoint_8.y, endQuadCurvePoint_9.x, endQuadCurvePoint_9.y);
    CGPathAddCurveToPoint(pathRef, nil, controlPoint_10.x, controlPoint_10.y, controlPoint_11.x, controlPoint_11.y, endControlPoint_12.x, endControlPoint_12.y);
    
    
    
    
    // Close Path
    CGPathAddLineToPoint(pathRef, nil, lowRightPoint.x, lowRightPoint.y);
    CGPathAddLineToPoint(pathRef, nil, lowLeftPoint.x, lowLeftPoint.y);
    CGPathCloseSubpath(pathRef);
    
    // Add path to Context
    CGContextAddPath(ctx, pathRef);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextFillPath(ctx);
    
    CGContextStrokePath(ctx);
    
    if (isIncrease)
        index ++;
    else
        index --;
    
    if ((index >= kMaxIndex / 2) && isIncrease)
    {
        index = kMaxIndex / 2;
        isIncrease = NO;
    }
    else
    if ((index <= - (kMaxIndex / 2)) && !isIncrease)
    {
        index = - (kMaxIndex / 2);
        isIncrease = YES;
    }
    
}
-(void) calculatorPoint
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    quadCurvePoint_1 = CGPointMake([self factorWidth:30.0f] * width, [self factorHeight:129.0f] * height + index);
    endQuadCurvePoint_2 = CGPointMake([self factorWidth:77.0f] * width, [self factorHeight:157.0f] * height -index);
    
    controlPoint_3 = CGPointMake([self factorWidth:190.0f] * width, [self factorHeight:210.0f] * height + index);
    controlPoint_4 = CGPointMake([self factorWidth:200.0f] * width, [self factorHeight:70.0f] * height - index);
    endControlPoint_5 = CGPointMake([self factorWidth:303.0f] * width, [self factorHeight:125.0f] * height + index);
    
    quadCurvePoint_6 = CGPointMake([self factorWidth:340.0f] * width, [self factorHeight:150.0f] * height - index);
    endQuadCurvePoint_7 =  CGPointMake([self factorWidth:350.0f] * width, [self factorWidth:150.0f] * height + index);
    
    quadCurvePoint_8 = CGPointMake([self factorWidth:380.0f] * width, [self factorHeight:155.0f] * height - index);
    endQuadCurvePoint_9 =  CGPointMake([self factorWidth:410.0f] * width, [self factorWidth:145.0f] * height + index);
    
    controlPoint_10 = CGPointMake([self factorWidth:500.0f] * width, [self factorHeight:100.0f] * height - index);
    controlPoint_11 = CGPointMake([self factorWidth:540.0f] * width, [self factorHeight:190.0f] * height + index);
    endControlPoint_12 = CGPointMake([self factorWidth:580.0f] * width, [self factorHeight:165.0f] * height - index);
    
}
-(CGFloat) factorHeight:(CGFloat)number
{
    CGFloat factor = number / 320.0f;
    return factor;
}
-(CGFloat) factorWidth:(CGFloat)number
{
    CGFloat factor = number / 480.0f;
    return factor;
}
-(void) smoothPath
{
    // Mamual
    
}
@end
