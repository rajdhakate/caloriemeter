//
//  LoginViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

- (IBAction)checkAction:(id)sender;

@end
