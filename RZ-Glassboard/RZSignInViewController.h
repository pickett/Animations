//
//  RZSignInViewController.h
//  RZ-Glassboard
//
//  Created by Ben Johnson on 9/8/13.
//  Copyright (c) 2013 Ben Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RZSignInViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *textFieldView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIImageView *textFieldBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitySpinner;
@property (weak, nonatomic) IBOutlet UIImageView *forgotPasswordButton;


- (IBAction)signInPressed:(id)sender;

@end
