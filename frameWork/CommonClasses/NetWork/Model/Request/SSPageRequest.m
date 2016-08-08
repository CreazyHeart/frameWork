//
//  VIEUserIdRequest.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSPageRequest.h"

@implementation SSPageRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.pageIndex = 1;
        self.pageSize = 15;
    }
    return self;
}

@end
