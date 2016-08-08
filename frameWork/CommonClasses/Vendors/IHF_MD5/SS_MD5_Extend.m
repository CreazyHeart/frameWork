//
//  IHF_MD5_Extend.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/4/19.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SS_MD5_Extend.h"
#import <CommonCrypto/CommonDigest.h>


@implementation SS_MD5_Extend

//32位md5加密
+ (NSString*)md5_String_32Bit:(NSString*)srcString
{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}




@end
