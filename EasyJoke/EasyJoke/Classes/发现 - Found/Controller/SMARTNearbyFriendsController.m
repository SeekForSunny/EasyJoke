//
//  SMARTNearbyFriendsController.m
//  EasyJoke
//
//  Created by SMART on 15/9/27.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTNearbyFriendsController.h"
#import "SMARTQuicklyLoginController.h"
@interface SMARTNearbyFriendsController ()

@end

@implementation SMARTNearbyFriendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SMARTGlobalColor;
}

- (IBAction)quicklyLogin {
    
    SMARTQuicklyLoginController *quicklyLoginVc = [[SMARTQuicklyLoginController alloc] init];
    [self.navigationController pushViewController:quicklyLoginVc animated:YES];
    
}


@end
