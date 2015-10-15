//
//  SMARTGroupModel.h
//  EasyJoke
//
//  Created by SMART on 15/9/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMARTGroupUser.h"

#import "SMARTLargeImage.h"
#import "SMARTMiddleImage.h"

@interface SMARTGroupModel : NSObject

@property (nonatomic , assign) NSInteger max_screen_width_percent;/**最大宽度百分比*/
@property (nonatomic , assign) NSInteger min_screen_width_percent;/**最小宽度百分比*/

@property (nonatomic , strong) SMARTLargeImage *large_image;/**大图模型*/
@property (nonatomic , strong) SMARTMiddleImage *middle_image;/**中图*/
@property (nonatomic , strong) SMARTLargeImage *largeImage_list;

@property (nonatomic , assign) BOOL is_gif;
@property (nonatomic , assign) BOOL is_video;


@property (nonatomic , copy) NSString *open_url;/**open_url*/
@property (nonatomic , copy) NSString *title;/**title内容*/

@property (nonatomic , copy) NSNumber *image_status;/**image_status*/

@property (nonatomic , assign) BOOL allow_dislike;
@property (nonatomic , copy) NSString *bury_count;
@property (nonatomic , copy) NSNumber *category_id;/**分类ID*/
@property (nonatomic , copy) NSString *category_name;/**分类名*/
@property (nonatomic , copy) NSNumber *category_type;/**分类类型*/
@property (nonatomic , copy) NSNumber *category_visible;/**分类Visible*/
@property (nonatomic , copy) NSNumber *comment_count;/**评论数*/
@property (nonatomic , copy) NSString *content;/**帖子文本内容*/
@property (nonatomic , copy) NSString *create_time;/**帖子创建时间*/
@property (nonatomic , copy) NSString *digg_count;/**顶贴数*/
@property (nonatomic , strong) NSArray *dislike_reason;/**不喜欢原因*/
@property (nonatomic , copy) NSString *favorite_count;/**热度*/
@property (nonatomic , copy) NSString *go_detail_count;/** */
@property (nonatomic , copy) NSString *group_id;/**GroupID */
@property (nonatomic , copy) NSString *has_comments;/**评论数 */
@property (nonatomic , assign) NSInteger has_hot_comments;/**热门评论数 */
@property (nonatomic , copy) NSString *ID;/**ID */


//视频模块
@property (nonatomic , strong) NSDictionary *large_cover;//大图
@property (nonatomic , strong) NSDictionary *medium_cover;//中图
@property (nonatomic , copy) NSString *mp4_url;//视频播放地址
@property (nonatomic , assign) NSInteger video_height;//图片高度
@property (nonatomic , assign) NSInteger video_width;//图片宽度
@property (nonatomic , copy) NSNumber *media_type; /**media_type*/

@property (nonatomic , copy) NSString *repin_count;/**转发数*/
@property (nonatomic , copy) NSString *share_count;/**分享数*/
@property (nonatomic , copy) NSNumber *share_type;/**分享类型*/
@property (nonatomic , copy) NSString *share_url;/**分享连接*/
@property (nonatomic , copy) NSString *status;/**status*/
@property (nonatomic , copy) NSString *status_desc;/**status描述 例如:热门投稿等*/
@property (nonatomic , copy) NSString *text;/**text*/
@property (nonatomic , copy) NSNumber *type;/**type*/


@property (nonatomic , strong) SMARTGroupUser *user;/**user模型*/
@property (nonatomic , assign) NSInteger user_bury;
@property (nonatomic , assign) NSInteger user_digg;
@property (nonatomic , assign) NSInteger user_favorite;
@property (nonatomic , assign) NSInteger user_repin;


@end
