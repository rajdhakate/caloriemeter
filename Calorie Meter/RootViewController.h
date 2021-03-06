//
//  RootViewController.h
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property UIPageViewController *pageView;

- (PageContentViewController*)viewControllerAtIndex:(NSUInteger)index;
@property (weak, nonatomic) IBOutlet UIPageControl *pageIndicator;

@end
