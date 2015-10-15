//
//  SMARTSubscribeController.m
//  EasyJoke
//
//  Created by SMART on 15/10/1.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTSubscribeController.h"

@interface SMARTSubscribeController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

NSString *const requestURL = @"http://i.snssdk.com/neihan/in_app/essence_list/";
@implementation SMARTSubscribeController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]]];
    

}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    return YES;

}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    SMARTFuncLog;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    SMARTFuncLog;

}

@end
