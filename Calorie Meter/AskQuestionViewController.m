//
//  AskQuestionViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "AskQuestionViewController.h"

@interface AskQuestionViewController ()
{
    NSUserDefaults *userDataDefaults;
    UIView *blurView;
}

@end

@implementation AskQuestionViewController
{
    NSArray *gender;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gender = @[@"Male", @"Female"];
    
    self.tableView.hidden = YES;
    self.tableView.layer.cornerRadius = 5;
    
}

- (void) getUserdata
{
    
    self.heightTextField = [NSString stringWithFormat:@"%@.%@", self.feetTextField.text, self.inchesTextField.text];
    
    userDataDefaults = [NSUserDefaults standardUserDefaults];
    [userDataDefaults setObject:self.ageTextField.text forKey:@"age"];
    [userDataDefaults setObject:self.heightTextField forKey:@"height"];
    [userDataDefaults setObject:self.weightTextField.text forKey:@"weight"];
    
    float height = [[userDataDefaults objectForKey:@"height"]floatValue];
    float weight = [[userDataDefaults objectForKey:@"weight"]floatValue];
    float age = [[userDataDefaults objectForKey:@"age"]floatValue];
    
    self.BMR = [self calculateCaloriesForAge:age height:height weight:weight];
    
}

- (float) calculateCaloriesForAge:(float)age height:(float)height weight:(float)weight
{
    float BMR = 0;
    
    if ([self.genderButton.currentTitle isEqualToString:@"Female"]) {
        BMR = (4.7 * (12 * height)) + (4.35 * (2.2 * weight)) - (4.7 * age) + 655.1;
        // 655.1 + ( 4.35 × weight in pounds ) + ( 4.7 × height in inches ) - ( 4.7 × age in years )
    }
    else
    {
        BMR = (12.7 * (12 * height)) + (6.2 * (2.2 * weight)) - (6.76 * age) + 66;
        // 66 + ( 6.2 × weight in pounds ) + ( 12.7 × height in inches ) – ( 6.76 × age in years )
    }
    
    
    NSLog(@"BMR: %f", BMR);
    return BMR;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gender count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [gender objectAtIndex:indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.genderButton setTitle:[gender objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [userDataDefaults setObject:self.genderButton.currentTitle forKey:@"gender"];
    
    self.tableView.hidden = true;
}



- (IBAction)genderAction:(UIButton *)sender
{

    if (self.tableView.hidden == YES) {
        self.tableView.hidden = false;
    }
    else
    {
        self.tableView.hidden = true;
    }

}


- (IBAction)calculateAction:(id)sender {
    
    if (self.ageTextField.text.length != 0 && self.weightTextField.text.length != 0 && self.genderButton.currentTitle != nil)
    {
        
        [self getUserdata];
        
        blurView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        blurView.backgroundColor = [UIColor blackColor];
        blurView.alpha = 0.7;
        [self.view addSubview:blurView];
        
        NSString *BMRString = [NSString stringWithFormat:@"%.2f", self.BMR];
        self.bmrLabel.text = BMRString;
        
        [self.view addSubview:self.popUpView];
        self.popUpView.layer.cornerRadius = 5;
        self.popUpView.center = self.view.center;
        
        [userDataDefaults setObject:BMRString forKey:@"BMR"];
        
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Incomplete Details" message:@"Please Enter All Details" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDestructive handler:nil];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }

}

- (IBAction)okayAction:(id)sender {

    [self.popUpView removeFromSuperview];
    [blurView removeFromSuperview];
    [userDataDefaults setBool:YES forKey:@"BMRRecorded"];

}







@end
