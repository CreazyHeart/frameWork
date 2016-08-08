//
//  IHFMedicineInstructionsMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSMedicineInstructionsMgr.h"

@implementation SSMedicineInstructionsMgr

+ (SSMedicineInstructionsMgr*)sharedInstance
{
    static SSMedicineInstructionsMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSMedicineInstructionsMgr alloc] init];
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

#pragma mark - 获取药品分类
- (void)medicIndex:(SSMedicIndexRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        NSMutableArray *medicArray = [NSMutableArray array];
        medicArray = [SSMedicIndexRespond mj_objectArrayWithKeyValuesArray:respond];
        if (medicArray.count > 0) {
            if (success) {
                success(medicArray);
            }
        }
        
        
    } failure:failure];
    
}

#pragma mark - 药品列表，带有厂家信息
- (void)medicSearchInstruction:(SSMedicSearchInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        NSMutableArray *medicArray = [NSMutableArray array];
        medicArray = [SSMedicSearchInstrRespond mj_objectArrayWithKeyValuesArray:respond];
        if (medicArray.count > 0) {
            if (success) {
                success(medicArray);
            }
        }
        
        
    } failure:failure];
    
}


#pragma mark - 修改 药品 说明书
- (void)modifyMedicInstruction:(SSModifyMedicInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        SSNetWorkMsg *message = [SSNetWorkMsg mj_objectWithKeyValues:respond];
        
        if (success) {
            success(message);
        }
        
    } failure:failure];
    
}

//药品 搜索
- (void)medicSearch:(SSMedicSearchRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        NSMutableArray *medicArray = [NSMutableArray array];
        medicArray = [SSMedicSearchRespond mj_objectArrayWithKeyValuesArray:respond];
        if (success) {
            success(medicArray);
        }
    }
    failure:failure];
    
}


@end





























