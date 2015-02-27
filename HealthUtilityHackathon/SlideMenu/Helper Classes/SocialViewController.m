//
//  SocialViewController.m
//  SlideMenu
//
//  Created by Rishi Pandey 2 on 2/28/15.
//  Copyright (c) 2015 Aryan Ghassemi. All rights reserved.
//

#import "SocialViewController.h"

#import "TakeChallangeViewController.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Get Motivated";
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:220.0/255.0 green:0.0 blue:0.0 alpha:1]];
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}


#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}


- (IBAction)takeChallangeButtonPressed:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
                                                             bundle: nil];
    TakeChallangeViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"TakeChallangeViewController"];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}


@end
