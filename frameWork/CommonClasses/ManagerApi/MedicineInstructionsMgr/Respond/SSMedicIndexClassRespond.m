//
//  IHFMedicIndexClassesRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/4/29.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSMedicIndexClassRespond.h"

@implementation SSMedicIndexClassRespond

+ (NSDictionary *)replacedKeyFromPropertyName

{
    
    return @{@"ID" : @"id"};
    
}

+(NSDictionary *)mj_objectClassInArray {
    
    return @{@"childs":[SSMedicIndexClassRespond class]};
}


@end
