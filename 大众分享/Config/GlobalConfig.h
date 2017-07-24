//
//  GlobalConfig.h
//  RRKShop
//
//  Created by MAC on 17/6/2.
//  Copyright © 2017年 MAC. All rights reserved.
//

#ifndef GlobalConfig_h
#define GlobalConfig_h

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define WeakSelf __weak typeof(self) weakSelf = self;
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow

#endif /* GlobalConfig_h */
