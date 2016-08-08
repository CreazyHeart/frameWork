//
//  VIEUpdateByCompany.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface SSUpdateByCompany : NSObject

//检查更新 检测最新的版本和当前版本的差距 ，然后更行客户端版本
-(void)checkVersion:(BOOL)isMusteUpdate url:(NSString*)url;



@end








