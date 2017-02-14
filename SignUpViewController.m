//
//  LoginViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController


IB_DESIGNABLE

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.signUpButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 8, 0);
    [self setCheckStates];
    
    self.emailTextField.textContentType = UITextContentTypeEmailAddress;
    self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Check Box States
- (void) setCheckStates {
    
    self.signUpButton.enabled = false;
    [self.checkButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateSelected];
    [self.checkButton setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
    
}




#pragma mark - Check Box Action
- (IBAction)checkAction:(id)sender {
    
    if (self.checkButton.enabled) {
        self.checkButton.selected = !self.checkButton.selected;
        self.signUpButton.enabled = !self.signUpButton.enabled;
    }
    
    
    [[FIRAuth auth]createUserWithEmail:self.emailTextField.text password:self.passwordTextField.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if (!error) {
            [self alerts];
            NSLog(@"-----------User Created Successfully");
            self.emailTextField.text = @"";
            self.passwordTextField.text = @"";
        }
        else {
            NSLog(@"Error : %@", error.localizedDescription);
         
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    
}


- (void) alerts {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Successfully Signed Up" message:@"Please log in using email and password." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:lvc animated:YES completion:^{
            nil;
        }];
    }];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}







@end
