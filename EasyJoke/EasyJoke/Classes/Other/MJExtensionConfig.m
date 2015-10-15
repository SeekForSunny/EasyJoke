//
//  MJExtensionConfig.m
//  EasyJoke
//
//  Created by SMART on 15/9/23.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "MJExtensionConfig.h"

#import <MJExtension.h>
#import "SMARTTopicModel.h"
#import "SMARTGroupModel.h"
#import "SMARTCommentModel.h"
#import "SMARTLargeImage.h"

@implementation MJExtensionConfig

+(void)load{
    
    
#pragma mark  SMARTTopicModel模型


    
    
    [SMARTTopicModel setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"comments":@"SMARTCommentModel"
                 };
    }];

#pragma mark  SMARTGroupModel模型
    
    [SMARTGroupModel setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 
                 @"ID":@"id",
                 @"largeImage_list":@"large_image_list[0]"
      
                 
                 };
        
    }];
    
    
#pragma mark  SMARTCommentModel模型
    
    [SMARTCommentModel setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 
                 @"ID":@"id",
                 @"Description":@"description"
        
                 
                 };
        
    }];
    
    
    
#pragma mark  SMARTLargeImage模型
    
    [SMARTLargeImage setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 
                 @"URLDict":@"url_list[1]"
   
                 
                 };
        
    }];

}






@end
