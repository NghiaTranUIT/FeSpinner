//
//  FeWaveLayer.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
typedef void (^FeWaveLayerBlock)(BOOL finished);

@interface FeWaveLayer : CAShapeLayer
// Determine wave is Loading ( 0 -> 100%)
@property (assign, nonatomic, readonly) BOOL isLoading;

// Determine wave is waving
@property (assign, nonatomic, readonly) BOOL isWaving;

@property (assign, nonatomic, readonly) CGFloat currentPercent;

-(id) initWithFrame:(CGRect )frame;
-(void) setPercent:(CGFloat) percent animate:(BOOL)animate completionBlock:(FeWaveLayerBlock) completion;
-(void) starAnimate;
-(void) stopAnimate;

@end
