//
//  SMARTHotBarController.m
//  EasyJoke
//
//  Created by SMART on 15/9/27.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTHotBarController.h"

#define  totalPageCount 6
@interface SMARTHotBarController ()<UIScrollViewDelegate>
@property (nonatomic , weak) UIPageControl * pageControl;
@property (nonatomic ,weak) UIScrollView *scrollView ;

@property (nonatomic , strong) NSTimer *timer;
@end

@implementation SMARTHotBarController


#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = SMARTGlobalColor;
    self.tableView.delegate = self;
    
    [self setUpHeaderView];
    [self setUpTableView];
    [self startTimer];

}



- (void)setUpHeaderView{

    
    UIView *headerView = [[UIView alloc] init];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.frame = CGRectMake(0, 0, self.view.width, 200);
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.scrollIndicatorInsets = scrollView.contentInset;
    [headerView addSubview:scrollView];
    headerView.frame = scrollView.frame;
    self.tableView.tableHeaderView =headerView;
    [self setUpScrollViewContent:scrollView];
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.height - 30, scrollView.width, 30)];
    bottomView.backgroundColor = [UIColor lightTextColor];
    
    UILabel *leftTextLable = [[UILabel alloc] init];
    leftTextLable.text = @"精品热吧";
    leftTextLable.textColor = [UIColor whiteColor];
    leftTextLable.font = [UIFont systemFontOfSize:13];
    [leftTextLable sizeToFit];
    leftTextLable.x = 10;
    leftTextLable.height = bottomView.height;
    [bottomView addSubview:leftTextLable];
    
    
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    pageControl.numberOfPages = totalPageCount;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    pageControl.height = bottomView.height;
    pageControl.x = bottomView.width - pageControl.width - 50;
    [bottomView addSubview:pageControl];
    
    [headerView addSubview:bottomView];
   
    

}

- (void)setUpScrollViewContent:(UIScrollView*)scrollView{

    
    CGFloat W = scrollView.width;
    CGFloat H = scrollView.height;
    CGFloat Y = 0;
    int count = totalPageCount;
    scrollView.contentSize = CGSizeMake(count*W,0);
    for (int i = 0; i < count; i++) {
        
        CGFloat X = i*W;
        
        UIImageView *imageView  = [[UIImageView alloc] init];
        
        NSString *imageName = [NSString stringWithFormat:@"hotPage.bundle/0%d.jpg",i];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        
        imageView.backgroundColor = [UIColor greenColor];
        imageView.frame = CGRectMake(X, Y, W,H);
        
    }
    

}

- (void)setUpTableView{


}
# pragma mark - scrollView的代理方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self stopTimer];
    int page = scrollView.contentOffset.x/scrollView.width;
    self.pageControl.currentPage = page;
    [self startTimer];
    
}

#pragma mark - 设置tableView的头部SectionView

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

return @"热门吧";
    
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *scView = [[UIView alloc] init];
    scView.height = 30;
    scView.backgroundColor =[UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"热门吧" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"hotpaste"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button sizeToFit];
    button.x = 15;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    button.height = scView.height;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scView addSubview:button];
    
    
    UILabel *numLable = [[UILabel alloc] init];
    [scView addSubview:numLable];
    numLable.text = @"(159)";
    numLable.textColor = [UIColor grayColor];
    [numLable sizeToFit];
    numLable.x = CGRectGetMaxX(button.frame);
    numLable.height = scView.height;
    numLable.font = [UIFont systemFontOfSize:13];

    return scView;
}



#pragma mark - 打开定时器
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];

    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

#pragma mark - 关掉定时器
- (void)stopTimer
{
    
    [self.timer invalidate];
    
}

#pragma mark - 控制自动轮番播放
- (void)nextPage{
    NSUInteger page = self.pageControl.currentPage + 1;
    self.pageControl.currentPage = page;


    if (page > totalPageCount-1) {
        self.pageControl.currentPage =0;
    }else
    {
        self.pageControl.currentPage = page;
    }


    CGPoint offset = self.scrollView.contentOffset;
    offset.x = self.pageControl.currentPage * self.view.width;
    self.scrollView.contentOffset = offset;
}

@end
