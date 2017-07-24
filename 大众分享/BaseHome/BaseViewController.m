//
//  BaseViewController.m
//  RRKShop
//
//  Created by MAC on 17/5/31.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // 2. 导航控制器代理
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavBarItem];
    // 导航栏标题字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];

}


#pragma mark 导航栏按钮自定义

- (void)customNavBarItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"Nav_BackItem"] forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.frame = CGRectMake(0, 0, 11, 18);
    [btn tapHandle:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}

- (BOOL) needHiddenBarInViewController:(UIViewController *)viewController {
    return [[self hiddenBarArray] containsObject:NSStringFromClass([viewController class])];
}


- (NSArray *)hiddenBarArray {

    return @[];
}




#pragma mark - UINaivgationController Delegate
#pragma mark -
#pragma mark Will Show ViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden: [self needHiddenBarInViewController: viewController]
                                             animated: animated];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}



- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    UIImage *image = [UIImage imageNamed:@"DataEmpty_Gray"];
    CGSize size = image.size;
    CGFloat scale = 1.0;
    scale = 100 / size.width;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scaledWidth = width * scale;
    CGFloat scaledHeight = height * scale;
    CGSize secSize = CGSizeMake(scaledWidth, scaledHeight);
    
    return [UIImage imageToCompressForSizeImage:image newSize:secSize];
}




@end
