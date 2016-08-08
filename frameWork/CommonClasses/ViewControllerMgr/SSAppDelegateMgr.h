//
//  VIEAppDelegateMgr.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSAppDelegateMgr : NSObject

+ (SSAppDelegateMgr*)sharedInstance;

//程序 启动时 加载数据 和 初始化
- (BOOL)loadData;
@end
