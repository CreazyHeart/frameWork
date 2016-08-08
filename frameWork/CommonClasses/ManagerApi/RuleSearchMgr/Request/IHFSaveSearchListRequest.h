//
//  IHFSaveSearchListRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface IHFSaveSearchListRequest : SSNetWorkRequest
@property (copy, nonatomic) NSString *slContent;
@property (copy, nonatomic) NSString *slSearchUser;

@end
