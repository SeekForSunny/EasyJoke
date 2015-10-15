//
//  SMARTLoginViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/20.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTLoginViewController.h"
#import "SMARTSetUpController.h"
#import "SMARTQuicklyLoginController.h"

@interface SMARTLoginViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic , assign) CGFloat lastOffsetY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headViewHCons;


@property (nonatomic , weak) UIButton *selectedButton;
@property (nonatomic , weak)  UIView *contentView;
@property (nonatomic , weak)  UIView *indicator;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (nonatomic , weak)   UIButton *settingbutton;

@end

@implementation SMARTLoginViewController


#pragma mark - 初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPNavBar];
    [self setUpScrollView];

}


#pragma mark 当假面出现时设置导航栏背景图片属性以及点击标题按钮加载ContentView事件
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:0]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    
    UIButton *button=  self.middleView.subviews[0];
    [self titleButtonClicked:button];
    
}

#pragma mark 界面将要消失时处理导航栏颜色事件
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:212/255.0 green:210/255.0 blue:196/255.0 alpha:1]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

#pragma mark 设置导航栏
- (void)setUPNavBar{

    UIButton *turnBackbutton =  [UIBarButtonItem barButtonWithImage:@"return_personal" highImage:@"return_personal" target:self action:@selector(turnback) ];
   turnBackbutton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);//调整返回按钮图片位置
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:turnBackbutton];

    UIButton *settingbutton  = [UIBarButtonItem barButtonWithImage:@"Setup" highImage:@"Setup" target:self action:@selector(setUpClicked) ];
    settingbutton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);//调整设置按钮图片位置
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingbutton];
    self.settingbutton = settingbutton;
}

#pragma mark 设置ScrollView
- (void)setUpScrollView{

    self.scrollView.contentInset = UIEdgeInsetsMake(SMARTLoginHeaderViewH + SMARTLoginMiddleBarViewH, 0, 49, 0);
    self.scrollView.backgroundColor = [UIColor purpleColor];
    self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    _lastOffsetY = - SMARTLoginHeaderViewH - SMARTLoginMiddleBarViewH;
    self.scrollView.contentSize = CGSizeMake(0, 350);//self.view.height - SMARTLoginHeaderViewH -SMARTLoginMiddleBarViewH + SMARTTabBarH


}


#pragma mark -  事件处理
#pragma mark  处理标题按钮点击事件
- (IBAction)titleButtonClicked:(UIButton*)button{

    _selectedButton.selected = NO;
    
    if (_selectedButton.selected == NO) {
        
        [self.contentView removeFromSuperview];
        [self.indicator removeFromSuperview];
        
        self.contentView = nil;
        self.indicator = nil;
    
    }
    button.selected = YES;
    _selectedButton = button;

    if (_selectedButton.selected) {
        
#pragma mark - 设置ScrollContentView内容部分View
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor greenColor];
        self.contentView = contentView;
        [self.scrollView addSubview:contentView];

        contentView.frame = CGRectMake(0, 0, SMARTScreenW, 350);//self.view.height -SMARTLoginHeaderViewH + SMARTLoginMiddleBarViewH - 20
        UIImageView *imageView = [[UIImageView alloc] init];
        [contentView addSubview:imageView];
        imageView.frame = contentView.frame;
        imageView.image = [UIImage imageNamed:@"NoLogin"];
        
#pragma mark - 设置指示器
       UIView *indicator = [[UIView alloc] initWithFrame:CGRectMake(20, button.height - 2, button.width - 2*10, 2)];
        [button addSubview:indicator];
        self.indicator = indicator;
        indicator.backgroundColor = [UIColor redColor];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
     
    }
    
    

}

#pragma mark 处理返回事件
- (void)turnback {

    

    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark 处理设置按钮点击事件
- (void)setUpClicked {
   
    SMARTSetUpController *setUpVc = [[SMARTSetUpController alloc] init];
    
    setUpVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setUpVc animated:YES];
}



#pragma mark 处理点击登陆按钮点击事件
- (IBAction)login {
    
    SMARTQuicklyLoginController *loginVc = [[SMARTQuicklyLoginController alloc] init];
    [self.navigationController pushViewController:loginVc animated:YES];

    
}


#pragma mark -  ScrollView代理方法

#pragma mark 处理ScrollView滚动设置headerView 的高度事件
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat delta = offsetY - _lastOffsetY;
    
    CGFloat headH  = SMARTLoginHeaderViewH - delta;
    
    if (headH < 200) {
        headH = 200;
    }
    

    self.headViewHCons.constant = headH;
    
}

@end
