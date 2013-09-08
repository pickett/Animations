//
//  RZSignInViewController.m
//  RZ-Glassboard
//
//  Created by Ben Johnson on 9/8/13.
//  Copyright (c) 2013 Ben Johnson. All rights reserved.
//

#import "RZSignInViewController.h"
#import "CAAnimation+Blocks.h"

@implementation RZSignInViewController

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
    
    [self.emailTextField setDelegate:self];
    [self.passwordTextField setDelegate:self];
    self.activitySpinner.hidden = YES;
    
    UIColor *color = [UIColor lightGrayColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)signInPressed:(id)sender {
    
    [self awesomeCheck];
    
}


- (void)basicCheck{
    
    self.activitySpinner.hidden = NO;
    self.activitySpinner.hidesWhenStopped = YES;
    self.signInButton.hidden = YES;
    [self.activitySpinner startAnimating];
    
    // simulate checkign a web service
    [self performSelector:@selector(basicFail) withObject:nil afterDelay:1.5];
    
    
}

- (void)awesomeCheck{
    
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
    // Set up our Activity Spinner
    self.activitySpinner.frame = CGRectMake(263, 182, 20, 20); // magic numbers trust me
    [self.activitySpinner bringSubviewToFront:self.view];
    self.activitySpinner.hidden = NO;
    self.activitySpinner.hidesWhenStopped = YES;
    
    [self.activitySpinner startAnimating];
    
    [self performSelector:@selector(awesomeFail) withObject:nil afterDelay:1.5];
    
}

- (void)awesomeFail{
    
    [self.activitySpinner stopAnimating];

    
    //Set up the shake animation with a pathAnimation
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationCubicPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 0.4;
    
    [pathAnimation setTimingFunction: [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    CGPoint startPoint = self.textFieldView.center;
    CGPoint leftPoint = CGPointMake(self.textFieldView.center.x - 15, self.textFieldView.center.y);
    CGPoint rightPoint = CGPointMake(self.textFieldView.center.x + 15, self.textFieldView.center.y);
    CGPoint endPoint = startPoint;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, self.textFieldView.center.x, self.textFieldView.center.y);
    
    CGPoint p0 = startPoint;
    CGPoint p1 = leftPoint;
    CGPoint p2 = rightPoint;
    CGPoint p3 = endPoint;
    CGFloat v = 1.0;
    CGFloat cp1x = p1.x+v*(p1.x-p0.x);
    CGFloat cp1y = p1.y+v*(p1.y-p0.y);
    CGFloat cp2x = p2.x-v*(p3.x-p2.x);
    CGFloat cp2y = p2.y-v*(p3.y-p2.y);
    
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    [self.textFieldView.layer addAnimation:pathAnimation forKey:@"shake"];

    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.passwordTextField.textColor = [UIColor darkGrayColor];
    self.passwordTextField.textAlignment = NSTextAlignmentLeft;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
