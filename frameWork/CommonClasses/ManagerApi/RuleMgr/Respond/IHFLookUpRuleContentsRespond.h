//
//  IHFLookUpRuleContentsRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/9.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface IHFLookUpRuleContentsRespond : SSNetWorkModel
/**
 *  主键
 */
@property (copy, nonatomic) NSString *ID;
/**
 *  外键
 */
@property (copy, nonatomic) NSString *drsId;
/**
 *  父节点代号
 */
@property (copy, nonatomic) NSString *pCode;
/**
 *  子节点代号
 */
@property (copy, nonatomic) NSString *zCode;
/**
 *  字段
 */
@property (copy, nonatomic) NSString *field;
@property (copy, nonatomic) NSString *fieldName;
@property (copy, nonatomic) NSString *dataFlag;

/**
 *  字段值
 */
@property (copy, nonatomic) NSString *fieldValue;

@property (strong, nonatomic) NSString *fieldCode;
/**
 *  自己的子类
 */
@property (strong, nonatomic) NSMutableArray *childs;

@property (copy, nonatomic) NSString *no;

//拷贝一份自己
- (id)copySelf;

@end
