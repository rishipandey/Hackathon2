//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "AppDelegate.h"

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.calorieBurned = [[[NSUserDefaults standardUserDefaults] objectForKey:@"totalCalBurned"] floatValue];

    ///Burn
    self.slicesBurn = [NSMutableArray arrayWithCapacity:2];
    NSNumber *oneBurn;
    NSNumber *twoBurn;
    
    if (self.calorieBurned == 0.0) {
        oneBurn = [NSNumber numberWithFloat: 0.0];
        twoBurn = [NSNumber numberWithFloat: (3000.0- self.calorieBurned)];
    }
    else {
        oneBurn = [NSNumber numberWithFloat: self.calorieBurned];
        twoBurn = [NSNumber numberWithFloat: (3000.0- self.calorieBurned)];
    }
    
    
    [self.slicesBurn addObject:oneBurn];
    [self.slicesBurn addObject:twoBurn];
    
    [self.calorieIntakeView reloadData];
    [self.fatView reloadData];
    [self.protineView reloadData];
    [self.carboHydrateView reloadData];
    [self.burnCalorieView reloadData];
}

/*
 #define RFERENCE_INTAKE_CAL @"3000"
 #define RFERENCE_INTAKE_PROT @"50"
 #define RFERENCE_INTAKE_FAT @"24"
 #define RFERENCE_INTAKE_CARB @"310"
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:220.0/255.0 green:0.0 blue:0.0 alpha:1]];
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//
    
    self.title = @"DashBoard";
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 503);
	self.portraitSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].portraitSlideOffset];
	self.landscapeSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].landscapeSlideOffset];
	self.panGestureSwitch.on = [SlideNavigationController sharedInstance].enableSwipeGesture;
	self.shadowSwitch.on = [SlideNavigationController sharedInstance].enableShadow;
	self.limitPanGestureSwitch.on = ([SlideNavigationController sharedInstance].panGestureSideOffset == 0) ? NO : YES;
	self.slideOutAnimationSwitch.on = ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    ///Intake
    self.slicesIntake = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *one = [NSNumber numberWithFloat: 3000.0];
    NSNumber *two = [NSNumber numberWithFloat: (3000.0- [appDelegate.totalcalories floatValue])];

    [self.slicesIntake addObject:one];
    [self.slicesIntake addObject:two];
    
    ///Cabrohydrate
    self.slicesCarbo = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *oneCarb = [NSNumber numberWithFloat: 700];
    NSNumber *twoCarb = [NSNumber numberWithFloat: (700- [appDelegate.carbohydrateCount floatValue])];
    
    [self.slicesCarbo addObject:oneCarb];
    [self.slicesCarbo addObject:twoCarb];

    ///protin
    
    self.slicesProt = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *oneProt = [NSNumber numberWithFloat: 200];
    NSNumber *twoProt = [NSNumber numberWithFloat: (200-[appDelegate.proteinCount floatValue])];
    
    [self.slicesProt addObject:oneProt];
    [self.slicesProt addObject:twoProt];
    
    //Fat
    
    self.slicesFat = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *oneFat = [NSNumber numberWithFloat: 150];
    NSNumber *twoFat = [NSNumber numberWithFloat: (150- [appDelegate.fatCount floatValue])];
    
    [self.slicesFat addObject:oneFat];
    [self.slicesFat addObject:twoFat];
    
    ///Burn
    self.calorieBurned = [[[NSUserDefaults standardUserDefaults] objectForKey:@"totalCalBurned"] floatValue];
    self.slicesBurn = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *oneBurn = [NSNumber numberWithFloat: self.calorieBurned == 0.0 ? 0.0 : 3000.0];
    NSNumber *twoBurn = [NSNumber numberWithFloat: (3000.0- self.calorieBurned)];
    
    [self.slicesBurn addObject:oneBurn];
    [self.slicesBurn addObject:twoBurn];
    
    
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
    
    [self.fatView setDataSource:self];
    [self.fatView setStartPieAngle:M_PI_2];
    [self.fatView setAnimationSpeed:1.0];
    [self.fatView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:12]];
    [self.fatView setLabelRadius:20];
    [self.fatView setShowPercentage:YES];
    [self.fatView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.fatView setPieCenter:CGPointMake(43, 43)];
    [self.fatView setUserInteractionEnabled:NO];
    [self.fatView setLabelShadowColor:[UIColor blackColor]];
    
    [self.carboHydrateView setDataSource:self];
    [self.carboHydrateView setStartPieAngle:M_PI_2];
    [self.carboHydrateView setAnimationSpeed:1.0];
    [self.carboHydrateView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:12]];
    [self.carboHydrateView setLabelRadius:20];
    [self.carboHydrateView setShowPercentage:YES];
    [self.carboHydrateView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.carboHydrateView setPieCenter:CGPointMake(43, 43)];
    [self.carboHydrateView setUserInteractionEnabled:NO];
    [self.carboHydrateView setLabelShadowColor:[UIColor blackColor]];
    
    [self.protineView setDataSource:self];
    [self.protineView setStartPieAngle:M_PI_2];
    [self.protineView setAnimationSpeed:1.0];
    [self.protineView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:12]];
    [self.protineView setLabelRadius:20];
    [self.protineView setShowPercentage:YES];
    [self.protineView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.protineView setPieCenter:CGPointMake(43, 43)];
    [self.protineView setUserInteractionEnabled:NO];
    [self.protineView setLabelShadowColor:[UIColor blackColor]];
    
    [self.burnCalorieView setDataSource:self];
    [self.burnCalorieView setStartPieAngle:M_PI_2];
    [self.burnCalorieView setAnimationSpeed:1.0];
    [self.burnCalorieView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.burnCalorieView setLabelRadius:40];
    [self.burnCalorieView setShowPercentage:YES];
    [self.burnCalorieView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.burnCalorieView setPieCenter:CGPointMake(75, 75)];
    [self.burnCalorieView setUserInteractionEnabled:NO];
    [self.burnCalorieView setLabelShadowColor:[UIColor blackColor]];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:255.0f green:0 blue:0 alpha:1],
                       [UIColor colorWithRed:0 green:255.0 blue:0 alpha:1],nil];
    
//    [self.pieChartRight setDelegate:self];
//    [self.pieChartRight setDataSource:self];
//    [self.pieChartRight setPieCenter:CGPointMake(240, 240)];
//    [self.pieChartRight setShowPercentage:NO];
//    [self.pieChartRight setLabelColor:[UIColor blackColor]];
//    
//    [self.percentageLabel.layer setCornerRadius:90];
//    
//    self.sliceColors =[NSArray arrayWithObjects:
//                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
//                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
//                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
//                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
//                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
//    
//    //rotate up arrow
//    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
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

#pragma mark - IBActions -

- (IBAction)bounceMenu:(id)sender
{
	static Menu menu = MenuLeft;
	
	[[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
	
	menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
	((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
	[[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
	[SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}

- (IBAction)portraitSlideOffsetChanged:(UISegmentedControl *)sender
{
	[SlideNavigationController sharedInstance].portraitSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

- (IBAction)landscapeSlideOffsetChanged:(UISegmentedControl *)sender
{
	[SlideNavigationController sharedInstance].landscapeSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
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
    return 2;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    if(pieChart == self.calorieIntakeView)
    {
        return [[self.slicesIntake objectAtIndex:index] intValue];
    }
    else if (pieChart == self.protineView)
    {
        return [[self.slicesProt objectAtIndex:index] intValue];
    }
    else if (pieChart == self.fatView)
    {
        return [[self.slicesFat objectAtIndex:index] intValue];
    }
    else if (pieChart == self.carboHydrateView)
    {
        return [[self.slicesCarbo objectAtIndex:index] intValue];
    }
    else{
        return [[self.slicesBurn objectAtIndex:index] intValue];
    }
    
    
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


@end
