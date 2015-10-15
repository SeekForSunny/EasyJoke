//
//  SMARTVideoPartView.m
//  EasyJoke
//
//  Created by SMART on 15/9/28.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTVideoPartView.h"
#import <UIImageView+WebCache.h>
#import "SMARTTopicModel.h"

@interface SMARTVideoPartView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCount_lable;
@property (weak, nonatomic) IBOutlet UILabel *time_lable;

@end

@implementation SMARTVideoPartView

- (void)awakeFromNib{

    self.autoresizingMask = NO;

}

- (void)setTopicModel:(SMARTTopicModel *)topicModel{

    _topicModel = topicModel;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topicModel.group.large_cover[@"url_list"][0][@"url"]]];
    
}


@end
