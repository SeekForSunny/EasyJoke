//
//  SMARTSaveTool.m
//   EasyJoke
//
//  Created by apple on 15/7/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTSaveTool.h"

@implementation SMARTSaveTool : NSObject 

+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
     [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

@end
