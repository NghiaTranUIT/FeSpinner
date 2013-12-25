//
//  FeNeonSavingViewController.m
//  FeSpinner
//
//  Created by Nghia Tran on 12/20/13.
//  Copyright (c) 2013 fe. All rights reserved.
//

#import "FeNeonSavingViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+flat.h"

@interface FeNeonSavingViewController ()

@end

@implementation FeNeonSavingViewController

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
	self.view.backgroundColor = [UIColor colorWithHexCode:@"#17262b"];
    
    //
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor colorWithHexCode:@"#17262b"];
    
    view.layer.borderColor = [UIColor clearColor].CGColor;
    view.layer.borderWidth = 2;
    view.clipsToBounds = NO;
    view.layer.masksToBounds = NO;
    
    //
    view.layer.cornerRadius = 50;
    
    //
    view.layer.shadowColor = [UIColor colorWithHexCode:@"#00d8ff"].CGColor;
    view.layer.shadowOffset  = CGSizeMake(0, 0);
    view.layer.shadowRadius = 10;
    view.layer.shadowOpacity = 1;
    
    [self.view addSubview:view];
    
    
    CAShapeLayer *borderTop = [CAShapeLayer layer];
    borderTop.frame = CGRectMake(0, 0, 100, 100);
    UIBezierPath *pathTop = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:45 startAngle:dgreeToRadius(-10) endAngle:dgreeToRadius(-170) clockwise:NO];
    borderTop.path = pathTop.CGPath;
    borderTop.fillColor = [UIColor clearColor].CGColor;
    borderTop.strokeColor  = [UIColor redColor].CGColor;
    
    CAShapeLayer *borderBottom = [CAShapeLayer layer];
    borderBottom.frame = CGRectMake(0, 0, 100, 100);
    UIBezierPath *pathBottom = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:45 startAngle:dgreeToRadius(10) endAngle:dgreeToRadius(170) clockwise:YES];
    borderBottom.path = pathBottom.CGPath;
    borderBottom.fillColor = [UIColor clearColor].CGColor;
    borderBottom.strokeColor  = [UIColor greenColor].CGColor;
    
    [view.layer addSublayer:borderTop];
    [view.layer addSublayer:borderBottom];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 2 * 5 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path setLineWidth:20];
    [path setLineCapStyle:kCGLineCapRound];
    shape.path = path.CGPath;
    [shape setStrokeColor:[UIColor redColor].CGColor];
    shape.lineWidth = 20;
    shape.lineDashPhase = 1;
    shape.lineDashPattern = @[@20,@5,@10,@20];
    [self.view.layer addSublayer:shape];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
float dgreeToRadius(float degree)
{
    return (degree / 360.0f) *  2 *M_PI;
}
@end
