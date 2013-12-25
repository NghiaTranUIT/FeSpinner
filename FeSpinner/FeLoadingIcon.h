//
//  FeLoadingIcon.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/19/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeLoadingIcon : UIView
@property (assign, nonatomic, readonly) BOOL isAnimating;

-(id) initWithView:(UIView *) view;

-(void) show;
-(void) dismiss;
@end
