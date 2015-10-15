//
//  UIImageView+SMARTExtension.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "UIImageView+SMARTExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (SMARTExtension)

//根据url设置圆形剪切图片
- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}
//根据url设置矩形剪切图片
- (void)setRectHeader:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaulthead"]];
}


//根据url设置圆形剪切图片
- (void)setCircleHeader:(NSString *)url
{
  
    UIImage *placeholder = [self circleImageNamed:@"defaulthead"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
       if (image == nil) return;
       
       self.image = [self setCircleImageWithImage:image];
   }];
}



//根据传进来的图片设置圆形裁剪图片
- (UIImage *)setCircleImageWithImage:(UIImage *)image
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(image.size);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 矩形框
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // 添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪(裁剪成刚才添加的图形形状)
    CGContextClip(ctx);
    
    // 往圆上面画一张图片
    [image drawInRect:rect];
    
    // 获得上下文中的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

//根据传进来的字符串设置圆形剪切图片
- (UIImage *)circleImageNamed:(NSString *)name
{
    return [self setCircleImageWithImage:[UIImage imageNamed:name]];
}


@end
