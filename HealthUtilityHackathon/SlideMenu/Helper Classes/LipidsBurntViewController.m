//
//  LipidsBurntViewController.m
//  SlideMenu
//
//  Created by Aryan Ghassemi on 12/31/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LipidsBurntViewController.h"

#import "OVGraphView.h"
#import "OVGraphViewPoint.h"

@implementation LipidsBurntViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    self.navigationItem.title = @"Lipids Burnt";
    
    self.segmentControl.selectedSegmentIndex = 1;
    
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:220.0/255.0 green:0.0 blue:0.0 alpha:1]];
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    OVGraphView *graphview=[[OVGraphView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400) ContentSize:CGSizeMake(960, 300)];
    graphview.plotContainer.reverse=NO;
    graphview.plotContainer.graphcolor=[UIColor colorWithRed:0.31 green:0.73 blue:0.78 alpha:1.0];
    [self.view addSubview:graphview];
    
    OVGraphViewPoint *firstPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"10 AM" YValue:@5 ];
    OVGraphViewPoint *secondPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"11 AM" YValue:@0 ];
    OVGraphViewPoint *thirdPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"12 PM" YValue:@0 ];
    OVGraphViewPoint *fourthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"1 PM" YValue:@0 ];
    OVGraphViewPoint *fifthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"2 PM" YValue:@0 ];
    OVGraphViewPoint *sixthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"3 PM" YValue:@0 ];
    OVGraphViewPoint *seventhPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"4 PM" YValue:@0 ];
    OVGraphViewPoint *eightPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"5 PM" YValue:@0 ];
    OVGraphViewPoint *ninethPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"6 PM" YValue:@0 ];
    OVGraphViewPoint *tenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"7 PM" YValue:@0 ];
    OVGraphViewPoint *eleventhPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"8 PM" YValue:@0 ];
    OVGraphViewPoint *twelvethPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"9 PM" YValue:@0 ];
    OVGraphViewPoint *thirtennthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"10 PM" YValue:@0 ];
    OVGraphViewPoint *fouthteenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"11 PM" YValue:@0 ];
    
    OVGraphViewPoint *fifteenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"9 AM" YValue:@8 ];
    OVGraphViewPoint *sixteenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"8 AM" YValue:@1 ];
    OVGraphViewPoint *seventeenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"7 AM" YValue:@4 ];
    OVGraphViewPoint *eighteenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"6 AM" YValue:@5 ];
    OVGraphViewPoint *nineteenthPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"5 AM" YValue:@1 ];
    OVGraphViewPoint *twentyPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"4 AM" YValue:@2 ];
    OVGraphViewPoint *twentyonePoint = [[OVGraphViewPoint alloc]initWithXLabel:@"3 AM" YValue:@8 ];
    OVGraphViewPoint *twentytwoPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"2 AM" YValue:@3 ];
    OVGraphViewPoint *twentythrePoint = [[OVGraphViewPoint alloc]initWithXLabel:@"1 AM" YValue:@1 ];
    OVGraphViewPoint *twentyfourPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"00 AM" YValue:@0 ];
    
    //OVGraphViewPoint *boundaryPoint = [[OVGraphViewPoint alloc]initWithXLabel:@"" YValue:nil ];
    
    
    [graphview setPoints:@[ twentyfourPoint,
                            twentythrePoint,
                            twentytwoPoint,
                            twentyonePoint,
                            twentyPoint,
                            nineteenthPoint,
                            eighteenthPoint,
                            seventeenthPoint,
                            sixteenthPoint,
                            fifteenthPoint,
                            firstPoint,
                            secondPoint,
                            thirdPoint,
                            fourthPoint,
                            fifthPoint,
                            sixthPoint,
                            seventhPoint,
                            eightPoint,
                            ninethPoint,
                            tenthPoint,
                            eleventhPoint,
                            twelvethPoint,
                            thirtennthPoint,
                            fouthteenthPoint,
                            ]];
}


- (IBAction)segmentSelectionChanged:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Will Implement this post hackathon."
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
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


@end
