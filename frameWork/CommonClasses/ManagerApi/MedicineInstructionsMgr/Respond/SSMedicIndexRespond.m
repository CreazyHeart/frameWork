//
//  IHFMedicIndexRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/4/20.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSMedicIndexRespond.h"


@implementation SSMedicIndexRespond

+(NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"classes"    : [SSMedicIndexClassRespond class],
             @"bases"      : [SSMedicIndexBaseRespond class]
             };
}

@end
