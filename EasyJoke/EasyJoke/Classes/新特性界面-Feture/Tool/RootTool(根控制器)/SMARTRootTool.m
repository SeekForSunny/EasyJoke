//
//  SMARTRootTool.m
//   EasyJoke
//
//  Created by apple on 15/7/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTRootTool.h"
#import "SMARTNewFeatureController.h"

#import "SMARTTabBarController.h"

#import "SMARTSaveTool.h"

#define SMARTVersionKey @"Version"

@implementation SMARTRootTool

+ (UIViewController *)chooseWindowRootVC
{
    // 判断下当前有没有最新的版本
    
    // 最新的版本保存到info.plist文件
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次保存的最新版本号
    NSString *lastVersion = [SMARTSaveTool objectForKey:SMARTVersionKey];
    
    
    
    UIViewController *rootVc;
    
    if ([currentVersion isEqualToString:lastVersion]) { // 相等
        // 没新版本，进入主框架界面
        // 创建tabBarVc
        rootVc  = [[SMARTTabBarController alloc] init];
        
    }else{ // 表示有最新的版本号，进入新特性界面
        
        
        // 如果有，进入新特性界面
        
        rootVc = [[SMARTNewFeatureController alloc] init];
        
        // 保存当前的最新的版本号
        [SMARTSaveTool setObject:currentVersion forKey:SMARTVersionKey];
        
        
        // 新特性界面：就是展示几张图片
    }
    
    return rootVc;
}
@end
