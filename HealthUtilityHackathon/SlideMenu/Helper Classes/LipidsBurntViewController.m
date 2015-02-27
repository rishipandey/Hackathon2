//
//  FriendsViewController.m
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
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    OVGraphView *graphview=[[OVGraphView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400) ContentSize:CGSizeMake(960, 300)];
    graphview.plotContainer.reverse=YES;
    graphview.plotContainer.graphcolor=[UIColor colorWithRed:0.31 green:0.73 blue:0.78 alpha:1.0];
    [self.view addSubview:graphview];
    [graphview setPoints:@[ [[OVGraphViewPoint alloc]initWithXLabel:@"today" YValue:@7 ],[[OVGraphViewPoint alloc]initWithXLabel:@"yesterday" YValue:@4 ],[[OVGraphViewPoint alloc]initWithXLabel:@"3" YValue:@6 ],[[OVGraphViewPoint alloc]initWithXLabel:@"4" YValue:@2 ],[[OVGraphViewPoint alloc]initWithXLabel:@"5" YValue:@1 ],[[OVGraphViewPoint alloc]initWithXLabel:@"6" YValue:@10 ],[[OVGraphViewPoint alloc]initWithXLabel:@"7" YValue:@7 ],[[OVGraphViewPoint alloc]initWithXLabel:@"8" YValue:@2.4 ],[[OVGraphViewPoint alloc]initWithXLabel:@"9" YValue:@3 ],[[OVGraphViewPoint alloc]initWithXLabel:@"10" YValue:@5.5 ],[[OVGraphViewPoint alloc]initWithXLabel:@"11" YValue:@3 ],[[OVGraphViewPoint alloc]initWithXLabel:@"12" YValue:@7 ],[[OVGraphViewPoint alloc]initWithXLabel:@"13" YValue:@9 ],[[OVGraphViewPoint alloc]initWithXLabel:@"14" YValue:@8 ]]];
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
