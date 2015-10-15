//
//  SMARTMainViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/19.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTMainViewController.h"
#import "SMARTLoginViewController.h"

#import "SMARTRecommentController.h"
#import "SMARTVideoController.h"
#import "SMARTPictureController.h"
#import "SMARTWordController.h"
#import "SMARTEssenceController.h"
#import "SMARTSubscribeController.h"
#import "SMARTSameController.h"
#import "SMARTFriendCircleController.h"
#import "SMARTNavBarTitleView.h"

@interface SMARTMainViewController ()<UIScrollViewDelegate>

@property (nonatomic , weak)  UIView *indicator;
@property (nonatomic , strong) NSMutableArray *titleButtons;
@property (nonatomic , weak)  UIScrollView *scrollView ;
@property (nonatomic , weak) UIScrollView *topView ;
@property (nonatomic , weak) UIButton *rightButton;
@property (nonatomic , weak) UIButton *selectedButton;

@property (nonatomic , weak)  SMARTNavBarTitleView *titleView;


@end

@implementation SMARTMainViewController

#pragma mark -  初始化


- (NSMutableArray *)titleButtons{
    if(_titleButtons == nil){
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpNavbar];
    [self setUpChildVc];
    [self setUpScrollView];
    [self setUpTopView];

}




#pragma mark 设置导航栏
- (void)setUpNavbar{
  
  UINavigationBar *navigationBar =  [UINavigationBar appearance];
  UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:210/255.0 green:228/255.0 blue:210/255.0 alpha:1]];
    
  [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
  [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
  UIBarButtonItem *item =  [UIBarButtonItem itemWithImage:@"defaulthead" highImage:@"defaulthead" target:self action:@selector(iconCliked)];
    self.navigationItem.leftBarButtonItem = item;
    
  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"neihan_logo_night"]];
}

#pragma mark - 设置主页的自子控制器

- (void)setUpChildVc{
    
    SMARTRecommentController *recommentVc = [[SMARTRecommentController alloc] init];
    [self addChildViewController:recommentVc];
    
    SMARTVideoController *videoVc = [[SMARTVideoController alloc] init];
    [self addChildViewController:videoVc];
    
    SMARTPictureController *picturetVc = [[SMARTPictureController alloc] init];
    [self addChildViewController:picturetVc];
    
    SMARTWordController *wordVc = [[SMARTWordController alloc] init];
    [self addChildViewController:wordVc];
    
    SMARTSubscribeController *subsVc = [[SMARTSubscribeController alloc] init];
    [self addChildViewController:subsVc];
    
    SMARTSameController *sameVc = [[SMARTSameController alloc] init];
    [self addChildViewController:sameVc];
    
    SMARTEssenceController *essenVc = [[SMARTEssenceController alloc] init];
    [self addChildViewController:essenVc];
    
    
    SMARTFriendCircleController *circlceVc = [[SMARTFriendCircleController alloc] init];
    [self addChildViewController:circlceVc];
    
    
}


- (void)iconCliked{
    
    SMARTLoginViewController *loginVc = [[SMARTLoginViewController alloc] init];
     loginVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVc animated:YES];
    
}


#pragma mark -  设置topView
- (void)setUpTopView{

    /**顶部的ScrollView*/
    UIScrollView *topView = [[UIScrollView alloc] init];
    topView.frame = CGRectMake(0, 0, SMARTScreenW, SMARTTopViewH);
    [self.view addSubview: topView];
    self.topView = topView;
    self.topView.contentSize = CGSizeZero;
  
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton = rightButton;
    [rightButton setImage:[UIImage imageNamed:@"arrow_more"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [rightButton sizeToFit];
    rightButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    rightButton.frame = CGRectMake(SMARTScreenW-SMARTTopRightButtonW, 0, SMARTTopRightButtonW, self.topView.height);
    [self.view addSubview:rightButton];
    
   
    /**顶部ScrollView的内部View*/
    UIView *topContentView = [[UIView alloc] init];
    topContentView.frame =self.topView.bounds;
    [self.topView addSubview:topContentView];
    topContentView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5];
    
   //设置topView中间显示部分
   NSArray * titles = @[@"推荐",@"视频",@"图片",@"段子",@"订阅",@"同城",@"精华",@"段友圈"];
   [self addTitleViewWith:titles toContentView:topContentView];
 
}

#pragma mark -  设置titleButton部分
- (void)addTitleViewWith:(NSArray*)titles toContentView:(UIView*)contentView{


    CGFloat X = 0;

    
    int count = (int)titles.count;
    for (int i = 0; i < count; i++) {
        UIButton *button = [[UIButton alloc] init];
        [self.titleButtons addObject:button];
        [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 
       NSString *title = titles[i];
        
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel sizeToFit];
        
        CGFloat titleW = [title sizeWithAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]}].width + 2* SMARTSmallMargin;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.x = X;
        X += titleW;// + SMARTSmallMargin;
        button.width = titleW;
        button.height = SMARTTopViewH;
        [contentView addSubview:button];
        self.topView.contentSize = CGSizeMake(X + self.rightButton.width, 0);
        contentView.width = X;
        
    }
    

    [self titleButtonClicked:self.titleButtons.firstObject];

    
    
