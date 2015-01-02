//
//  FeHandwritingViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 1/2/15.
//  Copyright (c) 2015 fe. All rights reserved.
//

#import "FeHandwritingViewController.h"
#import "FeHandwriting.h"
#import "UIColor+flat.h"

@interface FeHandwritingViewController ()
@property (strong, nonatomic) FeHandwriting *handwritingLoader;

@end

@implementation FeHandwritingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexCode:@"ffe200"];
    
    _handwritingLoader = [[FeHandwriting alloc] initWithView:self.view];
    [self.view addSubview:_handwritingLoader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
