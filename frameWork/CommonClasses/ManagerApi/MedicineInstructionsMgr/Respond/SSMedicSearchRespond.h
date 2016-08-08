//
//  IHFMedicSearchRespond.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/25.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkModel.h"

@interface SSMedicSearchRespond : SSNetWorkModel
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *dg_name;
@property (copy, nonatomic) NSString *dg_code;

@end
