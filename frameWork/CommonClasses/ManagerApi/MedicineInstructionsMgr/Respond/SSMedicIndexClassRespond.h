//
//  IHFMedicIndexClassesRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/29.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface SSMedicIndexClassRespond : SSNetWorkModel
/**
 *  主键
 */
@property (copy, nonatomic) NSString *ID;
/**
 *  父节点代号
 */
@property (copy, nonatomic) NSString *pCode;
/**
 *  父节点名称
 */
@property (copy, nonatomic) NSString *pName;
/**
 *  子节点代号
 */
@property (copy, nonatomic) NSString *zCode;
/**
 *  子节点名称
 */
@property (copy, nonatomic) NSString *zName;
/**
 *  序号（统一父节点内）
 */
@property (strong, nonatomic) NSNumber *no;
/**
 *  保存标识符
 */
@property (copy, nonatomic) NSString *saveFlag;
/**
 *  子分类
 */
@property (strong, nonatomic) NSArray *childs;

@end
