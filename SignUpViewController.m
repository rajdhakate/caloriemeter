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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Check Box Action
- (IBAction)checkAction:(id)sender {
    
    if (self.checkButton.enabled) {
        self.checkButton.selected = !self.checkButton.selected;
        self.signUpButton.enabled = !self.signUpButton.enabled;
    }
    
}
@end
