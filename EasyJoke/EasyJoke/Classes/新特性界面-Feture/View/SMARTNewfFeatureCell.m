//
//  SMARTNewfFeatureCell.m
//  EasyJoke
//
//  Created by SMART on 15/9/20.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTNewfFeatureCell.h"
#import "SMARTTabBarController.h"
@interface SMARTNewfFeatureCell ()
@property (nonatomic , weak) UIImageView *imageView;
@property (nonatomic , weak) UIButton *starButton;

@end

@implementation SMARTNewfFeatureCell

- (UIButton *)starButton{
    if (!_starButton) {
        
        UIButton * starButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [starButton setBackgroundImage:[UIImage imageNamed:@"skipicon_review_press"] forState:UIControlStateNormal];
        starButton.width = 44;
        starButton.height = starButton.width;
        [starButton addTarget:self action:@selector(starButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        self.starButton = starButton;
        starButton.center = CGPointMake(self.width-30, self.height-30);
        [self.contentView addSubview:starButton];
        
    }
    return _starButton;
    
}


- (UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}


- (void)setImage:(UIImage *)image {
    
    _image = image;
    self.imageView.image = image;

}

- (void)starButtonClicked{
    
    SMARTTabBarController *tabBarVc = [[SMARTTabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    

}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count{

    if (indexPath.item == count - 1) {
        self.starButton.hidden = NO;
        
    }else{
        
     self.starButton.hidden = YES;
    
    }

}

@end
