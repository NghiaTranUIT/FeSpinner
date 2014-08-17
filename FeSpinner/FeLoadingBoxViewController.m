//
//  FeLoadingBoxViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/19/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeLoadingBoxViewController.h"
#import "FeLoadingIcon.h"

@interface FeLoadingBoxViewController ()
@property (strong, nonatomic) FeLoadingIcon *loadingIcon;
@end

@implementation FeLoadingBoxViewController

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
    
    _loadingIcon = [[FeLoadingIcon alloc] initWithView:self.navigationController.view blur:NO backgroundColors:nil];
    [self.view addSubview:_loadingIcon];
    
    // Show
    [_loadingIcon showWhileExecutingBlock:^{
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
