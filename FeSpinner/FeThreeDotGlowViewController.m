//
//  FeThreeDotGlowViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 1/4/14.
//  Copyright (c) 2014 fe. All rights reserved.
//

#import "FeThreeDotGlowViewController.h"
#import "FeThreeDotGlow.h"

@interface FeThreeDotGlowViewController ()
@property (strong, nonatomic) FeThreeDotGlow *threeDot;
@end

@implementation FeThreeDotGlowViewController

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
    
    _threeDot = [[FeThreeDotGlow alloc] initWithView:self.view blur:NO];
    [self.view addSubview:_threeDot];
    
    // Start
    [_threeDot showWhileExecutingBlock:^{
        [self myTask];
    } completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)myTask
{
    // Do something usefull in here instead of sleeping ...
    sleep(6);
}

@end
