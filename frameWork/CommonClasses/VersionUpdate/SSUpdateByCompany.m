//
//  IHFUpdateByCompany.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#import "SSUpdateByCompany.h"

@implementation SSUpdateByCompany


//检查更新
-(void)checkVersion:(BOOL)isMusteUpdate url:(NSString*)url
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    //version
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"currentVersion : %@",currentVersion);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    NSError *err;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:recervedData options:NSJSONReadingMutableLeaves error:&err];
    NSMutableDictionary *resultDic = [NSMutableDictionary dictionaryWithDictionary:result];
    
    NSArray *infoArray = [resultDic objectForKey:@"results"];
    if (infoArray.count>0)
    {
        NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
        NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithDictionary:releaseInfo];
        NSString *appStoreVersion = [infoDic objectForKey:@"version"];
        NSLog(@"appStoreVersion : %@",appStoreVersion);
        
        //下载地址
        //NSString *downLoadUrl = [infoDic objectForKey:@"trackViewUrl"];
        //更新的提示信息
        NSString *releaseNotes = [releaseInfo objectForKey:@"releaseNotes"];
        if (!releaseNotes) {
            releaseNotes = @"";
        }
        
//        BOOL isBigger = [self isVersion:appStoreVersion biggerThanVersion:currentVersion];
//        if (isBigger)//检测到新版本
//        {
//            if (isMusteUpdate)
//            {
//                releaseNotes = [NSString stringWithFormat:@"亲，版本过低必须更新才能使用。\n%@",releaseNotes];
//            }
//            //显示更新页面
//            //[self showUpdateView:releaseNotes isMustUpdate:isMusteUpdate];
//        }
        
    }
}



@end





















