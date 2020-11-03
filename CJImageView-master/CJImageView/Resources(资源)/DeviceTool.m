//
//  DeviceTool.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DeviceTool.h"
//#import "AppDelegate.h"
@implementation DeviceTool
+(BOOL)isIPhoneX{
    if (@available(iOS 11.0, *)) {
        if ([UIApplication sharedApplication].keyWindow.safeAreaInsets.top >= 34.0||[UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom >= 34.0||[UIApplication sharedApplication].keyWindow.safeAreaInsets.right >= 34.0||[UIApplication sharedApplication].keyWindow.safeAreaInsets.left >= 34.0) {
            return true;
        }
    }
    return false;
}
+(CGFloat )statusBarHeight{
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
    }
    return 20.f;
}

+(CGFloat )NavBarHeight{
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44;
    }
    return 64.f;
}

+(CGFloat )safeBottomHeight{
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    return 0.f;
}
@end
