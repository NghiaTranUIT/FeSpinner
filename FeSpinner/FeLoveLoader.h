//
//  FeLoveLoader.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kMaxSize 24.0f
#define kMaxParticels 1000
#define kMinVel 20
#define kMaxGenerationPerFrame 10

@interface FeLoveLoader : UIView
-(id) initWithView:(UIView *) view blur:(BOOL) blur;

-(void) show;

-(void) dismiss;
@end
