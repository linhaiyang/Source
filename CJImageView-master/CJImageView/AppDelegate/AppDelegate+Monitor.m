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
   //进入后台
    
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
@end
