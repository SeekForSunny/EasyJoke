//
//  SMARTCommentCell.m
//  EasyJoke
//
//  Created by SMART on 15/9/29.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTCommentCell.h"
#import <UIImageView+WebCache.h>
#import "SMARTCommentModel.h"

@interface SMARTCommentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headIcon_imageView;
@property (weak, nonatomic) IBOutlet UILabel *name_lable;
@property (weak, nonatomic) IBOutlet UILabel *createtime_lable;
@property (weak, nonatomic) IBOutlet UIButton *dig_btn;
@property (weak, nonatomic) IBOutlet UILabel *contenttext_lable;

@end

@implementation SMARTCommentCell

- (void)awakeFromNib {
    self.autoresizingMask = NO;
}



- (void)setCommentModel:(SMARTCommentModel *)commentModel{
    _commentModel = commentModel;
    
    [self.headIcon_imageView setHeader: commentModel.avatar_url];
    self.name_lable.text = commentModel.user_name;
    
    self.createtime_lable.text = commentModel.create_time;
    
    [self.dig_btn setTitle:commentModel.digg_count forState:UIControlStateNormal];
    
    self.contenttext_lable.text = commentModel.text;
    [self.dig_btn setTitle:commentModel.digg_count forState:UIControlStateNormal];
    

}

- (void)setFrame:(CGRect)frame{
    frame.origin.x = SMARTSmallMargin;
    frame.size.width = SMARTScreenW - 2*SMARTSmallMargin;
    [super setFrame:frame];
}

@end
