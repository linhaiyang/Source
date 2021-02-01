//
//  AppDelegate.m
//  CJImageView
//
//  Created by C.K.Lian on 15/12/30.
//  Copyright © 2015年 C.K.Lian. All rights reserved.
//

#import "AppDelegate.h"

#if __has_include(<Bugly/Bugly.h>)
#import <Bugly/Bugly.h>
#endif
#import "BaseNavigationController.h"
#import "SYSafeCategory.h"
#import "MainTabBarController.h"
#import "AppDelegate+AppService.h"

#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#import "CacheCleanerPlugin.h"
#import "RetainCycleLoggerPlugin.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate
{
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
    FBMemoryProfiler *memoryProfiler;
#endif
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
//    [self addFBMemoryProfiler:memoryProfiler];
    NSArray *filters = @[FBFilterBlockWithObjectIvarRelation([UIView class], @"_subviewCache"),
                         FBFilterBlockWithObjectIvarRelation([UIPanGestureRecognizer class], @"_internalActiveTouches")];
    
    FBObjectGraphConfiguration *configuration =
    [[FBObjectGraphConfiguration alloc] initWithFilterBlocks:filters
                                         shouldInspectTimers:NO];
    
    memoryProfiler = [[FBMemoryProfiler alloc] initWithPlugins:@[[CacheCleanerPlugin new],
                                                                  [RetainCycleLoggerPlugin new]]
                               retainCycleDetectorConfiguration:configuration];
    [memoryProfiler enable];
#endif
#if __has_include(<Bugly/Bugly.h>)
    [Bugly startWithAppId:@"e8b5d2256e"];
#endif
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
    [self registKeyBoradManager];
    
    
    
    return YES;
}
-(void)initRootViewController{
    MainTabBarController*mainTabBar = [MainTabBarController new];
    //UIViewAnimationTransition
    CATransition *anima = [CATransition animation];//CATransaction事务 Transition过渡
    /**The name of the transition. Current legal transition types include
     * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
    anima.type =kCATransitionMoveIn;// @"cube" 设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.3f;
    anima.removedOnCompletion = true;
    self.window.rootViewController = mainTabBar;
    [[[UIApplication sharedApplication] delegate].window.layer addAnimation:anima forKey:@"revealAnimation"];
}

/**
 CA_EXTERN CATransitionType const kCATransitionFade
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
 CA_EXTERN CATransitionType const kCATransitionMoveIn
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
 CA_EXTERN CATransitionType const kCATransitionPush
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
 CA_EXTERN CATransitionType const kCATransitionReveal
 
 */


@end
