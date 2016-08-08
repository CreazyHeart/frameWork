//
//  IHFLookUpRuleContentsRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/5/9.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFLookUpRuleContentsRespond.h"

@implementation IHFLookUpRuleContentsRespond
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"childs" : [IHFLookUpRuleContentsRespond class]};
}

//拷贝一份自己
- (id)copySelf
{
    IHFLookUpRuleContentsRespond *tmpSelf = [[IHFLookUpRuleContentsRespond alloc] init];
    tmpSelf.ID = self.ID;
    tmpSelf.drsId = self.drsId;
    tmpSelf.pCode = self.pCode;
    tmpSelf.zCode = self.zCode;
    tmpSelf.field = self.field;
    tmpSelf.fieldName = self.fieldName;
    tmpSelf.dataFlag = self.dataFlag;
    tmpSelf.fieldValue = self.fieldValue;
    tmpSelf.fieldCode = self.fieldCode;
    
    if (self.childs && self.childs.count) {
        tmpSelf.childs = [[NSMutableArray alloc]init];
        [tmpSelf.childs addObjectsFromArray:self.childs];
    }
    
    tmpSelf.no = self.no;
    
    return tmpSelf;
}
@end
