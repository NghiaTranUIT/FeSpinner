//
//  FeVietNamLoaderViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/30/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeVietNamLoaderViewController.h"
#import "FeVietNamLoader.h"

@interface FeVietNamLoaderViewController ()
@property (strong, nonatomic) FeVietNamLoader *vietNamLoader;
@end

@implementation FeVietNamLoaderViewController

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
    
    _vietNamLoader = [[FeVietNamLoader alloc] initWithView:self.view blur:NO color:nil];
    [self.view addSubview:_vietNamLoader];
    
    // Start
    [_vietNamLoader showWhileExecutingBlock:^{
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
