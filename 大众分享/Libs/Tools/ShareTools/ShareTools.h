//
//  ShareTools.h
//  RRKShop
//
//  Created by 杰杨 on 2017/6/29.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ShareStateChangedHandler) (SSDKResponseState state);
@interface ShareTools : NSObject

+( instancetype )shareInstance;

/**
 *  设置分享参数
 *
 *  @param text     文本
 *  @param images   图片数组
 *  @param url      网页路径/应用路径
 *  @param title    标题
 *  @param shareStateChangedHandler   分享状态回调
 */
- (void)shareMenuParamsByText:(NSString *)text
                       images:(NSArray *)images
                          url:(NSString *)url
                        title:(NSString *)title
          onShareStateChanged:(ShareStateChangedHandler)shareStateChangedHandler;

@property (copy, nonatomic)ShareStateChangedHandler block;
@end
