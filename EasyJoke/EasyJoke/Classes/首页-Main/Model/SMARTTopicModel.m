//
//  SMARTTopicModel.m
//  EasyJoke
//
//  Created by SMART on 15/9/22.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTTopicModel.h"
#import "SMARTGroupModel.h"
#import "SMARTCommentModel.h"

@implementation SMARTTopicModel

- (CGFloat)cellHeight{
    
    if (_cellHeight == 0) {
        
        _cellHeight += SMARTTextY;
        
        //计算文本内容的高度
        NSString *textContent = self.group.text;
        
        CGFloat textH =[textContent boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 4*SMARTSmallMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        _cellHeight += textH + SMARTSmallMargin;
        
        
        _cellHeight += SMARTRecommentBtnH + SMARTSmallMargin ;
        
        //计算图片高度【1】
        if (self.group.large_image) {
            
            CGFloat vContentW = SMARTScreenW - 2*SMARTSmallMargin;
            CGFloat vContentH = self.group.large_image.height;
            CGFloat scale = vContentW/ self.group.large_image.width*1.0;
            
            vContentH = self.group.large_image.height * scale;

            self.contentFrame = CGRectMake(0, _cellHeight, vContentW, vContentH);
            
            _cellHeight += vContentH + SMARTSmallMargin;
            
        }
        
        //计算图片高度【2】
        if (self.group.largeImage_list) {
            
            CGFloat vContentW = SMARTScreenW - 2*SMARTSmallMargin;
            CGFloat vContentH = self.group.largeImage_list.height;
            CGFloat scale = vContentW/ self.group.largeImage_list.width*1.0;
            
            vContentH = self.group.largeImage_list.height * scale;

            self.contentFrame = CGRectMake(0, _cellHeight, vContentW, vContentH);
            
            _cellHeight += vContentH + SMARTSmallMargin;
            
        }
        
        //计算视频内容高度
        if(self.group.large_cover){
            
            CGFloat vContentW = SMARTScreenW - 2*SMARTSmallMargin;
            CGFloat vContentH = self.group.video_height;
            CGFloat scale = vContentW / self.group.video_width *1.0;

            
              vContentH =self.group.video_height * scale;

            
            self.contentFrame = CGRectMake(0, _cellHeight, vContentW, vContentH);
            
            _cellHeight += vContentH + SMARTSmallMargin;
            
        }
        

        
        //计算最热最热评论高度
        
        if (self.comments.count!= 0) {
            
            CGFloat cmtH = 0;
            for (SMARTCommentModel *commentModel in self.comments) {
                
                NSString *context  = [NSString stringWithFormat:@"%@",commentModel.text];
                
             CGFloat contextH = [context boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 6*SMARTSmallMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSAttachmentAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
      

                cmtH += 35 +contextH + SMARTSmallMargin;
            }
            self.cmtH = cmtH;
            _cellHeight += cmtH + SMARTSmallMargin;
            
        }

        

        _cellHeight += SMARTTopicCellBottombarH + SMARTSmallMargin;
        
    }

    return _cellHeight;
}


@end
