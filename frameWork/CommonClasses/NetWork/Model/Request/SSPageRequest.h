//
//  VIEUserIdRequest.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//



#import "SSUserIdRequest.h"


/*
 * 网络请求，分页请求数据
 */

@interface SSPageRequest : SSUserIdRequest

//每页请求的数量
@property (nonatomic, assign) NSInteger pageSize;

//请求的第几页
@property (nonatomic, assign) NSInteger pageIndex;


@end
