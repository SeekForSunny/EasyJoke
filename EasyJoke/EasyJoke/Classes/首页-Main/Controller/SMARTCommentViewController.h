//
//  SMARTCommentViewController.h
//  EasyJoke
//
//  Created by SMART on 15/9/28.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SMARTTopicModel;
@interface SMARTCommentViewController : UICollectionViewController

/**帖子模型*/
@property (nonatomic , assign)  NSInteger item;
@property (nonatomic , strong) NSArray *topicModels;

@property (nonatomic , copy) void(^tackBackItemBlock)(NSInteger);
@end
