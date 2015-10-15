//
//  SMARTCommentCollectionViewCell.m
//  EasyJoke
//
//  Created by SMART on 15/9/29.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTCommentCollectionViewCell.h"
#import "SMARTCommentCell.h"
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "SMARTTopicModel.h"
#import "SMARTTopicCell.h"

@interface SMARTCommentCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) AFHTTPSessionManager *AFNmanager;

@property (nonatomic , strong) NSMutableArray *recent_comments;
@property (nonatomic , strong) NSMutableArray *top_comments;
@property (nonatomic , copy) NSString *lastCommentID;


@property (nonatomic , weak) UIView *headerView;
@property (nonatomic , weak) SMARTTopicCell *cell;

@property (nonatomic , assign)NSInteger total_number;
@property (nonatomic , assign) NSInteger index;

@end



NSString *const SMARRCommentURL = @"http://isub.snssdk.com/2/data/v2/get_Easy_comments/";
NSString * const PerCommentID = @"PerCell";

@implementation SMARTCommentCollectionViewCell


#pragma  mark - 懒加载
-(AFHTTPSessionManager *)AFNmanager{
    if (_AFNmanager == nil) {
        _AFNmanager = [[AFHTTPSessionManager alloc] init];
    }
    return _AFNmanager;
}

#pragma mark - 初始化


- (void)setTopicModel:(SMARTTopicModel *)topicModel{

    _topicModel = topicModel;



}
#pragma mark 设置tableView
- (void)setUpTableView{
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.backgroundColor = SMARTGlobalColor;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMARTCommentCell class]) bundle:nil] forCellReuseIdentifier:PerCommentID];


}

- (void)awakeFromNib {
    // Initialization code

    [self setUpTableView];
    
    UIView *headerView = [[UIView alloc] init];
    self.headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    self.headerView.backgroundColor = SMARTGlobalColor;
    
    SMARTTopicCell *cell = [SMARTTopicCell ViewFromXib];
    self.cell = cell;
    [headerView addSubview:cell];
    
}



- (void)layoutSubviews{
    
    [super layoutSubviews];
    [self setUpTableViewHeader];
    
    [self setUpRefresh];
    

}


#pragma mark 设置tableViewHeader
- (void)setUpTableViewHeader{
   NSArray *tempArr = self.topicModel.comments;
    self.topicModel.comments = nil;
    self.cell.topicModel = self.topicModel;

    self.topicModel.comments = tempArr;
    self.cell.frame = CGRectMake(0, 10, SMARTScreenW, self.topicModel.cellHeight - self.topicModel.cmtH- SMARTSmallMargin);

    self.headerView.height = self.topicModel.cellHeight - self.topicModel.cmtH - SMARTSmallMargin;
}


#pragma  mark - 网络数据请求

- (void)setUpRefresh{

    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoardNewData)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(LoardMoreData)];

}

- (void)LoardNewData{
        SMARTFuncLog;
    [self.AFNmanager.tasks makeObjectsPerformSelector:@selector(cancel)];

    
    if (self.recent_comments == nil) {
        NSLog(@"self.recent_comments == nil");
        [self.tableView.header beginRefreshing];
    }
    
    

    self.index = 0;
    
    
    NSDictionary *parames = @{
                              
                              @"group_id":self.topicModel.group.group_id,
                              @"count":@"20",
                              @"offset":@0

                              };
    

    [[AFHTTPSessionManager manager] GET:SMARRCommentURL parameters:parames success:^(NSURLSessionDataTask *  task, id  responseObject) {

        self.recent_comments = [SMARTCommentModel objectArrayWithKeyValuesArray:responseObject[@"data"][@"recent_comments"]];
        self.top_comments = [SMARTCommentModel objectArrayWithKeyValuesArray:responseObject[@"data"][@"top_comments"]];
        
        self.total_number = [responseObject[@"total_number"] integerValue];
        
        
        
//        SMARTOutPutToPlist(responseObject, @"comment");
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
        
        if (self.recent_comments.count >= self.total_number) {
            
            [self.tableView.footer noticeNoMoreData];
            
        }
        
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        [self.tableView.header endRefreshing];
    }];


}



- (void)LoardMoreData{
    SMARTFuncLog;
    [self.AFNmanager.tasks makeObjectsPerformSelector:@selector(cancel)];


    NSInteger index = self.index + 1;
    NSInteger offset = index*20;
    NSInteger count = 20;

    
    NSDictionary *parames = @{
                              
                              @"group_id":self.topicModel.group.group_id,
                              @"count":@(count),
                              @"offset":@(offset)

                              };
    
    
    
    [self.AFNmanager GET:SMARRCommentURL parameters:parames success:^(NSURLSessionDataTask *  task, id  responseObject) {
        
        self.index = index;
        

        NSArray *recent_comments = [SMARTCommentModel objectArrayWithKeyValuesArray:responseObject[@"data"][@"recent_comments"]];

        [self.recent_comments addObjectsFromArray:recent_comments];
        self.lastCommentID = [self.recent_comments.lastObject ID];
        
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
        
        if (self.recent_comments.count >= self.total_number - 20) {

            [self.tableView.footer noticeNoMoreData];
        }
    } failure:^(NSURLSessionDataTask * task, NSError *  error) {
        
        [self.tableView.footer endRefreshing];
    }];

    
    
}




#pragma  mark - tableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.recent_comments.count) {
        
        if(self.top_comments.count){
        
            return 2;
        }
        return 1;
    }
    return 0;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0&&self.top_comments.count) {
        return self.top_comments.count;
    }
    
    return self.recent_comments.count;

};


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SMARTCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:PerCommentID];
    
    
    NSArray *commentModels = self.recent_comments;
    
   
    if (indexPath.section == 0&&self.top_comments.count) {
        
        commentModels = self.top_comments;
    }
 
    cell.commentModel = commentModels[indexPath.row];
    
    return cell;
}


//- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    if (self.recent_comments.count) {
//        
//        if (section == 0 && self.top_comments.count) {
//            return @"最热评论";
//        }
//        return @"最新评论";
//    }
//    return nil;
//}



- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *secView = [[UIView alloc] init];
    secView.height = 30;
    secView.backgroundColor = SMARTGlobalColor;
    
    UILabel *textTitle = [[UILabel alloc] init];
    [secView addSubview:textTitle];
    textTitle.font = [UIFont systemFontOfSize:13];

        textTitle.text = nil;
//    if (self.recent_comments.count) {
    
        if (section == 0 && self.top_comments.count) {
            textTitle.text =  @"最热评论";
        }else{
            textTitle.text = @"最新评论";}
//    }
    
    [textTitle sizeToFit];
    
    textTitle.height = secView.height;
    textTitle.x = SMARTSmallMargin;
    textTitle.textAlignment = NSTextAlignmentCenter;

    textTitle.textColor = [UIColor blackColor];
    
    return secView;

}





@end
