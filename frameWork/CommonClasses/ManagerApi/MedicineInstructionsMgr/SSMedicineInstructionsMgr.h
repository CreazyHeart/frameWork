//
//  IHFMedicineInstructionsMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSNetWork.h"


//药品分类
#import "SSMedicIndexRequest.h"
#import "SSMedicIndexRespond.h"

//药品列表，带有厂家信息
#import "SSMedicSearchInstrRequest.h"
#import "SSMedicSearchInstrRespond.h"


//修改 药品 说明书
#import "SSModifyMedicInstrRequest.h"

//
#import "SSMedicSearchRequest.h"
#import "SSMedicSearchRespond.h"




@interface SSMedicineInstructionsMgr : NSObject


+ (instancetype)sharedInstance;


//获取药品分类
- (void)medicIndex:(SSMedicIndexRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//药品列表，带有厂家信息，包含说明书
- (void)medicSearchInstruction:(SSMedicSearchInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//修改 药品 说明书
- (void)modifyMedicInstruction:(SSModifyMedicInstrRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//药品 搜索
- (void)medicSearch:(SSMedicSearchRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

@end















