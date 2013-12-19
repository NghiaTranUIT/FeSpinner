//
//  FeSpinnerTenDotViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeSpinnerTenDotViewController.h"
#import "FeSpinnerTenDot.h"

@interface FeSpinnerTenDotViewController ()
{
    NSInteger index;
}
@property (strong, nonatomic) FeSpinnerTenDot *spinner;
@property (strong, nonatomic) NSArray *arrTitile;
@property (strong, nonatomic) NSTimer *timer;

- (IBAction)start:(id)sender;
- (IBAction)blur:(id)sender;
- (IBAction)dismiss:(id)sender;
-(void) changeTitle;
@end

@implementation FeSpinnerTenDotViewController

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
    
    //*********
    index = 0;
    _arrTitile = @[@"LOADING",@"PLZ WAITING",@"CALM DOWN",@"SUCCESSFUL"];
    
    UIView *container = [self.view viewWithTag:100];
    
    _spinner = [[FeSpinnerTenDot alloc] initWithView:container withBlur:NO];
    _spinner.titleLabelText = _arrTitile[index];
    _spinner.fontTitleLabel = [UIFont fontWithName:@"Neou-Thin" size:36];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender
{
    [_timer invalidate];
    index = 0;
    
    [_spinner show];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(changeTitle) userInfo:nil repeats:YES];
}
-(void) changeTitle
{
    if (index < _arrTitile.count)
    {
        _spinner.titleLabelText = _arrTitile[index];
        index++;
        
    }
    else
    {
        [_timer invalidate];
        index = 0;
        [self dismiss:self];
    }
}
- (IBAction)blur:(id)sender
{
    
}

- (IBAction)dismiss:(id)sender
{
    [_timer invalidate];
    [_spinner dismiss];
}
@end
