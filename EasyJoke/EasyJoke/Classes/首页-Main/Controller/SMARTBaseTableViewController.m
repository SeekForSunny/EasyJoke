//
//  SMARTBaseTableViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/21.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTBaseTableViewController.h"
#import "SMARTTopicCell.h"
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "SMARTRecommentController.h"
#import <UIImageView+WebCache.h>
#import "SMARTCommentViewController.h"

@interface SMARTBaseTableViewController ()<UIScrollViewDelegate>

@property (nonatomic , strong) AFHTTPSessionManager *manager;
@property (nonatomic , copy) NSString *max_time;
@property (nonatomic , copy) NSString *min_time;
@property (nonatomic , copy) NSString *tip;/***/
@property (nonatomic , assign) BOOL has_more;

@property (nonatomic , strong) NSMutableArray *topicModels;/**帖子模型数组*/
@property (nonatomic , strong) SMARTTopicModel *firstModel;

@property (nonatomic , weak)  UIImageView *headerView;

@end

NSString *const SMARTTopicCellID = @"topic";

@implementation SMARTBaseTableViewController

#pragma mark -初始化

- (kTopicType)type{ return 0;}


- (AFHTTPSessionManager *)manager{

    if (_manager == nil) {
        _manager = [[AFHTTPSessionManager alloc] init];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMARTGlobalColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(SMARTTopViewH, 0, SMARTTabBarH + 20, 0);
    
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMARTTopicCell class]) bundle:nil] forCellReuseIdentifier:SMARTTopicCellID];
    
    [self setUpRefresh];

    
}

#pragma mark 设置刷新
- (void)setUpRefresh{
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.header beginRefreshing];
    self.tableView.header.automaticallyChangeAlpha = YES;
    
     self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

}
#pragma mark 加载网络请求
- (void)loadNewData{

    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    if (self.topicModels==nil) {
        [self.tableView.header beginRefreshing];
    }
    
    
    NSDictionary *parames = @{
                              
                              @"mpic":@1,
                              @"essence":@1,
                              @"content_type":@(self.type),
                              @"message_cursor":@(-1),
                          
                            
                              };
    [self.manager GET:SMARTBASEURL parameters:parames success:^(NSURLSessionDataTask * task, id jsonData) {

        
        self.topicModels = [SMARTTopicModel objectArrayWithKeyValuesArray:jsonData[@"data"][@"data"]];

        self.max_time = jsonData[@"data"][@"max_time"];
        self.min_time = jsonData[@"data"][@"min_time"];
 
        if ([self isKindOfClass:[SMARTRecommentController class]]) {
            
            self.firstModel = self.topicModels.firstObject;
            [self.topicModels removeObjectAtIndex:0];

            if (self.firstModel.group.image_status == 0){
           [self setUpHeaderView];
           NSString *imageName = self.firstModel.group.large_image.URLDict[@"url"];
           UIImage *placeHolder = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hotPage.bundle/00.jpg" ofType:nil]];

                [self.headerView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:placeHolder];//sd_setImageWithURL:[NSURL URLWithString:imageName]];
                
            }
            
        }else{

            
        }
        
        SMARTOutPutToPlist(jsonData, NSStringFromClass([self class]));
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
         [self.tableView.header endRefreshing];
    }];

}

#pragma mark 加载更多网络数据
- (void)loadMoreData{

    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    
    if (self.has_more == NO){
        
        [self.tableView.footer noticeNoMoreData];
    };
    
    //?message_cursor=-1&count=60&from_id=0&from_type=0&support_type=1%2C2

    NSDictionary *parames = @{

                              
                              @"message_cursor":@(-1),
                              @"count":@(60),
                              @"from_id":@0,
                              @"from_type":@0,


                              
                              };
    
    
    NSString *const LoadMoreURL = @"http://ic.snssdk.com/message/get/v1/";
    [self.manager GET:LoadMoreURL parameters:parames success:^(NSURLSessionDataTask * task, id jsonData) {
        
        
        NSArray *topicModels = [SMARTTopicModel objectArrayWithKeyValuesArray:jsonData[@"data"][@"data"]];
        [self.topicModels addObjectsFromArray:topicModels];
        
        SMARTOutPutToPlist(jsonData, NSStringFromClass([self class]));
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        [self.tableView.footer endRefreshing];
    }];

}




#pragma mark 设置头部View
- (void)setUpHeaderView{

    if (![self isKindOfClass:[SMARTRecommentController class]])return;
     UIImageView *headerView = [[UIImageView alloc] init];
    headerView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.3];
    headerView.frame = CGRectMake(SMARTSmallMargin, 0, SMARTScreenW - 2*SMARTSmallMargin, 200);
    self.headerView = headerView;
    [self.view addSubview:headerView];
    self.tableView.tableHeaderView = headerView;
}


#pragma mark - TableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.topicModels.count;
}


#pragma mark - tableView代理方法
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SMARTTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:SMARTTopicCellID];
    cell.topicModel = self.topicModels[indexPath.row];
    
    return cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    SMARTTopicModel *model = self.topicModels[indexPath.row];
    return model.cellHeight;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    



    
    SMARTCommentViewController *commentVc = [[SMARTCommentViewController alloc] init];
    commentVc.hidesBottomBarWhenPushed = YES;
    
    commentVc.item = indexPath.row;
    commentVc.topicModels = self.topicModels;
    
    NSInteger Row = indexPath.row;
    NSLog(@"Row = %zd", Row);

    
    commentVc.tackBackItemBlock = ^(NSInteger IndexPathRow){

        NSLog(@"indexPathRow = %zd",IndexPathRow + Row);
        
        NSInteger ScrollToIndexPath =IndexPathRow + Row ;
        
        if (ScrollToIndexPath > self.topicModels.count - 1) {
            
            ScrollToIndexPath = self.topicModels.count - 1;
        }
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:ScrollToIndexPath inSection:0];
     
        
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    };
    

    [self.navigationController pushViewController:commentVc animated:YES];

}

@end
