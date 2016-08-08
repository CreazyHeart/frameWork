//
//  IHFMedicSearchInstrRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface SSMedicSearchInstrRequest : SSNetWorkRequest

@property (strong, nonatomic) NSNumber *page;
@property (strong, nonatomic) NSNumber *pageSize;
@property (strong, nonatomic) NSDictionary *params;

@end
