//
//  ListTableViewCell.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 29/01/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodCaloriesLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;


- (IBAction)setFavoriteAction:(UIButton *)sender;


@end
