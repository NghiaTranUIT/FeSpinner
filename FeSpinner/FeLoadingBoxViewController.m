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
    
    _loadingIcon = [[FeLoadingIcon alloc] initWithView:self.view blur:NO backgroundColors:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender
{
    [_loadingIcon show];
}
- (IBAction)stop:(id)sender {
}

@end
