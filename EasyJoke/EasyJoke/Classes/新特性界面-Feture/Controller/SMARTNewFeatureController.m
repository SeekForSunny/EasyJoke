//
//  SMARTNewFeatureController.m
//  EasyJoke
//
//  Created by SMART on 15/9/20.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTNewFeatureController.h"
#import "SMARTNewfFeatureCell.h"
//#import "SMARTSaveTool.h"

#define SMARTTotalPage 3
@interface SMARTNewFeatureController ()

@end


@implementation SMARTNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;/**设置滚动方向*/
    layout.minimumLineSpacing = 0;/**行间距*/
    layout.minimumInteritemSpacing = 0;/**设置cell之间的距离*/
    

    return [super initWithCollectionViewLayout:layout];

}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];
    [self.collectionView registerClass:[SMARTNewfFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];

    
}

- (void)setUp{

    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return SMARTTotalPage;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SMARTNewfFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    NSString *imageName = [NSString stringWithFormat:@"picture%zd_intros",indexPath.item + 1];
    cell.image =  [UIImage imageNamed:imageName];
    
   [cell setIndexPath:indexPath count:SMARTTotalPage];
    
    return cell;
}




@end
