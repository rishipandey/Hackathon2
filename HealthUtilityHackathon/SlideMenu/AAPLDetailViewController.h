/*
Copyright (C) 2014 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:

     Detail view for daily activity, step counting data.
  /Users/hackathon/Desktop/Hack@thon2015/POC_Hackathon/MotionActivityDemoIntegratingMotionActivityintoyourapp/MotionActivityDemo/AAPLDetailViewController.h
/Users/hackathon/Desktop/Hack@thon2015/POC_Hackathon/MotionActivityDemoIntegratingMotionActivityintoyourapp/MotionActivityDemo/AAPLDetailViewController.m
*/

@import UIKit;

#import "SlideNavigationController.h"

@interface AAPLDetailViewController : UITableViewController <SlideNavigationControllerDelegate>

@property (strong, nonatomic) id detailItem;

@end
