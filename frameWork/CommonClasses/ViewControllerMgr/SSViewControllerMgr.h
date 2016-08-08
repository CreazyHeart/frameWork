//
//  VIEViewControllerMgr.h
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SSViewControllerMgr : NSObject

//导航控制器
@property (nonatomic, strong) UINavigationController *mainNavController;



+ (SSViewControllerMgr*)sharedInstance;

/**
 *  创建窗口的根视图控制器
 */
- (UIViewController*)creatRootViewControl;

- (UIViewController *)creatMainViewController;


@end
