//
//  IHFRuleSearchMgr.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IHFRuleSearchRequest.h"
#import "SSNetWork.h"
#import "IHFObtainHistroySearchListRequest.h"

@interface IHFRuleSearchMgr : NSObject

/**
 *  利用单例进行网络访问
 */
+ (instancetype)sharedInstance;

/**
 *
 *
 *  @param request 请求参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 */
- (void)ruleSearch:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


/**
 *  保存一条搜索记录
 */
- (void)saveSearchList:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;
/**
 *  获取搜索记录
 */
- (void)obtainHistorySearchList:(IHFObtainHistroySearchListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

/**
 *  清除所有历史搜索记录
 */
- (void)clearAllHistorySearchList:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;
/**
 *  删除一条历史搜索记录
 */
- (void)deletOneSearchList:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


@end
