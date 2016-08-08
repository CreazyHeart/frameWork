//
//  VIENetWork.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSNetWorkRequest.h"
#import "SSNetWorkMsg.h"


//网络调用成功回调函数
typedef void (^requestSuccessBlock)(id respond);
//网络调用失败回调函数
typedef void (^requestFailureBlock)(SSNetWorkMsg *message);


@interface SSNetWork : NSObject


//初始化网络 IP (程序一开始启动的时候就要调用)
+ (void)registerNetWorkIP:(NSString*)netWorkIP;


/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param request 网络请求参数
 * @param otherParam 网络请求的额外参数，一般情况为nil
 */
+ (void)requestAsynchronous:(SSNetWorkRequest*)request otherParam:(NSDictionary*)otherParam url:(NSString*)url success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param requestStyle 网络请求方式
 * @param requestParam 网络请求参数
 */
+ (void)requestAsynchronous:(SSNetWorkRequest*)requestStyle requestParam:(NSDictionary*)requestParam url:(NSString*)url success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


@end















