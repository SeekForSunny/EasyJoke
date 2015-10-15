//
//  SMARTProtocolViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/26.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTProtocolViewController.h"

@interface SMARTProtocolViewController ()

@end

@implementation SMARTProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"内涵段子用户使用协议";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"voicereturn"] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(agree) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

- (IBAction)agree {
    
    SMARTFuncLog;
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
