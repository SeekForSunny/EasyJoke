//
//  SMARTLoginButton.m
//  EasyJoke
//
//  Created by SMART on 15/9/26.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTLoginButton.h"

@implementation SMARTLoginButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.x = (self.width - self.imageView.width)*0.5;
    self.imageView.y = 0;
    
    self.titleLabel.centerX = self.imageView.centerX;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.titleLabel sizeToFit];

}

@end
