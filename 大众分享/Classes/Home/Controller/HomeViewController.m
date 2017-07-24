//
//  HomeViewController.m
//  第一项目
//
//  Created by 杰杨 on 2017/7/6.
//  Copyright © 2017年 杰杨. All rights reserved.
//

#import "HomeViewController.h"
#import "SQCodeViewController.h"
#import "ShareTools.h"
@interface HomeViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) MBProgressHUD *hud;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.backgroundColor = [UIColor colorWithHex:0xf8f8f8];
    self.webView.delegate = self;
    
    
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.frame = CGRectMake(0, 0, 23, 23);
    [btnRight setBackgroundImage:[UIImage imageNamed:@"Home_Share"] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(rightItemAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(0, 0, 25, 25);
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"Home_SQ"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(leftItemAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btnLeft];
    self.navigationItem.leftBarButtonItem = leftItem;

    
    
    
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_hud showAnimated:YES];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    
}


- (void)rightItemAction
{
    NSLog(@"分享");
    [[ShareTools shareInstance]shareMenuParamsByText:@"不要问我为什么这么便宜，你的满意才是我的满意" images:@[] url:@"http://www.baidu.com" title:@"hahaha" onShareStateChanged:^(SSDKResponseState state) {
        
    }];
}

- (void)leftItemAction
{
    NSLog(@"扫一扫");
    [self.navigationController pushViewController:[SQCodeViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
   
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *titleHtml = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.title = titleHtml;
    [_hud hideAnimated:YES];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_hud hideAnimated:YES];
}
@end
