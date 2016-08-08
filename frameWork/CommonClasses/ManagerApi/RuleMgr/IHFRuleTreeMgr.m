//
//  IHFRuleTreeMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFRuleTreeMgr.h"

@implementation IHFRuleTreeMgr

+ (IHFRuleTreeMgr*)sharedInstance
{
    static IHFRuleTreeMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IHFRuleTreeMgr alloc] init];
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


#pragma mark - 规则库分类
- (void)ruleCategory:(IHFRuleCategaryRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [IHFRuleCategaryRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];
    
}


#pragma mark - 删除 树形 节点
- (void)deletTreeNode:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        if (success) {
            success(respond);
        }
        
    } failure:failure];
    
}

#pragma mark - 修改 树形 节点
- (void)modifyTreeNode:(IHFRuleSaveRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    //过滤掉的参数

    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        if (success) {
            success(respond);
        }
        
    } failure:failure];
    
}

#pragma mark - 保存 树形 节点
- (void)saveTreeNode:(IHFRuleSaveRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        SSNetWorkMsg *message = [SSNetWorkMsg mj_objectWithKeyValues:respond];
        SSNetWorkMsgReason *reason = message.reasons[0];
        if (success) {
            success(reason.message);
        }
        
    } failure:failure];
    
}

#pragma mark - 加载 树形 节点
- (void)loadTreeNode:(IHFLookUpRuleRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        IHFLookUpRuleRespond *ruleModel= [IHFLookUpRuleRespond mj_objectWithKeyValues:respond];
        if (success) {
            success(ruleModel);
        }
    } failure:failure];
    
}

@end












