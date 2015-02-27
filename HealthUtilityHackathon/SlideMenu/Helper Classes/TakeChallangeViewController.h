//
//  TakeChallangeViewController.h
//  SlideMenu
//
//  Created by Rishi Pandey 2 on 2/28/15.
//  Copyright (c) 2015 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SlideNavigationController.h"
#import "XYPieChart.h"

@interface TakeChallangeViewController : UIViewController <SlideNavigationControllerDelegate, UITextFieldDelegate, XYPieChartDelegate, XYPieChartDataSource>


@property (nonatomic, strong) IBOutlet UITextField *mytextField;
@property (weak, nonatomic) IBOutlet XYPieChart *calorieIntakeView;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray *sliceColors;

@end
