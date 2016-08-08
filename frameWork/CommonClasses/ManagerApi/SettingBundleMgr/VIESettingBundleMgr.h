//
//  IHFSettingBundleMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/4/27.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VIESettingBundleMgr : NSObject

+ (VIESettingBundleMgr*)sharedInstance;



//初始化 ip 地址 和 端口号
+ (void)registerSettingsBundle_To_UserDefault;


@end























