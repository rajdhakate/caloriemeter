//
//  DetailViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 30/01/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIImageView *foodLargeImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailFoodTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodPrepareTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeDetailLabel;
@property (weak, nonatomic) IBOutlet UITextView *foodRecepieLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodCaloriesLabel;

- (IBAction)setFavoriteButton:(UIButton *)sender;


@end
