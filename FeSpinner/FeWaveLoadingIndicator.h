//
//  FeWaveLoadingIndicator.h
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeWaveLoadingIndicator : UIView
// percent of Indicator
@property (assign, nonatomic, readonly) NSInteger percent;

// Init Fe WaveLoading Indicator
-(id) initWithView:(UIView *) view title:(NSString *) title backgroundColor:(UIColor *) bgColor foregroundColor:(UIColor *) foreColor;

// show
-(void) show;

// Dismiss
-(void) dismiss;

// Set percent
-(void) setPercent:(CGFloat) percent animate:(BOOL) animate;

@end
