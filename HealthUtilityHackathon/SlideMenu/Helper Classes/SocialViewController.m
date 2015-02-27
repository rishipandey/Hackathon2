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
