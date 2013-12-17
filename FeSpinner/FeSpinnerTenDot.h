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

// BOOL
@property (assign, nonatomic, readonly) BOOL isShouldBlur;
@property (assign, nonatomic) BOOL isAnimating;

// Title
@property (strong, nonatomic) NSString *titleLabelText;
@property (strong, nonatomic) UIFont *fontTitleLabel;

-(void) show;

-(void) dismiss;
@end
