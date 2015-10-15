//
//  SMARTPicturePartView.m
//  EasyJoke
//
//  Created by SMART on 15/9/28.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTPicturePartView.h"
#import  <UIImageView+WebCache.h>
#import "SMARTTopicModel.h"
@interface SMARTPicturePartView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *isgif_view;

@end

@implementation SMARTPicturePartView


- (void)awakeFromNib{

    self.autoresizingMask = NO;
}

- (void)setTopicModel:(SMARTTopicModel *)topicModel{

    _topicModel = topicModel;
    
  
    NSString *listurl = topicModel.group.largeImage_list.URLDict[@"url"];
    NSString *url = topicModel.group.large_image.URLDict[@"url"];
    NSString *imageURLStr = listurl.length == 0 ? url : listurl;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageURLStr]];
  

    self.isgif_view.hidden =  !topicModel.group.is_gif;
}


@end
