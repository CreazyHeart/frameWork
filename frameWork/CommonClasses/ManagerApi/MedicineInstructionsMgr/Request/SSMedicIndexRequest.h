//
//  IHFMedicIndexRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/20.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "SSNetWorkRequest.h"

@interface SSMedicIndexRequest : SSNetWorkRequest

@property (strong, nonatomic) NSNumber *page;
@property (strong, nonatomic) NSNumber *pageSize;
@property (strong, nonatomic) NSDictionary *params;

@end
