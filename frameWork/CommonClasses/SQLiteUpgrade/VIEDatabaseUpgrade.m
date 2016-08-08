//
//  VIEDatabaseUpgrade.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#import "VIEDatabaseUpgrade.h"

@implementation VIEDatabaseUpgrade


#pragma mark - Override the parent class's methods

/**
 * 第一次创建数据库时的sql。注意不需要写事务，父类已经启动事务
 *
 * @param db FMDB的数据库对象
 */
- (BOOL)onCreate:(FMDatabase *)db
{
    NSLog(@">>> onCreate");
    
    if (!db) {
        NSAssert(0, @"db can't be null");
        return NO;
    }
    
    @try {
        
        ////////////////////////// 在此处添加第一次创建表和初始化的SQL ///////////////////////////////
        BOOL result = NO;
        
        // 2 执行表创建工作
        // 2.1 用户表
        result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_Users (UserId TEXT NOT NULL, LoginId TEXT NOT NULL, loginPassword TEXT, UserName TEXT, Age INTEGER, Title TEXT, PRIMARY KEY (UserId));"];
        if (!result) {
            NSLog(@"create table Users Failed");
            return NO;
        }
        
        // 2.2 工作日志表
        result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_Worklog (WorklogId TEXT NOT NULL, Title TEXT NOT NULL, Desc TEXT, Owner TEXT NOT NULL, CreatedTime TEXT NOT NULL, ModifiedTime TEXT NOT NULL, IsDeleted INTEGER, PRIMARY KEY (WorklogId));"];
        if (!result) {
            NSLog(@"create table t_Worklog Failed");
            return NO;
        }
        /////////////////////////////////////// END ////////////////////////////////////////////
        
        
        //第一次创建数据库即self.dbVersion=1时，可以不用实现覆盖方法onUpgrade，此处可以直接return true;
        //self.dbVersion>1时,实现覆盖方法onUpgrade并调用它，是为了保证用户从不管从哪个版本新安装，都保证数据库版本更新到最新版。
        //如:用户A数据库版本是v1，用户B是v2，用户C没装过App这次新装；当前数据库版本是v3，安装运行App后，用户A会v1->v2->v3，用户B会v2->v3，用户C会v1->v2->v3依次升级数据库。
        return [self onUpgrade:db oldVersion:SQLiteVersion_FIRST newVersion:self.dbVersion];
        
    }
    @catch (NSException *exception) {
        NSAssert1(0, @"Exception: %@", exception.reason);
        return NO;
    }
    @finally {
        
        return YES;
    }
    
    return YES;
}

/**
 * 数据库版本相等时需要做的事情可以在该方法实现。
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 */
- (BOOL)onEqual:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion {
    
    NSLog(@">>> onEqual, oldVersion=%ld, newVersion=%ld", (long)oldVersion, (long)newVersion);
    
    
    return YES;
}


/**
 * 数据库版本增加时的方法，比如数据库表结构发生变化，要从版本v1升级到版本v2
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 */
- (BOOL)onUpgrade:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion
{
    NSLog(@">>> onUpgrade, oldVersion=%ld, newVersion=%ld", (long)oldVersion, (long)newVersion);
    
    if (!db) {
        NSAssert(0, @"db can't be null");
        return NO;
    }
    
    @try {
        // 升级数据库
        // 使用for实现跨版本升级数据库，代码逻辑始终会保证顺序递增升级。
        BOOL rev = NO;
        for(NSInteger ver = oldVersion; ver < newVersion; ver++) {
            rev = NO;
            switch(ver) {
                case SQLiteVersion_V1: //v1-->v2
                    rev = [self upgradeVersion1To2:db];
                    break ;
                case SQLiteVersion_V2: //v2-->v3
                    rev = [self upgradeVersion2To3:db];
                    break ;
                    //有新的版本在此处添加case 3、case 4等等。
                default :
                    break ;
            }
            if (!rev) return NO;
        }
        
        //
        return YES;
    }
    @catch (NSException *exception) {
        NSAssert1(0, @"Exception: %@", exception.reason);
        return NO;
    }
    @finally {
        
    }
    
    //
    return YES;
}

/**
 * 数据库配置检查完成后会调用的方法。可以实现数据库版本升级后的一些后续数据处理。
 *
 * @param db FMDB的数据库对象
 * @param dbCheckIsSuccess 数据库配置检查是否成功了
 */
- (void)didChecked:(FMDatabase *)db dbCheckIsSuccess:(BOOL)dbCheckIsSuccess
{
    if (!dbCheckIsSuccess) return;
    
    //do db something
    //...
    
}


#pragma mark - Custom Method
/**
 * 数据库版本从v1升级到v2。
 *
 */
- (BOOL)upgradeVersion1To2:(FMDatabase *)db
{
    //举例：
    //1 判断表是否存在，取出t_Users表创建语句
    //1.2 判断要新增的列MobilePhone是否存，不存在则添加
    
    
    return YES;
}

/**
 * 数据库版本从v2升级到v3。
 *
 */
- (BOOL)upgradeVersion2To3:(FMDatabase *)db
{
    
    //do something...
    return YES;
}


@end













































