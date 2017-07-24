//
//  MBProgressHUD+WZB.h
//  LiveVideo
//
//  Created by 鲁迅 on 16/3/29.
//  Copyright © 2016年 jjjr. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (WZB)

/**
 *  展示成功
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 *  展示失败
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;
/**
 *  展示信息
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (MBProgressHUD *)toast:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
