//
//  AppDelegate+AppService.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import <IQKeyboardManager/KeyboardManager.h>
@implementation AppDelegate (AppService)



#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
//    self.window.rootViewController = 
//    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
//    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
//    if (@available(iOS 11.0, *)){
//        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
//    }
}

-(void)registKeyBoradManager{
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = true;//Resigns Keyboard on touching outside of UITextField/View.
}
@end
