//
//  VIE_ErrorCode.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SS_ErrorCode.h"
#import <UIKit/UIKit.h>

@implementation SS_ErrorCode


- (id)init
{
    self = [super init];
    
    return  self;
}

+ (void)showErrorMsg:(NSString*)errorCode message:(NSString*)message
{
    NSString *msg = [self paraErrorCode:errorCode message:message];
    
#if 0
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
#else
    
//    [MBProgressHUD message:msg];
    NSLog(@"%@",msg);
    
#endif
    
}

+ (NSString*)paraErrorCode:(NSString*)errorCode message:(NSString*)message
{
    NSString *msg = @"";
    if ([errorCode isEqualToString:@"-2"]) {
        msg = @"配置不存在";
    }
    else if ([errorCode isEqualToString:@"-1"]) {
        msg = @"参数不合法";
    }
    else if ([errorCode isEqualToString:@"-9999"]) {
        msg = @"网络不给力,请稍后再试";
    }
    else
    {
        //message = @"网络异常,请稍后再试";
        if (!message || [message isEqualToString:@""]) {
            msg = @"网络不给力,请稍后再试";
        }
        else
        {
            msg = message;
        }
    }
    
    return msg;
}

@end







