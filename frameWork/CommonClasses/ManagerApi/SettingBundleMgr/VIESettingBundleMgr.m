//
//  IHFSettingBundleMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/4/27.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIESettingBundleMgr.h"

@implementation VIESettingBundleMgr


+ (VIESettingBundleMgr*)sharedInstance
{
    static VIESettingBundleMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VIESettingBundleMgr alloc] init];
    });
    return instance;
}


//初始化 ip 地址 和 端口号
+ (void)registerSettingsBundle_To_UserDefault
{
    //NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *settingBundle = @"Settings";
//    if ([bundleIdentifier isEqualToString:@"com.ihefe.IHFmedicine.CN.SHA.Pulmonary"]) {
//        settingBundle = @"Settings.CN.SHA.Pulmonary";
//    }
//    else {
//        settingBundle = @"Settings";
//    }
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:settingBundle ofType:@"bundle"];
    NSLog(@"%@", settingsBundle);
    if(!settingsBundle) {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences) {
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key) {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
}


@end



























