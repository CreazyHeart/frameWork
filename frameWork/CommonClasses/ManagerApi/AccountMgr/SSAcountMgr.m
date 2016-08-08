//
//  IHFAcountMgr.m
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSAcountMgr.h"
//#import "IHFCheckTokenActiveMgr.h"

@implementation SSAcountMgr

+ (SSAcountMgr*)sharedInstance
{
    static SSAcountMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSAcountMgr alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        //加载本地用户数据
        [self loadLocalUserInfo];
    }
    return self;
}

//临时获取token接口
- (void)tmpToken:(SSLoginRequest*)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    NSDictionary *dicParams = @{
                           @"username":@"2224",
                           @"pwd":@"670b14728ad9902aecba32e22fa4f6bd"
                           };
    
    __weak __typeof(&*self)weakSelf = self;
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        if (!weakSelf.account) {
            weakSelf.account = [[SSAcountRespond alloc] init];
        }
        weakSelf.account.access_token = [respond objectForKey:@"token"];
        if (success) {
            success(weakSelf.account);
        }
        
    } failure:failure];
}

//登陆
- (void)login:(SSLoginRequest*)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    

#if 0
    NSString *urlString = @"http://192.168.20.121:8080/hospital/base/checkLogin";
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = @{
                           @"hospitalID":@"1",
                           @"doctor_code":@"161",
                           @"password":@"123456"
                           };
    
#endif
    
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",@"enterprise_id",@"subsys_type",@"device",@"place",@"access_token",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    __weak __typeof(&*self)weakSelf = self;
    [SSNetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        //保存登录时间
        [self saveLoginTime];
        
        SSNetWorkMsg *message = [SSNetWorkMsg mj_objectWithKeyValues:respond];
        
        weakSelf.account = [[SSAcountRespond alloc] init];
        if (message.reasons.count>0) {
            SSNetWorkMsgReason *reason = message.reasons[0];
            weakSelf.account.access_token = reason.message;
        }

        if (success) {
            success(weakSelf.account);
        }
        
    } failure:failure];
    
    
}


#pragma mark -
//保存用户数据到本地
-(void)saveLocalUserInfo:(SSAcountRespond*)account
{
    
#if 1

    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/account.data"];
    // Encoding
    BOOL bResult = [NSKeyedArchiver archiveRootObject:account toFile:file];
    if (bResult) {
        NSLog(@"account.data 归档成功");
    }
    else {
        NSLog(@"account.data 归档失败");
    }
#else
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray* arrayAccount = [[NSMutableArray alloc] init];
    [arrayAccount addObject:account];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:arrayAccount] forKey:@"UserKey_Account"];
#endif
    
}
//加载本地用户数据
-(void)loadLocalUserInfo
{
#if 1
    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/account.data"];
    // Decoding
    self.account = [NSKeyedUnarchiver unarchiveObjectWithFile:file];

#else
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSData * dataAccounts = [defaults objectForKey:@"UserKey_Account"];
    NSMutableArray* arrayAccount = nil;
    if (dataAccounts)
    {
        arrayAccount = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:dataAccounts]];
        
        if (arrayAccount && [arrayAccount count] > 0)
        {
            self.account = [arrayAccount objectAtIndex:0];
        }
    }
#endif
}


#pragma mark - 
//保存登录时间
- (void)saveLoginTime
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"lastLoginTimeKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//获取登录时间
- (NSDate*)loginTime
{
    NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastLoginTimeKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return date;
}

//删除登录的时间
- (void)deletLoginTime
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"lastLoginTimeKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark -
//记录 选择 的主页面
- (void)saveSelectedMainView:(NSString*)index
{
    [[NSUserDefaults standardUserDefaults] setObject:index forKey:@"SelectedManiViewForKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//获取 选择 的主页面
- (NSString*)selectedMainView
{
    NSString *index = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedManiViewForKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return index;
}



@end

























