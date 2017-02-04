//
//  DetailViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 30/01/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    Food *foodItem;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    foodItem = [[Food alloc]initializeFoodListWithData];
    [self setdata];
}

#pragma mark - Set Data 

- (void) setdata {
    
    self.foodLargeImageView.image = [UIImage imageNamed:@"food.jpg"];
    self.foodNameLabel.text = foodItem.foodName;
    self.foodRecepieLabel.text = foodItem.foodRecepie;
    self.detailFoodTypeLabel.text = foodItem.foodType;
    self.foodCaloriesLabel.text = foodItem.foodCalories;
    
    self.foodPrepareTimeLabel.text = foodItem.foodPrepareTime;
    self.timeDetailLabel.text = foodItem.foodDetailTime;
    
}



// Enable Roatation Scroll
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    self.scrollView.contentSize = self.contentView.bounds.size;
}



- (IBAction)setFavoriteButton:(UIButton *)sender {
    self.favoriteButton.enabled = !self.favoriteButton.enabled;
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
