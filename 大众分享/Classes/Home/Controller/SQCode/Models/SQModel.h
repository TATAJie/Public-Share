//
//  SQModel.h
//  RRKShop
//
//  Created by MAC on 17/6/22.
//  Copyright © 2017年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQModel : NSObject
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *number; //个数
@property (strong, nonatomic) NSString *productName; //产品名称
@property (strong, nonatomic) NSString *sellPrice;  //价格
@end
