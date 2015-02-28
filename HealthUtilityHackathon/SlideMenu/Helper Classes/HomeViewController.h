//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "XYPieChart.h"
@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate,XYPieChartDelegate, XYPieChartDataSource>
@property (weak, nonatomic) IBOutlet XYPieChart *protineView;

@property (weak, nonatomic) IBOutlet XYPieChart *calorieIntakeView;
@property (nonatomic, strong) IBOutlet UISwitch *limitPanGestureSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *slideOutAnimationSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *shadowSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *panGestureSwitch;
@property (nonatomic, strong) IBOutlet UISegmentedControl *portraitSlideOffsetSegment;
@property (nonatomic, strong) IBOutlet UISegmentedControl *landscapeSlideOffsetSegment;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

- (IBAction)bounceMenu:(id)sender;
- (IBAction)slideOutAnimationSwitchChanged:(id)sender;
- (IBAction)limitPanGestureSwitchChanged:(id)sender;
- (IBAction)changeAnimationSelected:(id)sender;
- (IBAction)shadowSwitchSelected:(id)sender;
- (IBAction)enablePanGestureSelected:(id)sender;
- (IBAction)portraitSlideOffsetChanged:(id)sender;
- (IBAction)landscapeSlideOffsetChanged:(id)sender;
@property (weak, nonatomic) IBOutlet XYPieChart *carboHydrateView;
@property (weak, nonatomic) IBOutlet XYPieChart *fatView;
@property (weak, nonatomic) IBOutlet XYPieChart *burnCalorieView;

@property(nonatomic, strong) NSMutableArray *slicesIntake;
@property(nonatomic, strong) NSMutableArray *slicesCarbo;
@property(nonatomic, strong) NSMutableArray *slicesProt;
@property(nonatomic, strong) NSMutableArray *slicesFat;
@property(nonatomic, strong) NSMutableArray *slicesBurn;
@property(nonatomic, strong) NSArray        *sliceColors;

@property (nonatomic, assign) float calorieBurned;

@end
