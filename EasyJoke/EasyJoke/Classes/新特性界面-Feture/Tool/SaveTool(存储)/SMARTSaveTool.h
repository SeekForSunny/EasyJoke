//
//  SMARTSaveTool.h
//   EasyJoke
//
//  Created by apple on 15/7/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//   专门用来存储

#import <Foundation/Foundation.h>

@interface SMARTSaveTool : NSObject

// 读取数据
+ (id)objectForKey:(NSString *)defaultName;

// 存储数据
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
