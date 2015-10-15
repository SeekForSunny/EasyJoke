//
//  SMARTHotCommentCell.m
//  EasyJoke
//
//  Created by SMART on 15/10/1.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTHotCommentCell.h"
#import "SMARTCommentModel.h"

@interface SMARTHotCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headIcon_imageView;
@property (weak, nonatomic) IBOutlet UILabel *name_lable;
@property (weak, nonatomic) IBOutlet UIButton *dig_btn;
@property (weak, nonatomic) IBOutlet UILabel *contenttext_lable;

@end
@implementation SMARTHotCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCommentModel:(SMARTCommentModel *)commentModel{
    _commentModel = commentModel;
    
    [self.headIcon_imageView setHeader: commentModel.avatar_url];
    self.name_lable.text = commentModel.user_name;
    
    [self.dig_btn setTitle:commentModel.digg_count forState:UIControlStateNormal];
    
    self.contenttext_lable.text = commentModel.text;
    [self.dig_btn setTitle:commentModel.digg_count forState:UIControlStateNormal];
    
    
}

@end
