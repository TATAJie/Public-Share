//
//  Config.m
//  RRKShop
//
//  Created by MAC on 17/6/3.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "Config.h"
static BOOL _isGroup = true; // true 团购商户 fasle 个人商户
static NSString *_userID = @""; //用户ID
static NSString *_shopID = @""; //用户ID
static CGFloat _x = 0.f; //商店x
static CGFloat _y = 0.f; //商店y

@implementation Config

#pragma mark - 记录登录身份

+ (void)setIsGroup:(BOOL)isGroup
{
    _isGroup = isGroup;
}

+ (BOOL)getIsGroup
{
    return _isGroup;
}


#pragma mark - 用户ID

+ (void)setUserId:(NSString *)userID
{
    _userID = userID;
}

+ (NSString *)getUserId
{
    return _userID;
}

/**
 *  商铺ID
 **/
+ (void)setShopId:(NSString *)shopId
{
    _shopID = shopId;
}
+ (NSString *)getShopId
{
    return _shopID;
}

/**
 *  商铺纬度
 **/
+ (void)setShopX:(CGFloat)x
{
    _x = x;
}

+ (CGFloat)getShopX
{
    return _x;
}

/**
 *  商铺经度
 **/
+ (void)setShopY:(CGFloat)y
{
    _y = y;
}
+ (CGFloat)getShopY
{
    return _y;
}





+ (float)getStringWidth:(NSString *)string withFont:(UIFont *)font
{
    CGFloat width = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
    return width;
}

+(UIImage*)receiveBackImage
{
    UIImage *backImage = nil;
    int value = arc4random()%4;
    switch (value) {
        case 0:
            backImage = [UIImage imageNamed:@"blueMark"];
            break;
        case 1:
            backImage = [UIImage imageNamed:@"greenMark"];
            break;
        case 2:
            backImage = [UIImage imageNamed:@"purpleMark"];
            break;
        case 3:
            backImage = [UIImage imageNamed:@"yellowMark"];
            break;
        default:
            break;
    }
//    [backImage stretchableImageWithLeftCapWidth:backImage.size.width*0.8 topCapHeight:backImage.size.height*0.5];

//    UIImage *newiaage = [backImage stretchableImageWithLeftCapWidth:80 topCapHeight:20];
    
    return backImage;
}
@end
