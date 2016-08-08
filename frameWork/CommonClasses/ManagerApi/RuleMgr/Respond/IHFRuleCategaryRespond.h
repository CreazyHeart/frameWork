//
//  IHFRuleCategaryRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface IHFRuleCategaryRespond : SSNetWorkModel
/**
 *  主键
 */
@property (copy, nonatomic) NSString *ID;
/**
 *  类型代号
 */
@property (copy, nonatomic) NSString *typeCode;
/**
 *  类型名称
 */
@property (copy, nonatomic) NSString *typeName;
/**
 *  顺序号
 */
@property (assign, nonatomic) NSInteger no;



@end
