//
//  VIENetWorkMgr.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSNetWorkMgr.h"
#import <AFNetworking/AFNetworking.h>

@implementation SSNetWorkMgr


+ (SSNetWorkMgr*)sharedInstance
{
    static SSNetWorkMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建当前单例
        instance = [[SSNetWorkMgr alloc] init];
    });
    
    return instance;
}


#pragma mark - 网络请求，包含 “GET” 和 "POST" 方法
/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param method        网络请求类型：“GET”，"POST"
 * @param urlString     网络请求 URL
 * @param dicParams     网络请求的参数
 */
- (void)requestAsynchronous:(NSString*)method urlString:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(ihfSuccessBlock)success failure:(ihfFailureBlock)failure;
{
    NSString *strUrl = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    if ([method isEqualToString:NetWork_Request_Type_GET]) {
        [self get:strUrl dicParams:dicParams success:success failure:failure];
    }
    else if ([method isEqualToString:NetWork_Request_Type_POST]) {
        [self post:strUrl dicParams:dicParams success:success failure:failure];
    }else if ([method isEqualToString:NetWork_Request_Type_DELET]) {
         [self delet:strUrl dicParams:dicParams success:success failure:failure];
    
    }
}

#pragma mark - GET
- (void)get:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(ihfSuccessBlock)success failure:(ihfFailureBlock)failure
{
    
    NSMutableDictionary *newDicParams = [[NSMutableDictionary alloc] initWithDictionary:dicParams];
    
    //判断是否有 token，过滤 token
    NSString *token = dicParams[NetWork_Request_Token];
    if (token && token.length>0) {
        [newDicParams removeObjectForKey:NetWork_Request_Token];
    }
    
    AFHTTPSessionManager *sessionMgr = [self creatSesionMgr:token];
    
    __weak __typeof(&*self)weakSelf = self;
    [sessionMgr GET:urlString parameters:newDicParams progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf callSuccess:task responseObject:responseObject success:success];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf callFailure:task error:error failure:failure];
        
    }];
    
}

#pragma mark - POST
- (void)post:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(ihfSuccessBlock)success failure:(ihfFailureBlock)failure;
{
    NSMutableDictionary *newDicParams = [[NSMutableDictionary alloc] initWithDictionary:dicParams];
    
    //判断是否有 token，过滤 token
    NSString *token = dicParams[NetWork_Request_Token];
    if (token && token.length>0) {
        [newDicParams removeObjectForKey:NetWork_Request_Token];
    }
    
    AFHTTPSessionManager *sessionMgr = [self creatSesionMgr:token];

    __weak __typeof(&*self)weakSelf = self;
    [sessionMgr POST:urlString parameters:newDicParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf callSuccess:task responseObject:responseObject success:success];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf callFailure:task error:error failure:failure];
        
    }];
    
}
#pragma mark - DELET
- (void)delet:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(ihfSuccessBlock)success failure:(ihfFailureBlock)failure;
{
    NSMutableDictionary *newDicParams = [[NSMutableDictionary alloc] initWithDictionary:dicParams];
    
    //判断是否有 token，过滤 token
    NSString *token = dicParams[NetWork_Request_Token];
    if (token && token.length>0) {
        [newDicParams removeObjectForKey:NetWork_Request_Token];
    }
    
    AFHTTPSessionManager *sessionMgr = [self creatSesionMgr:token];
    __weak __typeof(&*self)weakSelf = self;
    
    [sessionMgr DELETE:urlString parameters:newDicParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakSelf callSuccess:task responseObject:responseObject success:success];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf callFailure:task error:error failure:failure];
    }];
}

#pragma mark - 网络请求头的设定
- (AFHTTPSessionManager*)creatSesionMgr:(NSString*)token
{
    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
    
    //请求设置
    AFJSONRequestSerializer *request = [AFJSONRequestSerializer serializer];
    
    //设置 token
    if (token && token.length>0) {
        [request setValue:token forHTTPHeaderField:NetWork_Request_Token];
    }
    
    //设置超时 时间
    request.timeoutInterval = NetWork_Request_TimeoutInterval;
    
    //返回设置
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    
    
    //如果报接受类型不一致请替换一致text/html或别的 (一般情况可不用添加)
    //response.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //response.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", nil];
    
    //
    sessionMgr.requestSerializer = request;
    sessionMgr.responseSerializer = response;
    
    return sessionMgr;
}

#pragma mark - 网络回调
- (void)callSuccess:(NSURLSessionDataTask*)task responseObject:(id)responseObject success:(ihfSuccessBlock)success
{
    //根据status code的不同，做相应的处理
    NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
    NSInteger statusCode = response.statusCode;
    
    if (success) {
        success(statusCode, responseObject);
    }
}
- (void)callFailure:(NSURLSessionDataTask*)task error:(NSError*)error failure:(ihfFailureBlock)failure
{
    //根据status code的不同，做相应的处理
    NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
    NSInteger statusCode = response.statusCode;
    
    NSString *localizedDescription = [error localizedDescription];
    NSLog(@"IHFNetWorkMgr request error : %@\n", localizedDescription);
    
    //NSString *str = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSString *errorStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"errorStr : \n%@", errorStr);
    
    if (failure) {
        failure(statusCode, localizedDescription, errorStr);
    }
    
}


@end








