//
//  UIColor+Hex.h
//  iOS常用抽屉框架
//
//  Created by 杨杰 on 16/8/5.
//  Copyright © 2016年 杨杰. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
//#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//主红色
#define RRKRedColor  [UIColor colorWithRed:255/255.0 green:88/255.0 blue:88/255.0 alpha:1]
//线条灰
#define RRKGaryColor  [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]
//背景灰
#define RRKBgGaryColor  [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0]

@interface UIColor (Hex)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;
+ (UIColor *)colorWithIntRed:(int)red green:(int)green blue:(int)blue;
@end
