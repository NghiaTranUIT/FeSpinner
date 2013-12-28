//
//  FeWaveLoadingIndicatorViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeWaveLoadingIndicatorViewController.h"
#import "FeWaveLoadingIndicator.h"
#import "FeWaveLayer.h"
#import "FeWaveView.h"
#import <QuartzCore/QuartzCore.h>

@interface FeWaveLoadingIndicatorViewController ()
@property (strong, nonatomic) FeWaveLoadingIndicator *waveLoadingIndicator;
@end

@implementation FeWaveLoadingIndicatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _waveLoadingIndicator = [[FeWaveLoadingIndicator alloc] initWithView:self.view title:@"LOADING" backgroundColor:[UIColor colorWithRed:34.0f/255.0f green:34.0f/255.0f  blue:34.0f/255.0f  alpha:1] foregroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:_waveLoadingIndicator];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end