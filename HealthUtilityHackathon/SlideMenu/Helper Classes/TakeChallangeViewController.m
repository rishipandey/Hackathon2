//
//  TakeChallangeViewController.m
//  SlideMenu
//
//  Created by Rishi Pandey 2 on 2/28/15.
//  Copyright (c) 2015 Aryan Ghassemi. All rights reserved.
//

#import "TakeChallangeViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface TakeChallangeViewController ()

@property (nonatomic, assign) float calBurned;
@property (nonatomic, assign) float target;

@end

@implementation TakeChallangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Take Challenge";
    self.mytextField.delegate = self;
    
    self.mytextField.borderStyle=UITextBorderStyleNone;
    self.mytextField.layer.cornerRadius=8.0f;
    self.mytextField.layer.masksToBounds=YES;
    self.mytextField.layer.borderColor=[[UIColor redColor] CGColor];
    self.mytextField.layer.borderWidth= 1.0f;
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    [self.calorieIntakeView reloadData];
//}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

#pragma mark - Text Field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    self.target = [textField.text floatValue];
    
    if (self.slices) {
        [self.slices removeAllObjects];
    }
    else {
        self.slices = [NSMutableArray array];
    }
    
    NSNumber *oneBurn;
    NSNumber *twoBurn;
    
    self.calBurned = [[[NSUserDefaults standardUserDefaults] objectForKey:@"totalCalBurned"] floatValue];
    
    if (self.calBurned == 0.0) {
        oneBurn = [NSNumber numberWithFloat: 0.0];
        twoBurn = [NSNumber numberWithFloat: (self.target- self.calBurned)];
    }
    else {
        oneBurn = [NSNumber numberWithFloat: (self.target- self.calBurned)];
        twoBurn = [NSNumber numberWithFloat: self.calBurned];
    }
    [self.slices addObject:oneBurn];
    [self.slices addObject:twoBurn];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:255.0 green:0 blue:0.0 alpha:1],
                       [UIColor colorWithRed:0.0 green:255.0 blue:0 alpha:1],nil];
    
    [self.calorieIntakeView setDataSource:self];
    [self.calorieIntakeView setDelegate:self];
    [self.calorieIntakeView setStartPieAngle:M_PI_2];
    [self.calorieIntakeView setAnimationSpeed:1.0];
    [self.calorieIntakeView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.calorieIntakeView setLabelRadius:40];
    [self.calorieIntakeView setShowPercentage:YES];
    [self.calorieIntakeView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.calorieIntakeView setPieCenter:CGPointMake(75, 75)];
    [self.calorieIntakeView setUserInteractionEnabled:NO];
    [self.calorieIntakeView setLabelShadowColor:[UIColor blackColor]];
    
    [self.calorieIntakeView reloadData];

    
    return YES;
}

#pragma mark - Helpers -

- (NSInteger)indexFromPixels:(NSInteger)pixels
{
    if (pixels == 60)
        return 0;
    else if (pixels == 120)
        return 1;
    else
        return 2;
}

- (NSInteger)pixelsFromIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:
            return 60;
            
        case 1:
            return 120;
            
        case 2:
            return 200;
            
        default:
            return 0;
    }
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    //if(pieChart == self.pieChartRight) return nil;
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    //self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}


- (IBAction)showUnderDevelopmentAlert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Will Implement this post hackathon."
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}


@end
