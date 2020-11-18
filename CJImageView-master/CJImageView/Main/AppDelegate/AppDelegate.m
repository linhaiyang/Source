//
//  AppDelegate.m
//  CJImageView
//
//  Created by C.K.Lian on 15/12/30.
//  Copyright © 2015年 C.K.Lian. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#import "BaseNavigationController.h"
#import "ViewController.h"
#import "SYSafeCategory.h"
#import "MainTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Bugly startWithAppId:@"e8b5d2256e"];
    
    //统一处理一些为数组、集合等对nil插入会引起闪退
    [SYSafeCategory callSafeCategory];
    
    Dlog(@"didFinishLaunchingWithOptions");
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 显示欢迎页(新版本时显示)或者广告页 (主页在这里面加载, 节省启动时间)
//    BaseNavigationController *vc = [[BaseNavigationController alloc]initWithRootViewController:[ViewController new]];
//    self.window.rootViewController = vc;
    [self initRootViewController];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)initRootViewController{
    MainTabBarController*mainTabBar = [MainTabBarController new];
    //UIViewAnimationTransition
    CATransition *anima = [CATransition animation];//CATransaction事务 Transition过渡
    /**The name of the transition. Current legal transition types include
     * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
    anima.type =@"cube";// @"cube" 设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.3f;
    anima.removedOnCompletion = true;
    self.window.rootViewController = mainTabBar;
    [[[UIApplication sharedApplication] delegate].window.layer addAnimation:anima forKey:@"revealAnimation"];
}
@end
