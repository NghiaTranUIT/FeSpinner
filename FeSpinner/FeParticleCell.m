//
//  FeParticleCell.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeParticleCell.h"

@implementation FeParticleCell
-(void) random
{
    self.color = [UIColor redColor].CGColor;
    self.name = @"particle";
    
    self.birthRate = 10;
    self.lifetime = 3;
    self.lifetimeRange = 1;
    
    self.emissionRange = 2 * M_PI;
    
    self.velocity = 100;
    self.velocityRange = 50;
    
    self.scale = 1.0f;
    self.scaleRange = 0.5f;
    
    self.yAcceleration = 10;
}
@end
