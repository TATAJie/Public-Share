//
//  BaseTableViewController.m
//  RRKShop
//
//  Created by MAC on 17/6/6.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // 2. 导航控制器代理
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavBarItem];
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

@end
