//
//  SMARTFriendCircleController.m
//  EasyJoke
//
//  Created by SMART on 15/9/21.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTFriendCircleController.h"
#import "SMARTQuicklyLoginController.h"
@interface SMARTFriendCircleController ()

@end

@implementation SMARTFriendCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)login {
    
    SMARTQuicklyLoginController *quicklyLoginVC = [[SMARTQuicklyLoginController alloc] init];
    quicklyLoginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:quicklyLoginVC animated:YES];
    
}



@end
