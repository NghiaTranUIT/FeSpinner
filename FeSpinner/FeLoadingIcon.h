//
//  FeLoadingIcon.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/19/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FeLoadingIconDelegate;

@interface FeLoadingIcon : UIView
// Delegate
@property (weak, nonatomic) id<FeLoadingIconDelegate> delegate;

// Determine FeloadingIcon is animating;
@property (assign, nonatomic, readonly) BOOL isAnimating;

// Determine background is Blur;
@property (assign, nonatomic, readonly) BOOL isBlur;

-(id) initWithView:(UIView *) view blur:(BOOL) blur backgroundColors:(NSArray *) arrColor;

-(void) show;

-(void) showWhileExecutingBlock:(dispatch_block_t) block;

-(void) showWhileExecutingBlock:(dispatch_block_t)block completion:(dispatch_block_t) completion;

-(void) showWhileExecutingSelector:(SEL) selector onTarget:(id) target withObject:(id) object;

-(void) showWhileExecutingSelector:(SEL)selector onTarget:(id)target withObject:(id)object completion:(dispatch_block_t) completion;

-(void) dismiss;
@end

@protocol FeLoadingIconDelegate <NSObject>
@optional
-(void) FeLoadingIconWillShow:(FeLoadingIcon *) sender;
-(void) FeLoadingIconDidShow:(FeLoadingIcon *) sender;
-(void) FeLoadingIconDidDismiss:(FeLoadingIcon *)sender;

@end