#pragma mark  设置指示器
    UIView *indicator = [[UIView alloc] init];
    self.indicator = indicator;
    indicator.layer.cornerRadius = 5;
    indicator.backgroundColor = [UIColor purpleColor];
    CGFloat iX = SMARTSmallMargin * 0.5;
    CGFloat iY = SMARTSmallMargin*0.5;
    CGFloat iW = self.selectedButton.width - SMARTSmallMargin;
    CGFloat iH = self.selectedButton.height - SMARTSmallMargin;
    indicator.frame = CGRectMake(iX, iY, iW, iH);
    
    [contentView insertSubview:indicator atIndex:0];
    

}

#pragma mark - 标题按钮点击
- (void)titleButtonClicked:(UIButton *)titleButton{
    
    self.selectedButton.selected  = NO;
    titleButton.selected = YES;
    self.selectedButton = titleButton;
    
#pragma mark - 调用刷新titleView
    [self refreshTitleView];
    
    [UIView animateWithDuration:0.15 animations:^{
        _indicator.width = self.selectedButton.width - SMARTSmallMargin;
        _indicator.centerX = self.selectedButton.centerX;
    }];
    
    
    NSInteger index = [self.titleButtons indexOfObject:titleButton];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = index *SMARTScreenW;
    [self.scrollView setContentOffset:offset animated:YES];
    
    
}

#pragma mark - 右上角箭头按钮点击事件
- (void)rightButtonClicked{
    
    self.topView.contentOffset = CGPointMake(self.topView.contentSize.width - SMARTScreenW, self.topView.contentOffset.y);

}

#pragma mark - 设置ScrollView
- (void)setUpScrollView{
   
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.backgroundColor = SMARTRandomColor;

    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    [self.view insertSubview:scrollView atIndex:0];
    self.scrollView = scrollView;
    self.scrollView.contentSize = CGSizeMake(self.childViewControllers.count * SMARTScreenW, 0);
    [self scrollViewDidEndScrollingAnimation:scrollView];//默认显示第0个控制器
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{//结束滚动动画
    
    int index = scrollView.contentOffset.x/SMARTScreenW;
    UIViewController *willShowVC = self.childViewControllers[index];
    
#pragma mark -  数据测试 给即将显示的控制器View添加监听

    //给即将显示的控制器View添加监听
    if (self.isViewLoaded) {
        
        [self addObserVerToChildView:willShowVC];

    }
    

    willShowVC.view.frame = self.scrollView.bounds;//这句话相当于 willShowVc.View.x = offsetX
    [scrollView addSubview:willShowVC.view];
    

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{//停止减速

    [self scrollViewDidEndScrollingAnimation:scrollView];
    
     NSInteger index = scrollView.contentOffset.x /SMARTScreenW;
    [self titleButtonClicked:self.titleButtons[index]];
    
    //将选中按钮的frame转换成ScrollView的frame,然后根据选中按钮的x取值来移动topView
    CGRect frame = [self.view convertRect:self.selectedButton.frame fromView:self.topView];
    CGFloat maxX = SMARTScreenW - SMARTTopRightButtonW - self.selectedButton.width;
    CGPoint offset = self.topView.contentOffset;
    if (frame.origin.x >=maxX ) {
        
                offset.x += frame.origin.x - maxX;
                self.topView.contentOffset = offset;
    }

    if (frame.origin.x <= 0) {
        
                offset.x += frame.origin.x;
                self.topView.contentOffset = offset;
    }

    
}



#pragma mark -  测试方案 给即将显示的View添加监听
- (void)addObserVerToChildView:(UIViewController*)childVc{
      [childVc addObserver:self forKeyPath:@"view.bounds" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew  context:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.isViewLoaded){

    }

}
- (void)dealloc{
   
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"view.bounds"];


}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{

    CGFloat offsetY = [change[@"new"] CGRectValue].origin.y;
    
    self.topView.hidden = offsetY >= 0 ? YES:NO;
    self.rightButton.hidden = offsetY >= 0 ? YES:NO;
    
    #pragma mark 调用刷新titleView方法
    [self refreshTitleView];
    

}

#pragma mark - 刷新titleView方法
- (void)refreshTitleView{
    
    if (self.topView.hidden) {
        
        
        NSString *title = self.selectedButton.currentTitle;
        int index = (int)[self.titleButtons indexOfObject:self.selectedButton];
        
        SMARTNavBarTitleView *titleView = [SMARTNavBarTitleView titleViewWithTitle:title Index:index];
        titleView.frame = CGRectMake(0, 0, 100, 44);
        titleView.backgroundColor = [UIColor greenColor];
        self.navigationItem.titleView = titleView;
        
    }else{
        
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"neihan_logo"]];
        
        
    }

}




@end
