//
//  SMARTTopicCell.m
//  EasyJoke
//
//  Created by SMART on 15/9/21.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTTopicCell.h"
#import "SMARTTopicModel.h"
#import "SMARTCommentModel.h"
#import "SMARTVideoPartView.h"
#import <UIImageView+WebCache.h>
#import "SMARTPicturePartView.h"
#import "SMARTCommentCell.h"
#import "SMARTHotCommentCell.h"

@interface SMARTTopicCell ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *header_imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *textContent;
@property (weak, nonatomic) IBOutlet UIButton *recommentCategoryBtn;
@property (weak, nonatomic) IBOutlet UIButton *ding_btn;
@property (weak, nonatomic) IBOutlet UIButton *cai_btn;
@property (weak, nonatomic) IBOutlet UIButton *ceommentCount_btn;
@property (weak, nonatomic) IBOutlet UIImageView *hotView;


@property (weak, nonatomic) SMARTPicturePartView *contentImageView;
@property (weak, nonatomic) SMARTVideoPartView *contentVideoView;

@property (weak, nonatomic) IBOutlet UITableView *buttomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomCons;

@end


NSString *const commentCellID = @"hotComment";
@implementation SMARTTopicCell


- (void)awakeFromNib{

    self.buttomView.scrollEnabled = NO;
    self.buttomView.rowHeight = UITableViewAutomaticDimension;
    self.buttomView.estimatedRowHeight = 100;
    self.buttomView.width = self.width;
    
    [self.buttomView registerNib:[UINib nibWithNibName:NSStringFromClass([SMARTHotCommentCell class]) bundle:nil] forCellReuseIdentifier:commentCellID];
    
    self.buttomView.delegate = self;
    self.buttomView.dataSource = self;

}

- (SMARTPicturePartView *)contentImageView{
    if (_contentImageView == nil) {
        SMARTPicturePartView *contentImageView = [SMARTPicturePartView ViewFromXib];
        self.contentImageView = contentImageView;
        [self addSubview:contentImageView];
    }
    return _contentImageView;
}


- (SMARTVideoPartView *)contentVideoView{

    if (!_contentVideoView) {
        
        SMARTVideoPartView *contentVideoView = [SMARTVideoPartView ViewFromXib];
        self.contentVideoView = contentVideoView;
        [self addSubview:contentVideoView];
    }
    
    return _contentVideoView;
}

- (void)setTopicModel:(SMARTTopicModel *)topicModel{

    _topicModel = topicModel;
    [self.header_imageView setHeader:topicModel.group.user.avatar_url];
    
    self.name.text = topicModel.group.user.name;
    self.textContent.text = topicModel.group.content;
    
    
    [self.recommentCategoryBtn setTitle:topicModel.group.category_name forState:UIControlStateNormal];
    //设置底部工具条按钮的数字
    [self setButton:self.ding_btn withTitle:topicModel.group.digg_count];

    [self setButton:self.cai_btn withTitle:topicModel.group.bury_count];

    [self setButton:self.ceommentCount_btn withTitle:topicModel.group.share_count];
    
    self.hotView.hidden = topicModel.group.digg_count.intValue >= 200?NO:YES;
    
    
    //如果是图片、视频模块，设置中间显示内容
    
    SMARTLargeImage *imageModel = topicModel.group.large_image ? topicModel.group.large_image :topicModel.group.largeImage_list;
    
    if (imageModel) {
        
        self.contentImageView.hidden = NO;
        self.contentVideoView.hidden = YES;
        
        self.contentImageView.topicModel = topicModel;
        self.contentImageView.frame = topicModel.contentFrame;

    }else{
        self.contentImageView.hidden =YES;
    
    }
    
    

    if (topicModel.group.large_cover) {
        
        self.contentVideoView.hidden = NO;
        self.contentImageView.hidden = YES;
        
        self.contentVideoView.topicModel = topicModel;
        self.contentVideoView.frame = topicModel.contentFrame;
        
    }else{
        
        self.contentVideoView.hidden = YES;
        
    }
    

    if (self.topicModel.comments.count) {
        
        self.buttomView.hidden = NO;
        
    }else{
        
        self.buttomView.hidden = YES;
    }
    
    

}

- (void)setButton:(UIButton*)button withTitle:(NSString*)title{


    if (title.integerValue >= 10000) {
        title = [NSString stringWithFormat:@"%.1f万",title.integerValue/10000.0];
    }
    
    if (title.integerValue == 0) {
        title = button.currentTitle;
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
}


- (IBAction)recomment:(UIButton *)sender {
    
    NSLog(@"%@",sender.titleLabel.text);
    
    
}


- (void)setFrame:(CGRect)frame{
    frame.size.height -= SMARTSmallMargin;
    frame.origin.x += SMARTSmallMargin;
    frame.size.width -= 2*SMARTSmallMargin;
    [super setFrame:frame];
}


#pragma mark - 设置热门评论

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.topicModel.comments.count;

}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SMARTHotCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:commentCellID];
    
    cell.commentModel = self.topicModel.comments[indexPath.row];
    

    return cell;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.buttomCons.constant = self.topicModel.cmtH;
    [self.buttomView reloadData];

}

@end
