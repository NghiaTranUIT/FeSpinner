//
//  FeThreeDotGlow.h
//  FeSpinner
//
//  Created by Nghia Tran on 1/4/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeThreeDotGlow : UIView

@property (assign, nonatomic, readonly) BOOL isShowing;

-(id) initWithView:(UIView *) view blur:(BOOL) blur;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;

@end
