//
//  IHFFieldCategoryMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSFieldCategoryMgr.h"

@implementation SSFieldCategoryMgr

+ (SSFieldCategoryMgr*)sharedInstance
{
    static SSFieldCategoryMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSFieldCategoryMgr alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark - 字段分类
- (void)characterCategaryList:(SSCharacterCategaryListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [SSCharacterCategaryListRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];
    
}


#pragma mark - 字段分类 的 子分类
- (void)characterChildCategaryList:(SSGetCharacterChildValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [SSGetCharacterValueRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];

}

#pragma mark - 字段分类 的值
- (void)characterValue:(SSGetCharacterValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];

    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [SSGetCharacterValueRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];

}

@end













