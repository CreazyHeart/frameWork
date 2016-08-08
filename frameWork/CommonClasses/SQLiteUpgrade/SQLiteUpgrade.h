//
//  SQLiteUpgrade.h
//  Voice
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


//  功能说明：
//  提供一个数据库表结构更新的机制，保证用户无论从哪个版本安装程序，数据库结构保证适配。
//
//  使用说明：
//  1、新增一个类，继承于 SQLiteUpgrade 。
//  2、重载方法onCreate：在方法内写入第一次创建数据库时的SQL。
//  3、重载方法onUpgrade：在方法内写入每个数据库版本升级时的代码，比如v1->v2，v2->v3。
//  4、在程序启动时（如AppDelegate.m）实例化 新建的类，并调用checkDatabase方法，即可完成数据库的初始化和升级动作。


#import <Foundation/Foundation.h>
#import <FMDB/FMDatabase.h>

///Database的版本号
#import "SQLiteVersion.h"



@interface SQLiteUpgrade : NSObject


#pragma mark - Custom Property
/**
 * 是否允许数据库降级，默认不允许。
 * 注：默认降级是禁止的，如果要使用，在本类的子类实例化后，设置allowDowngrade = YES;然后再调用checkDatabase方法。
 *
 */
@property (nonatomic, assign) BOOL allowDowngrade;


/**
 * 当前项目的数据库版本号，如果下一次数据库表结构或数据要更改，请在原数字上加1.
 *
 * 如：第一次工程创建时dbVersion=1；软件迭代升级了几次后要修改数据库表结构或数据要更改，则修改dbVersion=2。
 */
@property (nonatomic, readonly, assign) NSInteger dbVersion;




#pragma mark - base class's methods
/**
 * 检查数据库（初始化数据库或更新数据库）
 *
 * @param dbFullName 完整的数据库路径+数据库文件名
 * @param newVersion 新版本的版本号
 * @return YES=成功，NO=失败
 */
- (BOOL)checkDatabase:(NSString*)dbFullName newVersion:(NSInteger)newVersion;


/**
 * 子类必须覆盖该方法，实现第一次创建数据库时的SQL
 *
 * @param db FMDB的数据库对象
 * @return YES=成功，NO=失败
 */
- (BOOL)onCreate:(FMDatabase *)db;

/**
 * 数据库版本相等时的方法。子类可以覆盖该方法，实现数据库  版本相等时的SQL
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onEqual:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion;

/**
 * 数据库版本增加时的方法。子类需要覆盖该方法，实现数据库版本增加时的代码
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onUpgrade:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion;

/**
 * 数据库版本降级时的方法。子类可以覆盖该方法，实现数据库版本降级时的代码
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onDowngrade:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion;

/**
 * 数据库配置检查完成后会调用的方法。子类可以覆盖该方法，实现数据库版本升级后的一些后续数据处理。
 *
 * @param db FMDB的数据库对象
 * @param dbCheckIsSuccess 数据库配置检查是否成功了
 */
- (void)didChecked:(FMDatabase *)db dbCheckIsSuccess:(BOOL)dbCheckIsSuccess;



@end

























