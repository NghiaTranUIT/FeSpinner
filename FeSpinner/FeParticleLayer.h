//
//  FeParticleLayer.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FeParticleLayer : CALayer

-(id) initWithView:(UIView *)view;

// Move
-(void) move:(CGFloat) dt;

// Draw
-(void) draw;
@end
