//
//  AppDelegate.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSNumber *totalcalories;
@property (nonatomic, strong) NSNumber *proteinCount;
@property (nonatomic, strong) NSNumber *carbohydrateCount;
@property (nonatomic, strong) NSNumber *fatCount;
@end
