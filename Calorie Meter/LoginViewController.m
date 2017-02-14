//
//  LoginViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 05/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
}

@end

@implementation LoginViewController

IB_DESIGNABLE

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calorieIconImageView.alpha = 0;
    
    [self animateInLogo];
    
    [self animateInUI];
    
    self.loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 8, 0);
    self.loginButton.enabled = false;
    [self.emailTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
    
    self.emailTextField.textContentType = UITextContentTypeEmailAddress;
    self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        
}


#pragma mark - Animate View 

- (void) animateInLogo {

    self.calorieIconImageView.frame = CGRectMake(67, -160, 240, 128);
    // begin animation block
    [UIView beginAnimations:@"animate" context: nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.calorieIconImageView.alpha = 1;
    self.calorieIconImageView.frame = CGRectMake (67, 95, 240, 128);
    // commit frame changes to be animated
    [UIView commitAnimations];
    
    
}



- (void) animateInUI {
    
    self.emailTextField.alpha = 0;
    self.passwordTextField.alpha = 0;
    self.loginButton.alpha = 0;
    self.emailLabel.alpha = 0;
    self.passwordLabel.alpha = 0;
    self.dividerView.alpha = 0;
    self.gotoSignUpButton.alpha = 0;
    self.facebookButtonView.alpha = 0;
    self.googleButtonView.alpha = 0;
    
     [UIView animateWithDuration:2 animations:^{
     
         self.emailTextField.alpha = 1;
         self.passwordTextField.alpha = 1;
         self.loginButton.alpha = 1;
         self.emailLabel.alpha = 1;
         self.passwordLabel.alpha = 1;
         self.dividerView.alpha = 1;
         self.gotoSignUpButton.alpha = 1;
         self.facebookButtonView.alpha = 1;
         self.googleButtonView.alpha = 1;
         
     } completion:nil];
    
}


#pragma mark - Enable Login Button
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.emailTextField.text.length>0) {
        self.loginButton.enabled = true;
    }
}


#pragma mark - is a fresh user

- (Boolean) isAFreshUser {
    
    return true;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
