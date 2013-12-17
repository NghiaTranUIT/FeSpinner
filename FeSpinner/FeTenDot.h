//
//  FeTenDot.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/13/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeTenDot : UIView
@property (assign, nonatomic) CATransform3D originalTransform3D;
-(id) initDotAtMainView:(UIView *) mainView atIndex:(NSInteger) index;

-(void) start;
-(void) stop;
-(void) reset;
@end
