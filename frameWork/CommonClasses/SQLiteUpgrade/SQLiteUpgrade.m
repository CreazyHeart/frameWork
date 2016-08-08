//
//  SQLiteUpgrade.m
//
//  Voice
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#import "SQLiteUpgrade.h"



@interface SQLiteUpgrade()

@property (nonatomic, strong) FMDatabase *db;

@end



@implementation SQLiteUpgrade

/**
 * 只读属性，当前项目的数据库版本号，如果下一次数据库表结构或数据要更改，请在原数字上加1.
 *
 * 如：第一次工程创建时dbVersion请设为1；软件迭代升级了几次后要修改数据库表结构或数据要更改，则修改dbVersion=2；每次升级数据库请把版本号累加。
 */
- (NSInteger)dbVersion
{
    //这里返回的枚举值，修改枚举值后，这里返回的版本号会自动增加
    return SQLiteVersion_New-1;
}


/**
 * 检查数据库（初始化数据库或更新数据库）
 *
 * @param dbFullName 完整的数据库路径+数据库文件名
 * @param newVersion 新版本的版本号
 */
- (BOOL)checkDatabase:(NSString*)dbFullName newVersion:(NSInteger)newVersion
{
    if (!dbFullName) {
        NSAssert1(0, @"db path and name can't be empty (%@)", dbFullName);
        @throw [NSException exceptionWithName:@"Database name error" reason:@"Database name and path can not be empty." userInfo:nil];
        return NO;
    }
    if (newVersion < SQLiteVersion_FIRST) {
        NSAssert1(0, @"The database version number cannot be less than 1. (%ld)", (long)newVersion);
        @throw [NSException exceptionWithName:@"Database version error" reason:@"The database version number cannot be less than 1." userInfo:nil];
        return NO;
    }
    
    self.db = [FMDatabase databaseWithPath:dbFullName];
    @try {
        if (![_db open]) {
            //            [db release];
            //NSLog(@"db open fail");
            NSAssert1(0, @"db open fail (%@)", dbFullName);
            return NO;
        }
        
        //查出当前数据库版本
        FMResultSet *rs = [_db executeQuery:@"PRAGMA user_version;"];
        int oldVersion = -1;
        if ([rs next])
        {
            oldVersion = [rs intForColumnIndex:0];
        }
        [rs close];
        
        //
        if (oldVersion <= SQLiteVersion_Null) { //表示第一次创建数据库
            
            [_db beginTransaction];
            BOOL rev = [self onCreate:_db];
            if (rev) {
                rev = [_db executeUpdate:[NSString stringWithFormat:@"PRAGMA user_version = %ld", (long)newVersion]];
                if (rev)
                    [_db commit];
                else {
                    NSLog(@">>> db exec fail: %@", [_db lastError]);
                    [_db rollback];
                }
            }
            else {
                [_db rollback];
                NSLog(@">>> db exec fail: %@", [_db lastError]);
            }
            //
            [self didChecked:_db dbCheckIsSuccess:rev];
            return rev;
        }
        else { //表示已经创建了库表，接下来走onUpgrade等，由开发者在子类中决定如何升级或降级库表结构
            
            if (newVersion < oldVersion) { //新版本号小于旧版本号
                
                if (self.allowDowngrade) {
                    //执行用户的降级代码
                    [_db beginTransaction];
                    BOOL rev = [self onDowngrade:self.db oldVersion:oldVersion newVersion:newVersion];
                    if (rev) {
                        rev = [_db executeUpdate:[NSString stringWithFormat:@"PRAGMA user_version = %ld", (long)newVersion]];
                        if (rev)
                            [_db commit];
                        else {
                            [_db rollback];
                            NSLog(@">>> db exec fail: %@", [_db lastError]);
                        }
                    }
                    else {
                        [_db rollback];
                        NSLog(@">>> db exec fail: %@", [_db lastError]);
                    }
                    //
                    [self didChecked:_db dbCheckIsSuccess:rev];
                    return rev;
                }
                else { //禁止降级
                    NSString *errStr = [NSString stringWithFormat:@"The database new version(%ld) cannot be less than the old version(%ld)", (long)newVersion, (long)oldVersion];
                    NSAssert2(0, errStr, newVersion, oldVersion);
                    //                    @throw [NSException exceptionWithName:@"Database version error" reason:errStr userInfo:nil];
                    //
                    [self didChecked:_db dbCheckIsSuccess:NO];
                    return NO;
                }
            }
            else if (newVersion == oldVersion) { //新旧版本号相同
                
                //执行用户的代码
                [_db beginTransaction];
                BOOL rev = [self onEqual:self.db oldVersion:oldVersion newVersion:newVersion];
                if (rev)
                    [_db commit];
                else {
                    [_db rollback];
                    NSLog(@">>> db exec fail: %@", [_db lastError]);
                }
                //
                [self didChecked:_db dbCheckIsSuccess:rev];
                return rev;
            }
            else { //新版本号大于旧版本号则执行onUpgrade里的方法
                
                //执行用户的更新代码
                [_db beginTransaction];
                BOOL rev = [self onUpgrade:self.db oldVersion:oldVersion newVersion:newVersion];
                if (rev) {
                    rev = [_db executeUpdate:[NSString stringWithFormat:@"PRAGMA user_version = %ld", (long)newVersion]];
                    if (rev)
                        [_db commit];
                    else {
                        [_db rollback];
                        NSLog(@">>> db exec fail: %@", [_db lastError]);
                    }
                }
                else {
                    [_db rollback];
                    NSLog(@">>> db exec fail: %@", [_db lastError]);
                }
                //
                [self didChecked:_db dbCheckIsSuccess:rev];
                return rev;
            }
        }
    }
    @catch (NSException *ex) {
        
        NSAssert1(0, @"Exception: %@", ex.reason);
        
    }
    @finally {
        [self.db close];
        
    }
    return NO;
}

/**
 * 第一次创建数据库时的方法。子类需要覆盖该方法，实现第一次创建数据库时的代码
 *
 * @param db FMDB的数据库对象
 * @return YES=成功，NO=失败
 */
- (BOOL)onCreate:(FMDatabase *)db {
    return YES;
}

/**
 * 数据库版本相等时的方法。子类可以覆盖该方法，实现数据库版本相等时的代码
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onEqual:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion {
    return YES;
}

/**
 * 数据库版本增加时的方法。子类需要覆盖该方法，实现数据库版本增加时的代码
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onUpgrade:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion {
    return YES;
}

/**
 * 数据库版本降级时的方法。子类可以覆盖该方法，实现数据库版本降级时的代码
 *
 * @param db FMDB的数据库对象
 * @param oldVersion 当期数据库的版本
 * @param newVersion 要更新的新的数据库的版本
 * @return YES=成功，NO=失败
 */
- (BOOL)onDowngrade:(FMDatabase *)db oldVersion:(NSInteger)oldVersion newVersion:(NSInteger)newVersion {
    return YES;
}

/**
 * 数据库配置检查完成后会调用的方法。子类可以覆盖该方法，实现数据库版本升级后的一些后续数据处理。
 *
 * @param db FMDB的数据库对象
 * @param dbCheckIsSuccess 数据库配置检查是否成功了
 */
- (void)didChecked:(FMDatabase *)db dbCheckIsSuccess:(BOOL)dbCheckIsSuccess
{
    
}

@end































