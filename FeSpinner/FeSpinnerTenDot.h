//
//  FeSpinnerTenDot.h
//  FeSpinner
//
//  Created by Nghia Tran on 11/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeSpinnerTenDot : UIView
-(id) initWithView:(UIView *) view withBlur:(BOOL) blur;
@property (assign, nonatomic) BOOL isShouldBlur;

-(void) show;

-(void) hide;

-(void) dismiss;
@end
