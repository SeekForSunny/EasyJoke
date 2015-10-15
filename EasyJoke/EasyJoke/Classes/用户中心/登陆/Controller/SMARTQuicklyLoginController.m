//
//  SMARTQuicklyLoginController.m
//  EasyJoke
//
//  Created by SMART on 15/9/26.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTQuicklyLoginController.h"
#import "SMARTProtocolViewController.h"

@interface SMARTQuicklyLoginController ()
@property (weak, nonatomic) IBOutlet UIButton *agree_btn;

@end

@implementation SMARTQuicklyLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *button = [UIBarButtonItem barButtonWithImage:@"return_personal" highImage:@"return_personal" target:self action:@selector(LeftbuttonClicked)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);//调整返回按钮图片位置
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

}

- (void)LeftbuttonClicked{

//    [self.navigationController.view removeFromSuperview];
//    self.view = nil;
    [self.navigationController popViewControllerAnimated:YES];

}
- (IBAction)agree:(UIButton*)button{
    
    SMARTProtocolViewController *protoVc = [[SMARTProtocolViewController alloc] init];
    protoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:protoVc animated:YES];
    [button setImage:[UIImage imageNamed:@"hookicon_login"] forState:UIControlStateNormal];

}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self.agree_btn setImage:[UIImage imageNamed:@"hookicon_login_press"] forState:UIControlStateNormal];
}

@end
