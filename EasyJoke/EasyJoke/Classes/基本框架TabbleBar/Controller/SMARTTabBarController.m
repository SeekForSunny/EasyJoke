//
//  SMARTTabBarController.m
//  EasyJoke
//
//  Created by SMART on 15/9/19.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTTabBarController.h"
#import "SMARTNavagationViewController.h"
#import "SMARTMainViewController.h"
#import "SMARTFindViewController.h"
#import "SMARTCheckViewController.h"
#import "SMARTMassageViewController.h"
#import "SMARTLoginViewController.h"


@interface SMARTTabBarController ()

@end

@implementation SMARTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildVc];
    [self setTabBarItem];
}



- (void)setUpChildVc{
    
    SMARTMainViewController *mainVc = [[SMARTMainViewController alloc] init];
    [self setController:mainVc Title:@"首页" normalImage:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_press"]];
    
    SMARTFindViewController *findVc = [[SMARTFindViewController alloc] init];
    [self setController:findVc Title:@"发现" normalImage:[UIImage imageNamed:@"Found"] selectedImage:[UIImage imageNamed:@"Found_press"]];
    
    SMARTCheckViewController *checkVc = [[SMARTCheckViewController alloc] init];
    [self setController:checkVc Title:@"审核" normalImage:[UIImage imageNamed:@"audit"]selectedImage:[UIImage imageNamed:@"audit_press"]];
    
    SMARTMassageViewController *massageVc = [[SMARTMassageViewController alloc] init];
    [self setController:massageVc Title:@"消息" normalImage:[UIImage imageNamed:@"newstab"]selectedImage:[UIImage imageNamed:@"newstab_press"]];


}


- (void)setController:(UIViewController*)controller Title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
   
//    !self.NavBlock ? :self.NavBlock(controller);
  
    [self addChildViewController:nav];
    
    controller.tabBarItem.image = normalImage;
    controller.tabBarItem.title = title;
    controller.tabBarItem.selectedImage = selectedImage;
    


}


- (void)setTabBarItem{
    
    NSMutableDictionary *normalAttrs =[NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [self.tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    
    NSMutableDictionary *SelectedAttrs =[NSMutableDictionary dictionary];
    SelectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    SelectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
     [item setTitleTextAttributes:SelectedAttrs forState:UIControlStateSelected];

}



@end
