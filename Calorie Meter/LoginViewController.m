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
    
    [self animateIn];
    
    self.loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 8, 0);
    self.loginButton.enabled = false;
    [self.emailTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingChanged];
        
}


#pragma mark - Animate View 

- (void) animateIn {
 
    self.calorieIconImageView.alpha = 1;
    
    /*
    [UIView animateWithDuration:0.5 animations:^{
        self.calorieIconImageView.image = [UIImage imageNamed:@"calorie_meter_login_icon.png"];
        self.calorieIconImageView.alpha = 1;
    } completion:nil];
    */

    self.calorieIconImageView.image = [UIImage imageNamed:@"calorie_meter_login_icon.png"];

    self.calorieIconImageView.frame = CGRectMake(67, -160, 240, 128);
    // begin animation block
    [UIView beginAnimations:@"animate" context: nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.calorieIconImageView.frame = CGRectMake (67, 95, 240, 128);
    // commit frame changes to be animated
    [UIView commitAnimations];
    
    
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
