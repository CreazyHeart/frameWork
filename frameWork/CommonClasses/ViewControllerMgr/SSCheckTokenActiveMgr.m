//
//  IHFCheckTokenActiveMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/19.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSCheckTokenActiveMgr.h"
//
#import "SSAcountMgr.h"
#import "SSViewControllerMgr.h"



@interface SSCheckTokenActiveMgr()<UIAlertViewDelegate>

//检测 token 是否有效的定时器
@property (nonatomic, strong) NSTimer *checkTokenTimer;

@end



@implementation SSCheckTokenActiveMgr


+ (SSCheckTokenActiveMgr*)sharedInstance
{
    static SSCheckTokenActiveMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSCheckTokenActiveMgr alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)dealloc{
    
}


//开始检测
- (void)startCheckToken
{
    //停止检测
    [self stopCheckToken];
    
    
    //10 分钟检查一次
    NSTimeInterval times = 5 * 60;
    //times = 5;
    self.checkTokenTimer = [NSTimer timerWithTimeInterval:times target:self selector:@selector(checkTokenActive:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.checkTokenTimer forMode:NSRunLoopCommonModes];
    [self.checkTokenTimer fire];
    
}
//停止检测
- (void)stopCheckToken
{
    if (self.checkTokenTimer) {
        [self.checkTokenTimer invalidate];
        self.checkTokenTimer = nil;
    }
}
- (void)checkTokenActive:(NSTimer*)sender
{
    NSLog(@"checkTokenActive...\n");
    
    NSDate *lastLoginTime = [[SSAcountMgr sharedInstance] loginTime];
    if (!lastLoginTime) {
        return;
    }
    
    
    NSTimeInterval  timeInterval = [lastLoginTime timeIntervalSinceNow];
    timeInterval = -timeInterval;
    
    //超时时间
    NSTimeInterval times = 40*60;
    //times = 20;
    if (timeInterval>times) {

        //删除登录的时间
        [[SSAcountMgr sharedInstance] deletLoginTime];
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失效，请重新登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[SSViewControllerMgr sharedInstance].mainNavController popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:sure];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}




@end




























