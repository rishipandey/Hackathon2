//
//  ProfileViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "NutritionViewController.h"

@implementation NutritionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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

-(IBAction)showbreakfast:(id)sender{
    if (self.popoverView) {

        [self.popoverView dismissPopoverAnimated:NO];

    }
    self.popoverView = [[FWTPopoverView alloc] init] ;
    self.popoverView.contentSize = CGSizeMake(140, 100);
    [self.popoverView presentFromRect:self.breakfastButton.frame
                          inView:self.view
         permittedArrowDirection:FWTPopoverArrowDirectionUp
                        animated:YES];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame = label1.frame;
    frame.origin.x = 15.0f;
    frame.origin.y = 20.0f;
    frame.size.height = self.popoverView.frame.size.height/2;
    label1.frame = frame;
    [label1 setText:@"1 Glass Milk\t200 cal"];
    [self.popoverView addSubview:label1];

    UILabel *label2 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame2 = label2.frame;
    frame2.origin.x = 15.0f;
    frame2.origin.y = self.popoverView.frame.size.height/2+20.0f;
    frame2.size.height = self.popoverView.frame.size.height/2;
    label2.frame = frame2;
    [label2 setText:@"2 Multigrain breads  900 cal"];
    [self.popoverView addSubview:label2];

    label1.font = [UIFont systemFontOfSize:10.0f];
    label2.font = [UIFont systemFontOfSize:10.0f];



    
    [label1 sizeToFit];
    [label2 sizeToFit];
}

-(IBAction)showlunch:(id)sender{
    
    if (self.popoverView) {
        
        [self.popoverView dismissPopoverAnimated:NO];
        
    }
    self.popoverView = [[FWTPopoverView alloc] init] ;
    self.popoverView.contentSize = CGSizeMake(140, 100);
    [self.popoverView presentFromRect:self.lunchButton.frame
                               inView:self.view
              permittedArrowDirection:FWTPopoverArrowDirectionUp
                             animated:YES];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame = label1.frame;
    frame.origin.x = 15.0f;
    frame.origin.y = 20.0f;
    frame.size.height = self.popoverView.frame.size.height/2;
    label1.frame = frame;
    [label1 setText:@"1 Glass Milk\t200 cal"];
    [self.popoverView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame2 = label2.frame;
    frame2.origin.x = 15.0f;
    frame2.origin.y = self.popoverView.frame.size.height/2+20.0f;
    frame2.size.height = self.popoverView.frame.size.height/2;
    label2.frame = frame2;
    [label2 setText:@"2 Multigrain breads  900 cal"];
    [self.popoverView addSubview:label2];
    
    label1.font = [UIFont systemFontOfSize:10.0f];
    label2.font = [UIFont systemFontOfSize:10.0f];
    
    
    
    
    [label1 sizeToFit];
    [label2 sizeToFit];

}

-(IBAction)showDinner:(id)sender{
    if (self.popoverView) {
        
        [self.popoverView dismissPopoverAnimated:NO];
        
    }
    self.popoverView = [[FWTPopoverView alloc] init] ;
    self.popoverView.contentSize = CGSizeMake(140, 100);
    [self.popoverView presentFromRect:self.dinnerButton.frame
                               inView:self.view
              permittedArrowDirection:FWTPopoverArrowDirectionUp
                             animated:YES];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame = label1.frame;
    frame.origin.x = 15.0f;
    frame.origin.y = 20.0f;
    frame.size.height = self.popoverView.frame.size.height/2;
    label1.frame = frame;
    [label1 setText:@"1 Glass Milk\t200 cal"];
    [self.popoverView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:self.popoverView.frame];
    CGRect frame2 = label2.frame;
    frame2.origin.x = 15.0f;
    frame2.origin.y = self.popoverView.frame.size.height/2+20.0f;
    frame2.size.height = self.popoverView.frame.size.height/2;
    label2.frame = frame2;
    [label2 setText:@"2 Multigrain breads  900 cal"];
    [self.popoverView addSubview:label2];
    
    label1.font = [UIFont systemFontOfSize:10.0f];
    label2.font = [UIFont systemFontOfSize:10.0f];
    
    
    
    
    [label1 sizeToFit];
    [label2 sizeToFit];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 [self.popoverView dismissPopoverAnimated:YES];
UITouch *touch = [[event allTouches] anyObject];
CGPoint location = [touch locationInView:self.view];
    
    if ( CGRectContainsPoint( self.popoverView.frame, location ) ) {
        // do nothing
    } else {
        // dismiss
        [self.popoverView dismissPopoverAnimated:YES];
    }
    
}

@end
