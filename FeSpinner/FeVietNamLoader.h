//
//  FeVietNamLoader.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/30/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeVietNamLoader : UIView
@property (assign, nonatomic, readonly) BOOL isBlur;
@property (assign, nonatomic,readonly) BOOL isAnimating;
@property (strong, nonatomic, readonly) NSArray *arrColors;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIFont *fontTitle;

-(id) initWithView:(UIView *) view blur:(BOOL) blur color:(NSArray *) arrColors;

-(void) show;

-(void) dismiss;
@end
