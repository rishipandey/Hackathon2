//
//  ProfileViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "ANPopoverSlider.h"
#import "FWTPopoverView.h"

@interface NutritionViewController : UIViewController <SlideNavigationControllerDelegate>

@property(nonatomic,weak) IBOutlet UIButton *breakfastButton;
@property(nonatomic,weak) IBOutlet UIButton *lunchButton;
@property(nonatomic,weak) IBOutlet UIButton *dinnerButton;
@property(nonatomic, strong) FWTPopoverView *popoverView;

-(IBAction)showbreakfast:(id)sender;
-(IBAction)showlunch:(id)sender;
-(IBAction)showDinner:(id)sender;

@end
