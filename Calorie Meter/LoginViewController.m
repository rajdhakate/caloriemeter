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
    //FIRUser *user;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // user = [[FIRAuth auth]currentUser];
    
    
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



#pragma mark - Enter into App

- (void) navigateIntoApp
{
    UINavigationController *navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    
    [self presentViewController:navVC animated:YES completion:^{
        NSLog(@"----------User Already Signed In");
    }];
}



- (void) askQuestions
{
    AskQuestionViewController *navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AskQuestionViewController"];
    
    [self presentViewController:navVC animated:YES completion:^{
        NSLog(@"----------Logged In, ASk Questions");
    }];
}



#pragma mark - Login Action

- (IBAction)loginAction:(id)sender {
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"userAnsweredQuestions"]) {
        [self navigateIntoApp];
    }
    
    else
    {
    
    [[FIRAuth auth] signInWithEmail:self.emailTextField.text password:self.passwordTextField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"----------Successfully logged In");
            [self askQuestions];
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                self.emailTextField.text = @"";
                self.passwordTextField.text = @"";
            }];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
        
    }
}
@end
