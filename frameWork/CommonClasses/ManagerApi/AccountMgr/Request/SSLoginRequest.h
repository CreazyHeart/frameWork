//
//  IHFLoginRequest.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"


/*
 account字段值可以是local_id（员工所在医院账号，如2224，前面要加上“doc”，即doc2224），也可以是login_id（全局id，在所有的系统中通用）；
 Password值要经过md5加密；enterprise_id是企业id，目前值是“shfk”； subsys_type是子系统类型，目前值是“mobile_doctor”,
 device和place可以为空
 */

@interface SSLoginRequest : SSNetWorkRequest

//用户名
@property (nonatomic,copy) NSString *account;

//密码
@property (nonatomic,copy) NSString *password;

//
@property (nonatomic,copy) NSString *enterprise_id;

//
@property (nonatomic,copy) NSString *subsys_type;

//
@property (nonatomic,copy) NSString *device;

//
@property (nonatomic,copy) NSString *place;






@end







