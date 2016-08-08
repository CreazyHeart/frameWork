//
//  IHFRuleSearchRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface IHFRuleSearchRequest : SSNetWorkRequest
@property (copy, nonatomic) NSString *field;
@property (copy, nonatomic) NSString *search;


@end
