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
    return [self statusBarHeight]>20;
}
+(CGFloat )statusBarHeight{
    static CGFloat statusHeight;
    if (statusHeight == 0.f) {
        statusHeight= 20.f;
        if (@available(iOS 11.0, *)) {
            statusHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
        }
    }
    return statusHeight;
}

+(CGFloat )NavBarHeight{
    return [self statusBarHeight] + 44;
}

+(CGFloat )safeBottomHeight{
    static CGFloat safeBottomHeight;
    if (safeBottomHeight == 0.f) {
        safeBottomHeight = 0.f;
        if (@available(iOS 11.0, *)) {
            safeBottomHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
        }
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
