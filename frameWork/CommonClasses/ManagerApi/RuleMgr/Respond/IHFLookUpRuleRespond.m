//
//  IHFLookUpRuleRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/5/9.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFLookUpRuleRespond.h"

@implementation IHFLookUpRuleRespond

+ (NSDictionary *)mj_replacedKeyFromPropertyName {

    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray {

    return @{@"contents" : [IHFLookUpRuleContentsRespond class]};
}

@end
