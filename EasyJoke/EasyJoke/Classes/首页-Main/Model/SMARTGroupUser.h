//
//  SMARTGroupUser.h
//  EasyJoke
//
//  Created by SMART on 15/9/23.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMARTGroupUser : NSObject

@property (nonatomic , copy) NSString *avatar_url;
@property (nonatomic , assign) BOOL is_following;
@property (nonatomic , copy) NSString *name;
@property (nonatomic , copy) NSString *user_id;

@end
