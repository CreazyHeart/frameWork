//
//  IHFGetCharacterChildValueRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/6.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface SSGetCharacterChildValueRequest : SSNetWorkRequest
/**
 *  字段
 */
@property (copy, nonatomic) NSString *field;
/**
 *  当前节点代号
 */
@property (copy, nonatomic) NSString *fCode;


@end
