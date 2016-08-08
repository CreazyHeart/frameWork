//
//  IHFFieldCategoryMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSNetWork.h"



//字段分类
#import "SSCharacterCategaryListRequest.h"
#import "SSCharacterCategaryListRespond.h"

//字段分类 的 子分类
#import "SSGetCharacterChildValueRequest.h"


//字段分类 的值
#import "SSGetCharacterValueRequest.h"
#import "SSGetCharacterValueRespond.h"



@interface SSFieldCategoryMgr : NSObject

+ (instancetype)sharedInstance;


//字段分类
- (void)characterCategaryList:(SSCharacterCategaryListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//字段分类 的 子分类
- (void)characterChildCategaryList:(SSGetCharacterChildValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//字段分类 的值
- (void)characterValue:(SSGetCharacterValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


@end














