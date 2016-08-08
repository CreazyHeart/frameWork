//
//  VIE_ErrorCode.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SS_ErrorCode : NSObject



+ (void)showErrorMsg:(NSString*)errorCode message:(NSString*)message;


+ (NSString*)paraErrorCode:(NSString*)errorCode message:(NSString*)message;


@end
