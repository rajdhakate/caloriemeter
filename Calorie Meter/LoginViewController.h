//
//  LoginViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 05/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginTextField.h"
#import "RootViewController.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import "ListTableView.h"
#import "AskQuestionViewController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet LoginTextField *emailTextField;
@property (weak, nonatomic) IBOutlet LoginTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIImageView *calorieIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIView *googleButtonView;
@property (weak, nonatomic) IBOutlet UIView *facebookButtonView;
@property (weak, nonatomic) IBOutlet UIButton *gotoSignUpButton;
@property (weak, nonatomic) IBOutlet UIView *dividerView;

- (IBAction)loginAction:(id)sender;

@end
