//
//  RZViewController.h
//  RZ-Glassboard
//
//  Created by Ben Johnson on 9/7/13.
//  Copyright (c) 2013 Ben Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RZViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sloganImageView;

- (IBAction)signInPressed:(id)sender;
- (IBAction)createAccountPressed:(id)sender;
@end
