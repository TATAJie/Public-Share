//
//  SQCodeViewController.h
//  RRKShop
//
//  Created by MAC on 17/6/14.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "BaseViewController.h"
@class SQCodeViewController;
@protocol SQCodeViewControllerDelegate <NSObject>

- (void)SQCodePickResult:(NSString *)result withVC:(SQCodeViewController *)vc;

@end
@interface SQCodeViewController : BaseViewController
@property (weak, nonatomic) id <SQCodeViewControllerDelegate>delegate;
@end
