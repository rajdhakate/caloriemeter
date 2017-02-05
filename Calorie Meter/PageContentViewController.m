//
//  PageContentViewController.m
//  Calorie Meter
//
//  Created by Raj Dhakate on 04/02/17.
//  Copyright © 2017 Code Blood. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.doneButton.alpha = 0;
    
    self.hasSeenDemoScreens = [NSUserDefaults standardUserDefaults];
    [self.hasSeenDemoScreens setBool:false forKey:@"hasSeenDemoScreens"];
    
    [self.hasSeenDemoScreens synchronize];
    
    [self loadPagesData];
    
}


- (void) loadPagesData {
    
    self.pageImageView.image = [UIImage imageNamed:self.pageImageString];
    self.pageLabel.text = self.pageLabelString;
    
    if (self.pageIndex == 2) {
        self.doneButton.alpha = 1;
    }
    
    
    
}


- (IBAction)doneAction:(id)sender {
    
    UIViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self presentViewController:lvc animated:YES completion:nil];
    
    [self.hasSeenDemoScreens setBool:true forKey:@"hasSeenDemoScreens"];
    
}
@end
