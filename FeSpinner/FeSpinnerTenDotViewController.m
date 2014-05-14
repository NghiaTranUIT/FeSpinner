//
//  FeSpinnerTenDotViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/18/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeSpinnerTenDotViewController.h"
#import "FeSpinnerTenDot.h"

@interface FeSpinnerTenDotViewController () <FeSpinnerTenDotDelegate>
{
    NSInteger index;
}
@property (strong, nonatomic) FeSpinnerTenDot *spinner;
@property (strong, nonatomic) NSArray *arrTitile;
@property (strong, nonatomic) NSTimer *timer;

- (IBAction)start:(id)sender;
- (IBAction)dismiss:(id)sender;
-(void) changeTitle;
-(void) longTask;
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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 640)];
    imageView.image = [UIImage imageNamed:@"winter.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    //*********
    index = 0;
    _arrTitile = @[@"LOADING",@"PLZ WAITING",@"CALM DOWN",@"SUCCESSFUL"];
    
    [self.view insertSubview:imageView atIndex:0];
    
    _spinner = [[FeSpinnerTenDot alloc] initWithView:self.view withBlur:YES];
    _spinner.titleLabelText = _arrTitile[index];
    _spinner.fontTitleLabel = [UIFont fontWithName:@"Neou-Thin" size:36];
    _spinner.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender
{
    UIButton *btn = (UIButton *) sender;
    btn.enabled = NO;
    
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTitle) userInfo:nil repeats:YES];
    }
    
    [_spinner showWhileExecutingSelector:@selector(longTask) onTarget:self withObject:nil completion:^{
        [_timer invalidate];
        _timer = nil;
        
        index = 0;
        btn.enabled = YES;
    }];
}
-(void) longTask
{
    // Do a long take
    sleep(5);
}
- (IBAction)dismiss:(id)sender
{
    [_timer invalidate];
    [_spinner dismiss];
    
    // pop
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) changeTitle
{
    NSLog(@"index = %d",index);
    
    if (index >= _arrTitile.count)
        return;
    
    _spinner.titleLabelText = _arrTitile[index];
    index++;
}
-(void) FeSpinnerTenDotDidDismiss:(FeSpinnerTenDot *)sender
{
    NSLog(@"did dismiss");
}
@end
