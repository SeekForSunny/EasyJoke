//
//  SMARTFindViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/19.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTFindViewController.h"

#import "SMARTHotBarController.h"
#import "SMARTNearbyFriendsController.h"
#import "SMARTLoginViewController.h"
@interface SMARTFindViewController ()

@end

@implementation SMARTFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpChildVc];
    [self setUpNarBar];

    UIBarButtonItem *item =  [UIBarButtonItem itemWithImage:@"defaulthead" highImage:@"defaulthead" target:self action:@selector(iconCliked)];
    self.navigationItem.leftBarButtonItem = item;
    
}


- (void)setUpNarBar{

    NSArray *items = @[@"精品热吧",@"附近段友"];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:items];
    
    [segment addTarget:self action:@selector(segmentClicked:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segment;
    segment.layer.cornerRadius = segment.height*.5;
    segment.clipsToBounds = YES;
    segment.layer.borderWidth = 2;
    segment.layer.borderColor = [UIColor brownColor].CGColor;
    [segment setTintColor:[UIColor brownColor]];
    segment.selectedSegmentIndex = 0;
    [self segmentClicked:segment];

}

- (void)setUpChildVc{
    
    SMARTHotBarController *hotVc = [[SMARTHotBarController alloc] init];
    [self addChildViewController:hotVc];
    
    SMARTNearbyFriendsController *nearVc = [[SMARTNearbyFriendsController alloc] init];
    [self addChildViewController:nearVc];

}

- (void)segmentClicked:(UISegmentedControl*)segment{

    int index = (int)segment.selectedSegmentIndex;
    if (index == 0) {
        UIView *hotView = [self.childViewControllers[index] view];
        hotView.frame = self.view.bounds;
        [self.view addSubview:hotView];
    }else{
        UIView *nearView = [self.childViewControllers[index] view];
        nearView.frame = self.view.bounds;
        [self.view addSubview:nearView];
    
    }
}


- (void)iconCliked{
    
    SMARTLoginViewController *loginVc = [[SMARTLoginViewController alloc] init];
    loginVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVc animated:YES];
    
}


@end
