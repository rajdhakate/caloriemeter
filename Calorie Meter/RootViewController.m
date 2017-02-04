//
//  RootViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    NSArray *pageImageArray;
    NSArray *pageLabelArray;
    NSUserDefaults *hasSeenDemoScreens;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    pageImageArray = @[@"BMI.png", @"calories_food.png", @"healthy_body.png"];
    pageLabelArray = @[@"knows your BMI", @"meters your calories", @"gives healthy suggestions"];

    hasSeenDemoScreens = [NSUserDefaults standardUserDefaults];
    [hasSeenDemoScreens setBool:false forKey:@"hasSeenDemoScreens"];
    [self checkUserSeenDemoScreens];
    [hasSeenDemoScreens synchronize];
}


- (void) checkUserSeenDemoScreens {
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hasSeenDemoScreens"] == false) {
        [self initializeGettingStartedPages];
    }
    else
    {
        UIViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"GetInViewController"];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    [hasSeenDemoScreens setBool:TRUE forKey:@"hasSeenDemoScreens"];
    
}



#pragma mark - Intialize Page View Controller

- (void) initializeGettingStartedPages {
    
    self.pageView = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageView.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    
    [self.pageView setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageView];
    [self.view addSubview:self.pageView.view];
    [self.pageView didMoveToParentViewController:self];
}


#pragma mark - UIPageViewController data sources
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    
    NSUInteger index = ((PageContentViewController *)viewController).pageIndex;
    
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    
    NSUInteger index = ((PageContentViewController *)viewController).pageIndex;
    
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    
    if (index == [pageImageArray count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}




- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if ([pageImageArray count] == 0 || index >= [pageImageArray count]) {
        return nil;
    }
    
    PageContentViewController *pvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pvc.pageLabelString = [pageLabelArray objectAtIndex:index];
    pvc.pageImageString = [pageImageArray objectAtIndex:index];
    pvc.pageIndex = index;
    
    return pvc;
    
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
