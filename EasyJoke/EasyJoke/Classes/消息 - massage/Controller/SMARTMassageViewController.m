//
//  SMARTMassageViewController.m
//  EasyJoke
//
//  Created by SMART on 15/9/19.
//  Copyright (c) 2015年 SMART. All rights reserved.
//

#import "SMARTMassageViewController.h"
#import "SMARTQuicklyLoginController.h"
@interface SMARTMassageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SMARTMassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"消息";
    self.view.backgroundColor = SMARTGlobalColor;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"投稿互动";
        cell.imageView.image = [UIImage imageNamed:@"interaction"];
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"系统消息";
        cell.imageView.image = [UIImage imageNamed:@"systemmessage"];
    
    }else{
        cell.textLabel.text = @"粉丝关注";
        cell.imageView.image = [UIImage imageNamed:@"vermicelli"];
    }
    
  
  

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SMARTQuicklyLoginController *quicklyVc = [[SMARTQuicklyLoginController alloc] init];
    quicklyVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:quicklyVc animated:YES];


}




@end
