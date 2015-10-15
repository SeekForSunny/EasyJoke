//
//  SMARTCommentModel.h
//  EasyJoke
//
//  Created by SMART on 15/9/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMARTCommentModel : NSObject

@property (nonatomic , copy) NSString *avatar_url;/** */
@property (nonatomic , copy) NSString *bury_count;/** */
@property (nonatomic , copy) NSString *comment_id;/**评论id*/
@property (nonatomic , copy) NSString *create_time;/**评论创建时间*/
@property (nonatomic , copy) NSString *Description;/**描述*/
@property (nonatomic , copy) NSString *digg_count;/** */
@property (nonatomic , copy) NSString *group_id;/**所评论帖子id*/
@property (nonatomic , copy) NSString *ID;/** */
@property (nonatomic , copy) NSString *is_digg;/** */
@property (nonatomic , copy) NSString *platform;/** */
@property (nonatomic , copy) NSString *platform_id;/** */
@property (nonatomic , copy) NSString *status;/** */
@property (nonatomic , copy) NSString *text;/**评论内容*/
@property (nonatomic , copy) NSString *user_bury;/** */
@property (nonatomic , copy) NSString *user_digg;/** */
@property (nonatomic , copy) NSString *user_id;/**评论用户id*/
@property (nonatomic , copy) NSString *user_name;/**评论用户昵称*/
@property (nonatomic , copy) NSString *user_profile_image_url;/**评论用户头像地址*/
@property (nonatomic , copy) NSString *user_profile_url;/** */


@end
