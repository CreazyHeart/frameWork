//
//  IHFMedicSearchInstrRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface SSMedicSearchInstrRespond : SSNetWorkModel

/**
 *  主键
 */
@property (copy, nonatomic) NSString *dciId;
/**
 *  外键
 */
@property (copy, nonatomic) NSString *dgId;
/**
 *  商品名称
 */
@property (copy, nonatomic) NSString *dciProductName;
/**
 *  剂型代号
 */
@property (copy, nonatomic) NSString *dciFormCode;
/**
 *  剂型名称
 */
@property (copy, nonatomic) NSString *dciFormCodeName;
/**
 *  规格
 */
@property (copy, nonatomic) NSString *dciSpec;
/**
 *  药品说明书
 */
@property (copy, nonatomic) NSString *dciDesc;
/**
 *  药品说明书标题
 */
@property (copy, nonatomic) NSString *dciDescTitle;
/**
 *  生产厂商代号
 */
@property (copy, nonatomic) NSString *dciVendorCode;
/**
 *  生产厂商代号
 */
@property (copy, nonatomic) NSString *dciVendorCodeName;
/**
 *  键值对存储药品说明书
 */
@property (strong, nonatomic) NSDictionary *map;



@end
