//
//  VIENetWorkModel.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSNetWorkRequest.h"

@implementation SSNetWorkRequest

- (id)init
{
    self = [super init];
    
    if (self) {
        
        //requestWebApi , requestType 可在子类中重新进行负值
        
        //请求接口
        self.requestWebApi = @"";
        
        //暂时给一个默认值
        self.requestType = NetWork_Request_Type_GET;
        
        //请求 token
        self.access_token = @"";
        
        
        /*
        //手机类型  子类中一般不做修改
        self.phoneType = @"iOS";
        
        //是否正在加载（yes:正在加载 ）
        self.isLoading = NO;
        */
        
    }
    
    return self;
}


- (NSMutableDictionary*)dicParamsIgnoredKeys
{
    //过滤掉的参数
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",nil];
    NSMutableDictionary *dicParams = [self mj_keyValuesWithIgnoredKeys:ignoreds];
    
    return dicParams;
}


@end











