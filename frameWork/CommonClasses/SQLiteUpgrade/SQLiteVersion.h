//
//  SQLiteVersion.h
//
//  Voice
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#ifndef SQLiteVersion_h
#define SQLiteVersion_h


/// 本地主数据库名称
#define LOCAL_MAIN_DB_NAME      @"ihefeDB.sqlite"

///Database的第一个版本号为1。
#define SQLiteVersion_FIRST  1



/*
 备注：
 DB走DB的版本号，App走App的版本号，互不冲突，互不影响，这里备注只是记录而已。
 dbVersion=1，appVersion=1.0：创建第一版数据库。
 dbVersion=2，appVersion=2.3：XXX。
 dbVersion=3，appVersion=2.4：XXX。
 */

typedef NS_ENUM(NSInteger, SQLiteVersion) {
    
    SQLiteVersion_Null = SQLiteVersion_FIRST-1,
    SQLiteVersion_V1,
    SQLiteVersion_V2,
    SQLiteVersion_New
    
};



#endif /* SQLiteVersion_h */
