//
//  VIENetWorkMgr.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSNetWorkMacros.h"


//网络调用成功回调函数
typedef void (^ihfSuccessBlock)(NSInteger statusCode, NSDictionary *respond);
//网络调用失败回调函数
typedef void (^ihfFailureBlock)(NSInteger statusCode, NSString *localizedDescription, NSString *errorStr);

@interface SSNetWorkMgr : NSObject


//单例
+ (SSNetWorkMgr*)sharedInstance;


/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param method        网络请求类型：“GET”，"POST"
 * @param urlString     网络请求 URL
 * @param dicParams     网络请求的参数
 */
- (void)requestAsynchronous:(NSString*)method urlString:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(ihfSuccessBlock)success failure:(ihfFailureBlock)failure;





@end










