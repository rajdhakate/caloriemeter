//
//  LoginViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 05/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginTextField.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet LoginTextField *emailTextField;
@property (weak, nonatomic) IBOutlet LoginTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIImageView *calorieIconImageView;

@end
