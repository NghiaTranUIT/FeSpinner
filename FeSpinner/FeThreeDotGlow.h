//
//  FeThreeDotGlow.h
//  FeSpinner
//
//  Created by Nghia Tran on 1/4/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeThreeDotGlow : UIView
-(id) initWithView:(UIView *) view blur:(BOOL) blur;
-(void) show;
-(void) dismiss;
@end
