/*
Copyright (C) 2014 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:

     Detail view for daily activity, step counting data.
  
*/

@import CoreMotion;

#import "AAPLDetailViewController.h"
#import "AAPLMotionActivityQuery.h"
#import "AAPLActivityDataManager.h"

@interface AAPLDetailViewController ()
- (void)configureView;
@end

@implementation AAPLDetailViewController
{
	AAPLActivityDataManager *_activityDataManager;
	NSDateFormatter *_dateFormatter;
	NSString *_currentActivity;
	NSInteger _currentSteps;
}
#pragma mark - Managing the detail item


#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_dateFormatter = [[NSDateFormatter alloc] init];
		[_dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"HH:mm" options:0
																		locale:[NSLocale currentLocale]]];
		_activityDataManager = [[AAPLActivityDataManager alloc] init];
	}

	return self;
}

- (void)setDetailItem:(id)newDetailItem
{
	if (_detailItem != newDetailItem) {
		_detailItem = newDetailItem;

		// Update the view.
		[self configureView];

		// Load data
		_currentSteps = 0;
		_currentActivity = @"n/a";
		[_activityDataManager stopStepUpdates];
		[_activityDataManager stopMotionUpdates];
		[_activityDataManager queryAsync:(AAPLMotionActivityQuery *)_detailItem withCompletionHandler:^{
			[self.tableView reloadData];
			if ([(AAPLMotionActivityQuery *)_detailItem isToday]) {
				[_activityDataManager startStepUpdates:^(NSNumber *stepCount) {
					_currentSteps = [stepCount integerValue];
					NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:1]];
					[self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
				}];
				[_activityDataManager startMotionUpdates:^(AAPLActivityType type) {
					_currentActivity = [AAPLActivityDataManager activityTypeToString:type];
					NSArray *indexPaths = @[[NSIndexPath indexPathForRow:4 inSection:0]];
					[self.tableView reloadRowsAtIndexPaths:indexPaths
											withRowAnimation:UITableViewRowAnimationNone];
				}];
			}
		}];
	};
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    
    self.navigationItem.title = @"Health Tracker";
    
	self.tableView.sectionHeaderHeight = 60;
	self.tableView.sectionFooterHeight = 60;
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)configureView
{
	// Update the user interface for the detail item.
	if (self.detailItem) {
		self.title = [self.detailItem description];
	}
}

#pragma mark - Table View
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
//	if (section == 1) {
//		return [(AAPLMotionActivityQuery *)_detailItem isToday] ? 5 : 4;
//	} else if (section == 0) {
//		return 1;
//	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.detailTextLabel.textColor = [UIColor greenColor];
	if (indexPath.section == 1) {
		if (indexPath.row == 0) {
            cell.textLabel.hidden = YES;
            cell.detailTextLabel.hidden = YES;
            
//			cell.textLabel.text = @"Calories:";
//            cell.textLabel.frame = CGRectMake(0, 10, 100, 20);
//			cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ --%0.1f kCal",[AAPLDetailViewController formatTimeInterval:_activityDataManager.walkingDuration],(_activityDataManager.walkingDuration/60)*1];

            UILabel *lblDuration = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 70, 20)];
            [cell.contentView addSubview:lblDuration];
            lblDuration.text = [AAPLDetailViewController formatTimeInterval:_activityDataManager.walkingDuration];
            UILabel *lblCalories = [[UILabel alloc] initWithFrame:CGRectMake(220, 35, 70, 20)];
            [cell.contentView addSubview:lblCalories];
            lblCalories.text = [NSString stringWithFormat:@"%0.1f kCal",(_activityDataManager.walkingDuration/60)*1];
            UILabel *lblDurationVal = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 20)];
            [cell.contentView addSubview:lblDurationVal];
            lblDurationVal.text = @"Duration:";
            UILabel *lblCaloriesVal = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 70, 20)];
            [cell.contentView addSubview:lblCaloriesVal];
            lblCaloriesVal.text = @"Calories:";
		} //else if (indexPath.row == 1) {
//			cell.textLabel.text = @"Running";
//			cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ --%0.1f kCal",[AAPLDetailViewController formatTimeInterval:_activityDataManager.runningDuration],(_activityDataManager.walkingDuration/60)*1.8];
//		}
	} else if (indexPath.section == 0) {
        
		cell.textLabel.text = [(AAPLMotionActivityQuery *)_detailItem isToday] ? @"Live Step Counts" : @"Step Counts";
		cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",
									[_activityDataManager.stepCounts longValue] + _currentSteps];
        cell.detailTextLabel.textColor = [UIColor blackColor];
	}
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.hidden = YES;
            cell.detailTextLabel.hidden = YES;
            UILabel *lblDuration = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 70, 20)];
            [cell.contentView addSubview:lblDuration];
            lblDuration.text = [AAPLDetailViewController formatTimeInterval:_activityDataManager.runningDuration];
            UILabel *lblCalories = [[UILabel alloc] initWithFrame:CGRectMake(220, 35, 70, 20)];
            [cell.contentView addSubview:lblCalories];
            lblCalories.text = [NSString stringWithFormat:@"%0.1f  kCal",(_activityDataManager.runningDuration/60)*1];
            UILabel *lblDurationVal = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 20)];
            [cell.contentView addSubview:lblDurationVal];
            lblDurationVal.text = @"Duration:";
            UILabel *lblCaloriesVal = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 70, 20)];
            [cell.contentView addSubview:lblCaloriesVal];
            lblCaloriesVal.text = @"Calories:";
//            cell.textLabel.text = @"Calories:";
//            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ --%0.1f kCal",[AAPLDetailViewController formatTimeInterval:_activityDataManager.runningDuration],(_activityDataManager.walkingDuration/60)*1.8];
        }
    }

	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) {
		case 1:
			return @"Walking";
		case 0:
			return @"Pedometer";
        case 2:
            return @"Running";

	}
	return @"";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 44.0f;
    }
    else{
        return 66;
    }
}

+ (NSString *)formatTimeInterval:(NSTimeInterval)interval
{
	return [NSString stringWithFormat:@"%2uh   %2um",
		(int)(interval / 3600),
		(int)(interval / 60) % 60];
}
@end
