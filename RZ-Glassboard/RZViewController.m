//
//  RZViewController.m
//  RZ-Glassboard
//
//  Created by Ben Johnson on 9/7/13.
//  Copyright (c) 2013 Ben Johnson. All rights reserved.
//

#import "RZViewController.h"
#import "RZSignInViewController.h"
#import "CAAnimation+Blocks.h"

#define signInInitialY 600
#define createAccountInitialY 660
#define bounceHeight 15

#define signInButtonY 430
#define createAccountButtonY 498

@implementation RZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    
    // offset our buttons
    self.createAccountButton.frame =
    
    CGRectMake(self.createAccountButton.frame.origin.x,
               createAccountInitialY,
               self.createAccountButton.frame.size.width,
               self.createAccountButton.frame.size.height);
    
    self.signInButton.frame =
    
    CGRectMake(self.signInButton.frame.origin.x,
               signInInitialY,
               self.signInButton.frame.size.width,
               self.signInButton.frame.size.height);
    
    
    // alpha values for elements
    self.logoImageView.alpha = 0.0;
    self.sloganImageView.alpha = 0.0;
    
    
    // bad offset
//    self.createAccountButton.frame =
//    
//    CGRectMake(self.createAccountButton.frame.origin.x,
//               -200 ,
//               self.createAccountButton.frame.size.width,
//               self.createAccountButton.frame.size.height);
//    
//    self.signInButton.frame =
//    
//    CGRectMake(self.signInButton.frame.origin.x,
//               -200,
//               self.signInButton.frame.size.width,
//               self.signInButton.frame.size.height);

}


- (void)viewDidAppear:(BOOL)animated{
    
    [self awesomerAnimation
     ];
    
}

- (void)basicAnimation{
    
    
    self.logoImageView.alpha = 1.0;
    self.sloganImageView.alpha = 1.0;
    
    
    [UIView animateWithDuration:0.4
                          delay:0.2
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
        
       
        self.signInButton.center = CGPointMake(self.signInButton.center.x, signInButtonY);
        
        self.createAccountButton.center = CGPointMake(self.createAccountButton.center.x, createAccountButtonY);

        
    } completion:^(BOOL finished) {
        
        // Reset the view and cycle animation
        [self performSelector:@selector(resetView)
                   withObject:nil afterDelay:1.0];
        
        [self performSelector:@selector(basicAnimation)
                   withObject:nil afterDelay:2.2];
    }];
    

}

- (void)goodAnimation{
    
    // SIGN IN BUTTON
    
    [UIView animateWithDuration:0.4
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        
        self.signInButton.center = CGPointMake(self.signInButton.center.x, signInButtonY);
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    
    // CREATE ACCOUNT BUTTON
    
    [UIView animateWithDuration:0.4 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.createAccountButton.center = CGPointMake(self.createAccountButton.center.x, createAccountButtonY);
        
    } completion:^(BOOL finished) {
        
        
        self.logoImageView.alpha = 1.0;
        self.sloganImageView.alpha = 1.0;
        
        
        [self performSelector:@selector(resetView)
                   withObject:nil afterDelay:1.0];
        
        [self performSelector:@selector(goodAnimation)
                   withObject:nil afterDelay:2.2];
    }];
    
    
    
}

- (void)betterAnimation{
    
    
    // Bounce on Y coordinate
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    // Initial value where the animation will start
    animation.fromValue = [NSNumber numberWithFloat:self.signInButton.center.y];
    
    // max value to boucne to
    animation.toValue = [NSNumber numberWithFloat:signInButtonY];
    
    // specified to ensure that the animation doesn't reset its position once it is done
    animation.fillMode = kCAFillModeBoth;
    animation.duration = 0.5;
    
    // a bezier curve between the to and from values
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    
    self.signInButton.center = CGPointMake(self.signInButton.center.x, signInButtonY);
    
    
    // Awesome completion block, see CAAnimation+Blocks.h
    [animation setCompletion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 animations:^{
            
            self.sloganImageView.alpha = 1.0;
            self.logoImageView.alpha = 1.0;
            
        }];
        
    }];
    
    
    [self.signInButton.layer addAnimation:animation forKey:@"bounce"];
    
  
    
    
    // Same Animation as Above
    CABasicAnimation *animationTwo = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animationTwo.fromValue = [NSNumber numberWithFloat:self.createAccountButton.center.y];
    animationTwo.toValue = [NSNumber numberWithFloat:createAccountButtonY];
    animationTwo.fillMode = kCAFillModeBoth;
    animationTwo.duration = 0.5;
    animationTwo.beginTime = CACurrentMediaTime() + 0.2;
    [animationTwo setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    self.createAccountButton.center = CGPointMake(self.createAccountButton.center.x, createAccountButtonY);
    [self.createAccountButton.layer addAnimation:animationTwo forKey:@"bounce"];


    
    
    
   
    
    
    
   

}

