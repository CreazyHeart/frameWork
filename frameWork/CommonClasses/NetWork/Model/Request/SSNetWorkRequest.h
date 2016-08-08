//
//  VIENetWorkModel.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSNetWorkModel.h"
#import "SSNetWorkMacros.h"




/*
 * 整个项目中所有 网络请求ModeL类的基类
 */
@interface SSNetWorkRequest : SSNetWorkModel


//接口地址
@property (nonatomic, copy) NSString *requestWebApi;

//请求方式 GET or POST
@property (nonatomic, copy) NSString *requestType;

//请求 token
@property (nonatomic, copy) NSString *access_token;

/*
//手机类型
@property (nonatomic, copy) NSString *phoneType;

//是否正在加载（yes:正在加载 ）
@property (nonatomic, assign) BOOL isLoading;
*/


//过滤后 的参数
- (NSMutableDictionary*)dicParamsIgnoredKeys;


@end

































