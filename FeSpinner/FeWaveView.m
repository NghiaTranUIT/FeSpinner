//
//  FeWaveView.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/22/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeWaveView.h"

@implementation FeWaveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGMutablePathRef path = CGPathCreateMutable();
    float x=100;
    float y = rect.size.height;
    
    float yc=0;
    float w=0;
    while (w<=rect.size.width)
    {
        CGPathMoveToPoint(path, nil, w,y/2);
        CGPathAddQuadCurveToPoint(path, nil, w+x/4, -yc,w+ x/2, y/2);
        CGPathMoveToPoint(path, nil, w+x/2,y/2);
        CGPathAddQuadCurveToPoint(path, nil, w+3*x/4, y+yc, w+x, y/2);
        CGContextAddPath(context, path);
        CGContextDrawPath(context, kCGPathStroke);
        w+=x;
    }
    //CGContextStrokePath(context);
}


@end
