//
//  IHFRuleTreeMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSNetWork.h"
#import "SSNetWorkRequest.h"


//规则库的分类
#import "IHFRuleCategaryRequest.h"
#import "IHFRuleCategaryRespond.h"

//保存规则库
#import "IHFRuleSaveRequest.h"

//加载 树形 节点
#import "IHFLookUpRuleRequest.h"
#import "IHFLookUpRuleRespond.h"


@interface IHFRuleTreeMgr : NSObject


+ (instancetype)sharedInstance;


//规则库的分类
- (void)ruleCategory:(IHFRuleCategaryRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//删除 树形 节点
- (void)deletTreeNode:(SSNetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//修改 树形 节点
- (void)modifyTreeNode:(IHFRuleSaveRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//保存 树形 节点
- (void)saveTreeNode:(IHFRuleSaveRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//加载 树形 节点
- (void)loadTreeNode:(IHFLookUpRuleRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;





@end

















