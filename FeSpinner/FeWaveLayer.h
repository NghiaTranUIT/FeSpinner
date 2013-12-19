//
//  FeWaveLayer.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FeWaveLayer : CALayer
-(id) initWithFrame:(CGRect )frame;
-(void) setPercent:(CGFloat) percent animate:(BOOL)animate;
@end
