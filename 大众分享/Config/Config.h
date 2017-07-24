//
//  Config.h
//  RRKShop
//
//  Created by MAC on 17/6/3.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject
/**
 *  记录登录身份
 **/
+ (void)setIsGroup:(BOOL)isGroup;
+ (BOOL)getIsGroup;

/**
 *  用户ID
 **/
+ (void)setUserId:(NSString *)userID;
+ (NSString *)getUserId;

/**
 *  商铺ID
 **/
+ (void)setShopId:(NSString *)shopId;
+ (NSString *)getShopId;

/**
 *  商铺纬度
 **/
+ (void)setShopX:(CGFloat)x;
+ (CGFloat)getShopX;

/**
 *  商铺经度
 **/
+ (void)setShopY:(CGFloat)y;
+ (CGFloat)getShopY;

/*
 动态获取字符串长度
*/
+ (float)getStringWidth:(NSString *)string withFont:(UIFont *)font;

/*
 * 产生随机图片放置在选中商品种类的背景图
 */
+ (UIImage*)receiveBackImage;
@end
