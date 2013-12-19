//
//  FeSpinnerTenDot.h
//  FeSpinner
//
//  Created by Nghia Tran on 11/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)();
@interface FeSpinnerTenDot : UIView

// Init Fe Spinner View Ten Dot
-(id) initWithView:(UIView *) view withBlur:(BOOL) blur;

// Title
@property (strong, nonatomic) NSString *titleLabelText;
@property (strong, nonatomic) UIFont *fontTitleLabel;


-(void) show;

-(void) showWhileExecutingBlock:(Block) block;

-(void) showWhileExecutingTarget:(id) target action:(SEL) selector;

-(void) dismiss;
@end
