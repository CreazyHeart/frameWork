//
//  IHFLookUpRuleRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/9.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface IHFLookUpRuleRequest : SSNetWorkRequest
/**
 *  药品id
 */
@property (copy, nonatomic) NSString *dciId;
/**
 *  规则分类代号
 */
@property (copy, nonatomic) NSString *typeCode;


@end
