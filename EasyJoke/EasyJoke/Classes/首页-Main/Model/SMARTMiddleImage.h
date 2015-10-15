//
//  SMARTMiddleImage.h
//  EasyJoke
//
//  Created by SMART on 15/9/23.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMARTMiddleImage : NSObject

@property (nonatomic , assign) CGFloat  height;/**中等图片高度*/
@property (nonatomic , assign) CGFloat  width;/**中等图片宽度*/
@property (nonatomic , copy) NSString  *uri;/**uri*/
@property (nonatomic , strong) NSDictionary  *URLDict;/**大图地址*/

@end
