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
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