- (void)awesomeAnimation{
    
    
    
    // Bounce on Y coordinate
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    // Initial value where the animation will start
    animation.fromValue = [NSNumber numberWithFloat:self.signInButton.center.y];
    
    // max value to boucne to
    animation.toValue = [NSNumber numberWithFloat:signInButtonY];
    
    // specified to ensure that the animation doesn't reset its position once it is done
    animation.fillMode = kCAFillModeBoth;
    animation.duration = 0.5;
    
    // a bezier curve between the to and from values
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    
    self.signInButton.center = CGPointMake(self.signInButton.center.x, signInButtonY);
    
    [self.signInButton.layer addAnimation:animation forKey:@"bounce"];
    
    
    
    
    // Same Animation as Above
    CABasicAnimation *animationTwo = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animationTwo.fromValue = [NSNumber numberWithFloat:self.createAccountButton.center.y];
    animationTwo.toValue = [NSNumber numberWithFloat:createAccountButtonY];
    animationTwo.fillMode = kCAFillModeBoth;
    animationTwo.duration = 0.5;
    animationTwo.beginTime = CACurrentMediaTime() + 0.1;
    [animationTwo setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    self.createAccountButton.center = CGPointMake(self.createAccountButton.center.x, createAccountButtonY);
    [self.createAccountButton.layer addAnimation:animationTwo forKey:@"bounce"];
    
    

    // Animate the Slogan and Logo
    self.sloganImageView.center = CGPointMake(self.sloganImageView.center.x, self.sloganImageView.center.y + 40);
    self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y + 40);
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.sloganImageView.alpha = 1.0;
        self.logoImageView.alpha = 1.0;
        
        self.sloganImageView.center = CGPointMake(self.sloganImageView.center.x, self.sloganImageView.center.y - 40);
        self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y - 40);
        
    }];
    
    
    
    // reset code
    [self performSelector:@selector(resetView) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(awesomeAnimation) withObject:nil afterDelay:3.2];

    
}

- (void)awesomerAnimation{
    
    
    
    // Bounce on Y coordinate
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    // Initial value where the animation will start
    animation.fromValue = [NSNumber numberWithFloat:self.signInButton.center.y];
    
    // max value to boucne to
    animation.toValue = [NSNumber numberWithFloat:signInButtonY];
    
    // specified to ensure that the animation doesn't reset its position once it is done
    animation.fillMode = kCAFillModeBoth;
    animation.duration = 0.5;
    animation.beginTime = CACurrentMediaTime() + 0.4;

    // a bezier curve between the to and from values
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    
    self.signInButton.center = CGPointMake(self.signInButton.center.x, signInButtonY);
    
    [self.signInButton.layer addAnimation:animation forKey:@"bounce"];
    
    
    
    
    // Same Animation as Above
    CABasicAnimation *animationTwo = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animationTwo.fromValue = [NSNumber numberWithFloat:self.createAccountButton.center.y];
    animationTwo.toValue = [NSNumber numberWithFloat:createAccountButtonY];
    animationTwo.fillMode = kCAFillModeBoth;
    animationTwo.duration = 0.5;
    animationTwo.beginTime = CACurrentMediaTime() + 0.1;
    [animationTwo setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.5 :1.3 :0.6 :1]];
    self.createAccountButton.center = CGPointMake(self.createAccountButton.center.x, createAccountButtonY);
    [self.createAccountButton.layer addAnimation:animationTwo forKey:@"bounce"];
    
    
    
    // Animate the Slogan and Logo
    self.sloganImageView.center = CGPointMake(self.sloganImageView.center.x, self.sloganImageView.center.y + 40);
    self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y + 40);
    
    
   [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionTransitionNone animations:^{
       
       self.sloganImageView.alpha = 1.0;
       self.logoImageView.alpha = 1.0;
       
       self.sloganImageView.center = CGPointMake(self.sloganImageView.center.x, self.sloganImageView.center.y - 40);
       self.logoImageView.center = CGPointMake(self.logoImageView.center.x, self.logoImageView.center.y - 40);

       
   } completion:^(BOOL finished) {
       
       
       
   }];
    

    
    // reset code
    [self performSelector:@selector(resetView) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(awesomerAnimation) withObject:nil afterDelay:3.2];
    
    
}





- (void)resetView{
    
    // offset our buttons
    self.createAccountButton.frame = CGRectMake(self.createAccountButton.frame.origin.x, createAccountInitialY , self.createAccountButton.frame.size.width, self.createAccountButton.frame.size.height);
    self.signInButton.frame = CGRectMake(self.signInButton.frame.origin.x, signInInitialY , self.signInButton.frame.size.width, self.signInButton.frame.size.height);
    
    // alpha values for elements
    self.logoImageView.alpha = 0.0;
    self.sloganImageView.alpha = 0.0;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInPressed:(id)sender {
    
    RZSignInViewController *signInVC = [[RZSignInViewController alloc] init];
    
    [self.navigationController pushViewController:signInVC animated:YES];
    
}

- (IBAction)createAccountPressed:(id)sender {
    
    
}
@end
