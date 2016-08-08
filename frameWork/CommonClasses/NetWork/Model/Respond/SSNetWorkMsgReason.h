//
//  VIENetWorkModel.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface SSNetWorkMsgReason : SSNetWorkModel


//错误码
@property (nonatomic, copy) NSString *code;

//错误信息
@property (nonatomic, copy) NSString *message;



@end
