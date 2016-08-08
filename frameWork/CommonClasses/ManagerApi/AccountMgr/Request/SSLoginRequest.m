//
//  IHFLoginRequest.m
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSLoginRequest.h"

@implementation SSLoginRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.requestType = NetWork_Request_Type_GET;
        self.requestWebApi = @"";
        
    }
    return self;
}



@end
