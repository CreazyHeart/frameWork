//
//  VIE_Tools.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#import "SS_Tools.h"

@implementation SS_Tools

/*
 * 生成随机的UUID
 */
+ (NSString*)uuidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    
    NSLog(@"\n 32位 uuid:%@ \n", uuid);
    return uuid;
}

//生成 8位 UUID
+ (NSString*)uuid_8Point
{
    NSArray *arr = @[@"a", @"b", @"c", @"d", @"e", @"f",
        @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s",
        @"t", @"u", @"v", @"w", @"x", @"y", @"z", @"0", @"1", @"2", @"3", @"4", @"5",
        @"6", @"7", @"8", @"9", @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I",
        @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V",
                      @"W", @"X", @"Y", @"Z"];
    
    //获取uuid并剔除“-”
    NSString *uuidString = [SS_Tools uuidString];
    uuidString = [uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    NSMutableString *uuid = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < 8; i++)
    {
        NSRange range;
        range.location = i*4;
        range.length = 4;
        NSString *str = [uuidString substringWithRange:range];
    
#if 0
        UInt64 result =  strtoul([str UTF8String], 0, 16);
#else
        unsigned long long result = 0;
        NSScanner *scanner = [NSScanner scannerWithString:str];
        [scanner scanHexLongLong:&result];
#endif

        [uuid appendString:arr[result % 0x3E]];
    }
    NSLog(@"\n 8位 uuid:%@ \n", uuid);
    return uuid;
}



//计算字符串的大小
+ (CGSize)calculateStringSize:(NSString*)text font:(UIFont*)font maxSize:(CGSize)maxSize mode:(NSLineBreakMode)mode
{
    CGSize newSize = CGSizeZero;
    if (!text || text.length==0) {
        return newSize;
    }
    
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion>7.0) {
        newSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    }
    else {
        newSize = [text sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode];
    }
    
    return newSize;
}

/*
 * 十六进制颜色值转换成UIColor对象
 */
+ (UIColor *)hexStringToColor: (NSString *) stringToConvert{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


/*
 *  使用UIColor创建UIImage
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end

































