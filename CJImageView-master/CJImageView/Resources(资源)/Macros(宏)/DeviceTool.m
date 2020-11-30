//
//  DeviceTool.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DeviceTool.h"
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
    static CGFloat statusHeight;
    if (statusHeight == 0.f) {
        if (@available(iOS 11.0, *)) {
            statusHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
        }
        statusHeight= 20.f;
    }
    return statusHeight;
}

+(CGFloat )NavBarHeight{
    static CGFloat navBarHeight;
    if (navBarHeight == 0.f) {
        if (@available(iOS 11.0, *)) {
            navBarHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44;
        }
        navBarHeight =  64.f;
    }
    return navBarHeight;
}

+(CGFloat )safeBottomHeight{
    static CGFloat safeBottomHeight;
    if (safeBottomHeight == 0.f) {
        if (@available(iOS 11.0, *)) {
            safeBottomHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
        }
        return 0.f;
    }
    return safeBottomHeight;
}

+(CGFloat)screen_Height{
    static  CGFloat screenHeight;
    if (screenHeight == 0.f) {
        screenHeight = [UIScreen mainScreen].bounds.size.height;
    }
    return screenHeight;
}
+(CGFloat)screen_Width{
    static CGFloat screenWidth;
    if (screenWidth == 0.f) {
        screenWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return screenWidth;
}
@end
