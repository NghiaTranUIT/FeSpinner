//
//  FeWaveLayer.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FeWaveLayer : CAShapeLayer
// Determine wave is Loading ( 0 -> 100%)
@property (assign, nonatomic, readonly) BOOL isLoading;

// Determine wave is waving
@property (assign, nonatomic, readonly) BOOL isWaving;

-(id) initWithFrame:(CGRect )frame;
-(void) setPercent:(CGFloat) percent animate:(BOOL)animate;
-(void) starAnimate;
-(void) stopAnimate;

@end
