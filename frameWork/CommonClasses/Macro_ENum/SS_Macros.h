//
//  SS_ENums.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

/*
 * 定义和当前项目相关的宏
 */

#ifndef SS_Macros_h
#define SS_Macros_h

#import "SQLiteVersion.h"

/// Document dir
#define APP_PATH_DOCUMENT	 [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

/// 本地主数据库完整路径
#define LOCAL_MAIN_DB_PATH   [APP_PATH_DOCUMENT stringByAppendingPathComponent:LOCAL_MAIN_DB_NAME]


//企业id
#define Enterprise_id       @"shfk"

//子系统类型
#define Subsys_type         @"mobile_pharmacy"


#define IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480)
#define IPHONE_5 ([UIScreen mainScreen].bounds.size.height == 568)
#define IPHONE_6 ([UIScreen mainScreen].bounds.size.height == 667)
#define IPHONE_6P ([UIScreen mainScreen].bounds.size.height == 736)

/**
 *  屏幕宽高
 */
#define SCREEN_W [UIScreen mainScreen].bounds.size.width

#define SCREEN_H [UIScreen mainScreen].bounds.size.height






#endif /* SS_Macros_h */














