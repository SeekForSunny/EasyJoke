//
//  SMARTEssenceController.m
//  EasyJoke
//
//  Created by SMART on 15/10/1.
//  Copyright © 2015年 SMART. All rights reserved.
//

#import "SMARTEssenceController.h"

@interface SMARTEssenceController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

NSString *const requstURL = @"http://i.snssdk.com/neihan/in_app/mybar_list/";
@implementation SMARTEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requstURL]]];
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
