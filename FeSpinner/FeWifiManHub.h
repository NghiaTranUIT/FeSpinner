//
//  FeWifiManHub.h
//  FeSpinner
//
//  Created by Nghia Tran on 5/28/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeWifiManHub : UIView
@property (assign, readonly, nonatomic) BOOL isAnimate;
@property (assign, nonatomic) CGFloat percent;

-(id) initWithView:(UIView *) view;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;

@end
