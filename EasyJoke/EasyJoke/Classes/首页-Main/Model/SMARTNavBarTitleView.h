//
//  SMARTNavBarTitleView.h
//  EasyJoke
//
//  Created by SMART on 15/9/27.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMARTNavBarTitleView : UIView

+ (instancetype)titleViewWithTitle:(NSString *)title Index:(int)index;
- (instancetype)initWithTitle:(NSString *)title Index:(int)index;

@end
