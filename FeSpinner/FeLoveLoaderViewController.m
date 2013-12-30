//
//  FeLoveLoaderViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/29/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeLoveLoaderViewController.h"
#import "FeLoveLoader.h"
#import "FeParticleCell.h"

@interface FeLoveLoaderViewController ()
@property (strong, nonatomic) FeLoveLoader *loveLoader;

@end

@implementation FeLoveLoaderViewController

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
    
    _loveLoader = [[FeLoveLoader alloc] initWithView:self.view blur:NO];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender
{
    [_loveLoader show];
}
- (IBAction)stop:(id)sender
{
    [_loveLoader dismiss];
}

@end
