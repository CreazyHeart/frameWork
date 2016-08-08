//
//  VIENetWorkModel.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSNetWorkMsg.h"

@implementation SSNetWorkMsg


// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"status" : @"status",
             @"reasons" : @"reasons"
             };
}

// 模型中有个数组属性，数组里面又要装着其它模型
+ (NSDictionary *)objectClassInArray{
    return @{
             @"reasons" : @"IHFNetWorkMsgReason"
             };
}


@end




















