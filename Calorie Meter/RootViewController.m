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
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    pageImageArray = @[@"BMI.png", @"calories_food.png", @"healthy_body.png"];
    pageLabelArray = @[@"knows your BMI", @"meters your calories", @"gives healthy suggestions"];
    
    [self initializeGettingStartedPages];
    
    [self.view bringSubviewToFront:self.pageIndicator];
    [self.pageIndicator setNumberOfPages:3];
    
    
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
    
    [self.pageIndicator setCurrentPage:index];
    
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = ((PageContentViewController *)viewController).pageIndex;
    
    [self.pageIndicator setCurrentPage:index];
    
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


#pragma marl - Page Indicators
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    PageContentViewController *pvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    self.pageIndicator.currentPage = pvc.pageIndex;
    
}


/*
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    NSInteger tutorialSteps = 3;
    [self.pageIndicator setNumberOfPages:tutorialSteps];
    
    return tutorialSteps;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}
*/










@end
