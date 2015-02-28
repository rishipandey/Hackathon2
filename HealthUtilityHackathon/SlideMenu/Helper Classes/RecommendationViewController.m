//
//  RecommendationViewController.m
//  SlideMenu
//
//  Created by Ratul Chhibber on 28/02/15.
//  Copyright (c) 2015 Aryan Ghassemi. All rights reserved.
//

#import "RecommendationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RecommendationViewController ()

@property (nonatomic, assign) int imageCount;
@property (nonatomic, assign) int totalImageCount;
@property (nonatomic, retain) NSTimer *timer;

@end

@implementation RecommendationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageCount = 1;
    self.totalImageCount = 4;
    
    [self initializeMainScrollView];
    [self startTimer];
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
}


- (void)initializeMainScrollView {
    self.mainScrollView.pagingEnabled = YES;
    
    NSUInteger numberOfImages = 0;
    NSInteger totalImages=0;
    CGFloat scrollContentWidth = 0;
    
    for (; ; numberOfImages++) {
        NSString *imageName = [NSString stringWithFormat:@"recommendation%d.png", (numberOfImages + 1)];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect imageFrame = imageView.frame;
        imageFrame.size.height = self.mainScrollView.frame.size.height;
        imageFrame.size.width = self.mainScrollView.frame.size.width;
        imageFrame.origin.x = scrollContentWidth;
        imageFrame.origin.y = 0;
        
        if (totalImages > self.totalImageCount) {
            break;
        }
        
        imageView.frame = imageFrame;
        [self.mainScrollView addSubview:imageView];
        [self.mainScrollView sendSubviewToBack:imageView];
        
        scrollContentWidth += imageView.frame.size.width;
        totalImages++;
    }
    
    [self.mainScrollView setContentSize:CGSizeMake(scrollContentWidth, self.mainScrollView.bounds.size.height)];
    self.mainScrollView.delegate = self;
    [self.view sendSubviewToBack:self.mainScrollView];
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.imageCount = scrollView.contentOffset.x / self.mainScrollView.bounds.size.width + 1;
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)startTimerAndChangeImage {
    self.imageCount ++;
    if (self.imageCount > self.totalImageCount) {
        self.imageCount = 1;
    }
    
    CGFloat scrollContentWidth = (self.imageCount - 1) * self.mainScrollView.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(scrollContentWidth, 0);
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.mainScrollView.layer addAnimation:transition forKey:nil];
    
}

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0f
                                                  target:self
                                                selector:@selector(startTimerAndChangeImage)
                                                userInfo:nil
                                                 repeats:YES];
}


@end
