//
//  IHFObtainHistorySearchListRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface IHFObtainHistorySearchListRespond : SSNetWorkModel
@property (copy, nonatomic) NSString *hospId;
@property (copy, nonatomic) NSString *slId;
@property (copy, nonatomic) NSString *slContent;
@property (assign, nonatomic) NSInteger slCount;
@property (copy, nonatomic) NSString *slSearchUser;





@end
