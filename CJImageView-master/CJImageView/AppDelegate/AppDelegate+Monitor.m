//
//  AppDelegate+Monitor.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/18.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "AppDelegate+Monitor.h"

@implementation AppDelegate (Monitor)
// 在AppDelete实现该方法
- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    goingToQuit = YES;
    static NSTimer * timer;
    UIApplication* app = [UIApplication sharedApplication];
    UIBackgroundTaskIdentifier __block bgTask;//设置后台任务ID
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{//开始申请一些额外的时间来处理任务，延迟系统挂起你的应用
//      退到后台后30秒进入
      [app endBackgroundTask:bgTask];//告诉系统，任务完成了，可以挂起APP了
      bgTask = UIBackgroundTaskInvalid;
    }];
    //如果系统给的剩余时间小于60秒 就终止当前的后台任务，再重新初始化一个后台任务，重新让系统分配时间，这样一直循环下去，保持APP在后台一直处于active状态。
    timer = [NSTimer scheduledTimerWithTimeInterval:25.0f repeats:true block:^(NSTimer * _Nonnull timer) {
//        NSTimeInterval timerInter = [UIApplication sharedApplication].backgroundTimeRemaining;
        if ([UIApplication sharedApplication].backgroundTimeRemaining < 25){
            [[UIApplication sharedApplication] endBackgroundTask:bgTask];
            bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
                    [[UIApplication sharedApplication] endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }];
        }
    }];
    [timer fire];
}
- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // app从后台进入前台都会调用这个方法
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // app启动或者app从后台进入前台都会调用这个方法
}
// 当你的程序将要被挂起，会调用改方法
- (void)applicationWillResignActive:(UIApplication *)application {

    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    [self.manager startUpdatingLocation];
}
@end
