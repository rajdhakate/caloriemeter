//
//  AskQuestionViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskQuestionViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *getAnswerTextField;


@property (weak, nonatomic) IBOutlet UILabel *setQuestionsLabel;

@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)previousAction:(id)sender;

- (IBAction)nextAction:(id)sender;


@end
