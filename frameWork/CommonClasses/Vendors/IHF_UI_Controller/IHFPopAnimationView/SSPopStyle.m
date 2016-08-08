//
//  BIDPopStyle.m
//  CommunityHD
//
//  Created by ihefelocal001 on 16/3/30.
//  Copyright © 2016年 ihefe. All rights reserved.
//

#import "SSPopStyle.h"

@implementation SSPopStyle

- (id)init
{
    self = [super init];
    if (self) {
        self.presentAnimation = PopAnimation_Transform;
        self.dismissAnimation = PopAnimation_Null;
        self.alignmentType = PopAlignmentType_Center;
    
        self.duration = 0.5f;
        
        self.isCancel = YES;
    }
    return self;
}



@end
