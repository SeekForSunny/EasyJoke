//
//  SMARTCommentViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/28.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTCommentViewController.h"
#import "SMARTCommentCollectionViewCell.h"
#import "SMARTTopicModel.h"
#import <MJRefresh.h>

@interface SMARTCommentViewController ()
@property (nonatomic , assign) NSInteger indexPathItem;
@end

@implementation SMARTCommentViewController

static NSString * const reuseIdentifier = @"CollectionCell";

#pragma mark - 初始化
- (instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(SMARTScreenW, [UIScreen mainScreen].bounds.size.height - SMARTNavMaxY);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;/**设置滚动方向*/
    layout.minimumLineSpacing = 0;/**行间距*/
    layout.minimumInteritemSpacing = 20;/**设置cell之间的距离*/

    return [super initWithCollectionViewLayout:layout];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SMARTCommentCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setUpProperty];
    
}

- (void)setUpProperty{
    
   // 设置UICollectionView属性
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.navigationItem.title = @"详情";
    
    //设置导航栏
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(turnBack) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"leftBackButtonFGNormal"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

}




#pragma mark - 处理左边按钮点击事件
- (void)turnBack{

    !self.tackBackItemBlock? :self.tackBackItemBlock(self.indexPathItem);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.topicModels.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SMARTCommentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   

    SMARTTopicModel *topicModel = nil;
    if (indexPath.item + self.item >= self.topicModels.count - 1) {

       topicModel = self.topicModels[self.item];

    }else{
        
    topicModel = self.topicModels[indexPath.item + self.item];
        
    }
    cell.topicModel = topicModel;
    

 
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    self.indexPathItem = indexPath.item;
    

}

//- (void)viewDidAppear:(BOOL)animated{
//
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.indexPathItem + self.item inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
//    
//}

@end
