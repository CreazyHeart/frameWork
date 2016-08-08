//
//  IHFAcountRespond.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"
#import "SSCommitteeRepond.h"


@interface SSAcountRespond : SSNetWorkModel


//用户名
@property (nonatomic, copy) NSString *userName;

//密码
@property (nonatomic, copy) NSString *userPassword;

//是否记住密码
@property (nonatomic, assign) BOOL isRememberPassword;

//
@property (nonatomic, copy) NSString *access_token;


/*
//
@property (nonatomic, copy) NSString *registration_id;

//
@property (nonatomic, copy) NSString *group_master;

//
@property (nonatomic, copy) NSString *doctor_name;;

//
@property (nonatomic, copy) NSMutableArray *committee;
*/



@end














