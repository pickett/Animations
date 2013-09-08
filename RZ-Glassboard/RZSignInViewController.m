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
    
}

- (IBAction)signInPressed:(id)sender {
    
    [self awesomeCheck];
    
}


- (void)basicCheck{
    
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
    self.activitySpinner.hidden = NO;
    self.activitySpinner.hidesWhenStopped = YES;
    self.signInButton.hidden = YES;
    [self.activitySpinner startAnimating];
    
    // simulate checking a web service
    [self performSelector:@selector(basicFail) withObject:nil afterDelay:1.5];
    
}

- (void)basicFail{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to Sign In" message:@"Did you enter your email and password correctly?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    
    [self.activitySpinner stopAnimating];
    [self.signInButton setHidden:NO];

}

- (void)awesomeCheck{
    
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
    // Set up our Activity Spinner - magic numbers trust me
    self.activitySpinner.frame = CGRectMake(263, 182, 20, 20);
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
    
    // Cubic timing function
    pathAnimation.calculationMode = kCAAnimationCubic;
    
    // Fill mode will not remove on completition
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    
    
    pathAnimation.duration = 0.4;
    
    // Linear timing function so that multiple shakes or a reverse won't display oddly
    [pathAnimation setTimingFunction: [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    // start point is current position
    CGPoint startPoint = self.textFieldView.center;
    
    // 15 points to the left of current
    CGPoint leftPoint = CGPointMake(self.textFieldView.center.x - 15, self.textFieldView.center.y);
    
    // 15 points to the right of current
    CGPoint rightPoint = CGPointMake(self.textFieldView.center.x + 15, self.textFieldView.center.y);
    
    // back to start
    CGPoint endPoint = startPoint;
    
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    
    //specify starting point of this path
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
    
    //cp1x = The x-coordinate of the first control point.
    //cp1y = The y-coordinate of the first control point.
    //cp2x = The x-coordinate of the second control point.
    //cp2y = The y-coordinate of the second control point.
    //x = The x-coordinate of the end point of the curve.
    //y = The y-coordinate of the end point of the curve.
    
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);
    CGPathAddCurveToPoint(curvedPath, NULL, cp1x, cp1y, cp2x, cp2y, p3.x, p3.y);


    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    
    [pathAnimation setCompletion:^(BOOL finished) {
        
        //  clear the password text
        self.passwordTextField.text = @"";
        
        // specify a new light red color
        UIColor *color = [UIColor colorWithRed:247.0/255.0 green:122.0/255.0 blue:127.0/255.0 alpha:1.0];
        
        self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Incorrect Password" attributes:@{NSForegroundColorAttributeName: color}];
        
        // become first responder
        [self.passwordTextField becomeFirstResponder];
    
    
        [self performSelector:@selector(bounceForgotPassword) withObject:Nil afterDelay:2.0];

        
    }];
    
    [self.textFieldView.layer addAnimation:pathAnimation forKey:@"shake"];
    
    
    // change our text fields
 
    
   
}

- (void)bounceForgotPassword{
    
    
  
    // Create a basic animation changing the transform.scale value
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // Set the initial and the final values
    [scale setFromValue:[NSNumber numberWithFloat:1.0f]];
    [scale setToValue:[NSNumber numberWithFloat:1.1f]];
    
    // Set duration
    [scale setDuration:0.2f];
    
    // Set animation to be consistent on completion
    [scale setRemovedOnCompletion:NO];
    [scale setFillMode:kCAFillModeForwards];
    
    // Set the timing function
    [scale setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    scale.autoreverses = YES;
    // Add animation to the view's layer
    [self.forgotPasswordButton.layer addAnimation:scale forKey:@"scale"];
    
    
    // note: this only works with auto-layout turned off

    
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
