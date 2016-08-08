//
//  IHFCharacterCategaryListConfigRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface SSCharacterCategaryListConfigRespond : SSNetWorkModel

/**
 *  医院ID
 */
@property (copy, nonatomic) NSString *hospId;
/**
 *  主键
 */
@property (copy, nonatomic) NSString *ID;
/**
 *  上一级主键
 */
@property (copy, nonatomic) NSString *dfcId;
/**
 *  字段
 */
@property (copy, nonatomic) NSString *field;
/**
 *  字段名称
 */
@property (copy, nonatomic) NSString *fieldName;
/**
 *  首拼音
 */
@property (copy, nonatomic) NSString *py;
/**
 *  使用标志
 */
@property (assign, nonatomic) NSInteger useFlag;
/**
 *  数据标志
 */
@property (assign, nonatomic) NSInteger dataFlag;




@end
