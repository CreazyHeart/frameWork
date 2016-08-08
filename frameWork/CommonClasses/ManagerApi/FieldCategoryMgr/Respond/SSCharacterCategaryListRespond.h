//
//  IHFCharacterCategaryListRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"
#import "SSCharacterCategaryListConfigRespond.h"


@interface SSCharacterCategaryListRespond : SSNetWorkModel
/**
 *  主键
 */
@property (copy, nonatomic) NSString *dfcId;
/**
 *  分类名称
 */
@property (copy, nonatomic) NSString *dfcClassName;
/**
 *  分类代号
 */
@property (copy, nonatomic) NSString *dfcClassCode;
/**
 *  顺序号
 */
@property (assign, nonatomic) NSInteger dfcNo;

/**
 *  创建时间
 */
@property (copy, nonatomic) NSString *dfcCreateTime;
/**
 *  修改时间
 */
@property (copy, nonatomic) NSString *dfcUpdateTime;
/**
 *  具体字段信息，存放的是IHFCharacterCategaryListConfigRespond模型
 */
@property (strong, nonatomic) NSArray *configs;
/**
 *  判断该section是否为打开状态
 */
@property (assign, nonatomic, getter=isOpened) BOOL opened;


@end
