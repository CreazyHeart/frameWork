//
//  IHFCheckTokenActiveMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/19.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSCheckTokenActiveMgr : NSObject


+ (SSCheckTokenActiveMgr*)sharedInstance;



//开始检测
- (void)startCheckToken;

//停止检测
- (void)stopCheckToken;


@end
