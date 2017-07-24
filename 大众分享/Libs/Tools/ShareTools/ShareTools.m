//
//  ShareTools.m
//  RRKShop
//
//  Created by 杰杨 on 2017/6/29.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import "ShareTools.h"
// 弹出分享菜单需要导入的头文件
#import <ShareSDKUI/ShareSDK+SSUI.h>
// 自定义分享菜单栏需要导入的头文件
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <ShareSDKUI/SSUIEditorViewStyle.h>
@implementation ShareTools

static ShareTools *shareSingleton = nil;

+( instancetype )shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once ( &onceToken, ^ {
        
        shareSingleton = [[super allocWithZone:NULL] init] ;
        
    } );
    return shareSingleton;
    
}

+(id) allocWithZone:(struct _NSZone *)zone {
    
    return [ShareTools shareInstance] ;
    
}

-(id) copyWithZone:(struct _NSZone *)zone {
    
    return [ShareTools shareInstance] ;
    
}

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
                        onShareStateChanged:(ShareStateChangedHandler)shareStateChangedHandler
{
    self.block = shareStateChangedHandler;
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeAuto];
    [shareParams SSDKEnableUseClientShare];
    //设置微博使用高级接口
    //2017年6月30日后需申请高级权限
    [shareParams SSDKEnableAdvancedInterfaceShare];
    NSArray *items = @[
                       @(SSDKPlatformSubTypeQZone),
                       @(SSDKPlatformSubTypeWechatSession),
                       @(SSDKPlatformSubTypeWechatTimeline),
                       @(SSDKPlatformTypeQQ),
                       @(SSDKPlatformSubTypeQQFriend)];
    [SSUIShareActionSheetStyle setShareActionSheetStyle:ShareActionSheetStyleSimple];
    WeakSelf;
    [ShareSDK showShareActionSheet:KEY_WINDOW
                             items:items
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   
                   switch (state) {
                           
                       case SSDKResponseStateBegin:
                       {
                           //设置UI等操作
                           break;
                       }
                       case SSDKResponseStateSuccess:
                       {
        
                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                               message:nil
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"确定"
                                                                     otherButtonTitles:nil];
                           [alertView show];
                           break;
                       }
                       case SSDKResponseStateFail:
                       {

                           break;
                       }
                       case SSDKResponseStateCancel:
                       {
                           break;
                       }
                       default:
                           break;
                   }
                   
                   weakSelf.block(state);
               }];
}
@end
