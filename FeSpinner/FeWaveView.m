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

    float yc = 10;//The height of a crest.
    float w = 0;//starting x value.
    float y = rect.size.height;
    float width = rect.size.width;
    int cycles = 2;//number of waves
    float x = width/cycles;

    while (w <= width) {
        CGPathMoveToPoint(path, NULL, w,y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w+x/4, y/2 - yc, w+x/2, y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w+3*x/4, y/2 + yc, w+x, y/2);
        w+=x;
    }
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
    
}


@end
