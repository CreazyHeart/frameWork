//
//  VIEViewControllerMgr.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "SSViewControllerMgr.h"
#import "SSViewController.h"

@interface SSViewControllerMgr ()





@end


@implementation SSViewControllerMgr


+ (SSViewControllerMgr *)sharedInstance
{
    static SSViewControllerMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SSViewControllerMgr alloc] init];
    });
    return instance;
}

//创建根试图
- (UIViewController*)creatRootViewControl
{
//    self.loginViewContrl = [[VIEChooseLoginRegisterController alloc] init];
//    self.mainNavController = [[UINavigationController alloc] initWithRootViewController:self.loginViewContrl];
//    //不带有自带的滑动返回
//    self.mainNavController.navigationBarHidden = YES;
    //带有自带的滑动返回
//    self.mainNavController.navigationBar.hidden = YES;
    
    SSViewController *VC = [[SSViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    self.mainNavController = nav;
    
    
#if 1
    return self.mainNavController;
#else
//#warning 根据本地是否缓存有用户信息，创建不同的窗口的根视图控制器
    
   return  [self creatMainViewController];
#endif
}


- (UIViewController *)creatMainViewController {
//
//    VIEMainViewController *mainVC = [[VIEMainViewController alloc] init];
//    self.mainNavController = [[UINavigationController alloc] initWithRootViewController:mainVC];
//    self.mainNavController.navigationBar.hidden = YES;
//    
//    VIELeftViewController *leftVC = [[VIELeftViewController alloc] init];
//    self.LeftSlideVC = [[VIELeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainNavController];
//    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
//    
//    return self.LeftSlideVC;
//
    return nil;
}





@end
