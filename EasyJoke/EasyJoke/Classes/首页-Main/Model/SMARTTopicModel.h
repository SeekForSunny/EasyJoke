//
//  SMARTTopicModel.h
//  EasyJoke
//
//  Created by SMART on 15/9/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMARTCommentModel.h"
#import "SMARTGroupModel.h"

typedef enum {
    
    kTopicTypeRecommment = -101,
    kTopicTypeVideo = -104,
    kTopicTypePicture = -103,
    kTopicTypeWord = -102
//    kTopicTypeSubscribe,
//    kTopicTypeEssence,
//    kTopicTypeSame,
//    kTopicTypeFriendCircle,

} kTopicType;

@interface SMARTTopicModel : NSObject

@property (nonatomic , assign) kTopicType type;
@property (nonatomic , strong) NSArray *comments;/**评论模型*/
@property (nonatomic , strong) SMARTGroupModel *group;/**Group模型*/
@property (nonatomic , copy) NSString *online_time;
@property (nonatomic , copy) NSString *display_time;
/**主页Cell模型高度*/
@property (nonatomic , assign) CGFloat cellHeight;

 /**中间内容的Frame*/
@property (nonatomic , assign) CGRect contentFrame;

/**热评高度*/
@property (nonatomic , assign) CGFloat cmtH;

@end
