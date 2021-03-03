//
//  DeviceTool.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/30.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DeviceTool.h"

CGFloat YYScreenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}
CGFloat statusBarHeight(){
    static CGFloat statusHeight= 20.f;;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            statusHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
        }
    });
    return statusHeight;
}
CGFloat safeBottomHeight(){
    static CGFloat safeBottomHeight= 0.f;;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            safeBottomHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
        }
    });
    return safeBottomHeight;
}

CGFloat KScreen_Height(){
    static CGFloat screenHeight= 0.f;;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenHeight = [UIScreen mainScreen].bounds.size.height;
    });
    return screenHeight;
   
}
CGFloat KScreen_Width(){
    static CGFloat screenWidth= 0.f;;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenWidth = [UIScreen mainScreen].bounds.size.width;
    });
    return screenWidth;
}




@implementation GlobalManager

+(instancetype)shareManager{
    GlobalManager * manager = [[GlobalManager alloc] init];
    manager.lock = dispatch_semaphore_create(1);
    return manager;
}
@end
