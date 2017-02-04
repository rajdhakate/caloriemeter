//
//  PageContentViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *pageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pageImageView;

@property NSString *pageImageString;
@property NSString *pageLabelString;
@property NSUInteger pageIndex;

@end
