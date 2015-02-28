//
//  RecommendationViewController.h
//  SlideMenu
//
//  Created by Ratul Chhibber on 28/02/15.
//  Copyright (c) 2015 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendationViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *mainScrollView;

@property (nonatomic, strong) IBOutlet UILabel *bottomLabel;

@end
