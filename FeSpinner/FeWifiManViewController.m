//
//  FeWifiManViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 5/28/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeWifiManViewController.h"
#import "FeWifiManHub.h"

@interface FeWifiManViewController ()
@property (strong, nonatomic) FeWifiManHub *wifiManHub;
@end

@implementation FeWifiManViewController

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
    
    _wifiManHub = [[FeWifiManHub alloc] initWithView:self.view];
    [self.navigationController.view addSubview:_wifiManHub];
    
    
    [_wifiManHub showWhileExecutingBlock:^{
        [self myProgressTask];
    } completion:^{
        NSLog(@"Completion");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)myProgressTask {
	// This just increases the progress indicator in a loop
	float progress = 0.0f;
	while (progress < 1.0f) {
		progress += 0.01f;
        NSLog(@"percent = %.2f",progress);\
        
        // Set percent
		_wifiManHub.percent = progress;
		usleep(50000);
	}
}
@end
