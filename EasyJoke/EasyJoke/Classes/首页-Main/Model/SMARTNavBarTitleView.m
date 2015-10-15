//
//  SMARTNavBarTitleView.m
//  EasyJoke
//
//  Created by SMART on 15/9/27.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTNavBarTitleView.h"


@interface SMARTNavBarTitleView ()

@property (nonatomic , strong) NSMutableArray *indicators;
@property (nonatomic , weak) UIView *contentView;
@property (nonatomic , weak) UILabel *textLable ;

@end
@implementation SMARTNavBarTitleView


- (NSMutableArray *)indicators{
    if (!_indicators) {
        _indicators = [NSMutableArray array];
    }
    return _indicators;
}


+ (instancetype)titleViewWithTitle:(NSString *)title Index:(int)index{
    
    return [[self alloc] initWithTitle:title Index:index];

}



- (instancetype)initWithTitle:(NSString *)title Index:(int)index{
    if (self = [super init]) {
        
    UILabel *textLable = [[UILabel alloc] init];
        self.textLable = textLable;
    textLable.backgroundColor = [UIColor purpleColor];
    textLable.text = title;
    [textLable sizeToFit];
    textLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLable];
    
    
    
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    self.contentView = contentView;

    for (int i = 0; i<8; i++) {
        
        UIView * indiactor = [[UIView alloc] init];
        [contentView addSubview:indiactor];
        
        if (i == index) {
         indiactor.backgroundColor = [UIColor redColor];
        }else{
        indiactor.backgroundColor = [UIColor grayColor];
        }
        
        [self.indicators addObject:indiactor];
    }
    
    }

    return self;
}



- (void)layoutSubviews{
    [super layoutSubviews];
    
     self.textLable.centerX= self.width*0.5;
     self.textLable.y= 10;
    
    self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.textLable.frame) + 5, self.width, 5);

    int count = (int)self.indicators.count;
    CGFloat W = (self.contentView.width - 16)/count;
    CGFloat H = 5;
    CGFloat Y = 0;
    
    for (int i = 0; i<count; i++) {
        UIView *indicator = self.indicators[i];
        
        CGFloat X = i*W;
        
        if (i > 0) {
         X += i*2;
        }
     
        indicator.frame = CGRectMake(X, Y, W, H);

    }
   
    
    self.contentView.x = 0;

}

@end
