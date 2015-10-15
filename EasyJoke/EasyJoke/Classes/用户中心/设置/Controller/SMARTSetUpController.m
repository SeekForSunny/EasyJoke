//
//  SMARTSetUpController..m
//  EasyJoke
//
//  Created by SMART on 15/9/20.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTSetUpController.h"

@interface SMARTSetUpController()

@end

@implementation SMARTSetUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}


- (void)setUpNavBar{

    UIButton *leftbutton = [UIBarButtonItem barButtonWithImage:@"return_personal" highImage:@"return_personal_night" target:self action:@selector(turnBack)];
    leftbutton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
}


- (void)turnBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
