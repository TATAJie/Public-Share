//
//  UIImage+Extension.h
//  RRKShop
//
//  Created by MAC on 17/6/3.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  自由拉伸一张图片
 *
 *  @param name 图片名字
 *  @param left 左边开始位置比例  值范围0-1
 *  @param top  上边开始位置比例  值范围0-1
 *
 *  @return 拉伸后的Image
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  根据颜色获取Image
 *
 *  @param color 颜色
 *
 */
+ (UIImage *)createImageWithColor:(UIColor*)color;


/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;

/**
 *  根据图片返回一张高斯模糊的图片
 *
 *  @param blur 模糊系数
 *
 *  @return 新的图片
 */
- (UIImage *)boxblurImageWithBlur:(CGFloat)blur;

/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的Image
 */
- (UIImage *)cropImageWithSize:(CGSize)size;
/**
 *  生成二维码
 *
 *  @param string 二维码内容
 *
 *  @param Imagesize 二维码图片大小
 *
 *  @param waterImagesize 中间logo图片大小
 *
 *  @return 生成的二维码Image
 */

+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize logoImage:(UIImage *)logoImage;

/**
 *  生成二维码
 *
 *  @param image 原始图片
 *
 *  @param size 图片压缩的大小
 *
 *  @return 生成的Image
 */
+ (UIImage *)imageToCompressForSizeImage:(UIImage *)image newSize:(CGSize)size;

//指定宽度按比例缩放
-(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

-(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

@end
