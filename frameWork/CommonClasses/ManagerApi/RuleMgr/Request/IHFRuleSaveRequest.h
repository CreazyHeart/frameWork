//
//  IHFRuleSaveRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/9.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface IHFRuleSaveRequest : SSNetWorkRequest
/**
 *  主键
 */
@property (copy, nonatomic) NSString *ID;

/**
 *  药品id
 */
@property (copy, nonatomic) NSString *dciId;

/**
 *  规则分类代号
 */
@property (copy, nonatomic) NSString *typeCode;

/**
 *  创建人
 */
@property (copy, nonatomic) NSString *createUser;

/**
 *  创建时间
 */
@property (copy, nonatomic) NSString *createTime;

/**
 *  修改人
 */
@property (copy, nonatomic) NSString *updateUser;

/**
 *  修改时间
 */
@property (copy, nonatomic) NSString *updateTime;
/**
 *  关联内容
 */
@property (strong, nonatomic) NSMutableArray *contents;


@end
