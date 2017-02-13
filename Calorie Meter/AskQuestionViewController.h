//
//  AskQuestionViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskQuestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *feetTextField;
@property (weak, nonatomic) IBOutlet UITextField *inchesTextField;
@property (weak, nonatomic) NSString *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UIButton *genderButton;
@property (strong, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;

- (IBAction)genderAction:(UIButton *)sender;

@property (nonatomic) float BMR;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)calculateAction:(id)sender;

- (IBAction)okayAction:(id)sender;


@end
