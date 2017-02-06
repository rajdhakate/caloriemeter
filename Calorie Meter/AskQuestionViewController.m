//
//  AskQuestionViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "ListTableView.h"

@interface AskQuestionViewController ()
{
    NSArray *questions;
    int questionIndex;
    NSUserDefaults *userData;
}

@end

@implementation AskQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializer];
}


- (void) initializer
{
    
    userData = [NSUserDefaults standardUserDefaults];
    
    questions = @[@"What is your height", @"Don't be shy to tell your weight", @"Last thing is your age"];
    self.previousButton.alpha = 0;
    // self.nextButton.enabled = NO;
    questionIndex = 0;
    self.setQuestionsLabel.text = questions[questionIndex];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.getAnswerTextField.text.length > 0) {
        self.nextButton.enabled = YES;
    }
}


- (void) getAnswers:(int)currentQuestionIndex
{
    [userData setValue:self.getAnswerTextField.text forKey:@""];
}



- (IBAction)previousAction:(id)sender {
    
    if (questionIndex==0) {
        self.getAnswerTextField.text = [userData valueForKey:@"userHeight"];
    }
    
    if (questionIndex==1) {
        self.getAnswerTextField.text = [userData valueForKey:@"userWeight"];
    }
    
    if (questionIndex==2) {
        self.getAnswerTextField.text = [userData valueForKey:@"userAge"];
    }
    
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    
    questionIndex -=1;
    self.setQuestionsLabel.text = questions[questionIndex];
}

- (IBAction)nextAction:(id)sender {
    
    questionIndex += 1;
    self.previousButton.alpha = 1;
    
    if (questionIndex==0) {
        [userData setValue:self.getAnswerTextField.text forKey:@"userHeight"];
    }
    
    if (questionIndex==1) {
        [userData setValue:self.getAnswerTextField.text forKey:@"userWeight"];
    }
    
    if (questionIndex==2) {
        [userData setValue:self.getAnswerTextField.text forKey:@"userAge"];
    }
    
    
    if (questionIndex>2) {
        
        ListTableView *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
        
        [self presentViewController:tvc animated:YES completion:^{
            self.nextButton.alpha = 0;
        }];
    }
    else
    {
        self.setQuestionsLabel.text = questions[questionIndex];
        self.getAnswerTextField.text = @"";
    }
}
@end
