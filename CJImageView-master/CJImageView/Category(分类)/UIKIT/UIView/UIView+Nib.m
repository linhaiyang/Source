//
//  UIView+Nib.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIView+Nib.h"
const NSString *UIView_AlertWindow = @"alertWindow";
@implementation UIView (Nib)

+ (instancetype)loadNib{
    UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    return view;
}
- (UIWindow *)alertWindow{
    UIWindow *_alertWindow = objc_getAssociatedObject(self, &UIView_AlertWindow);
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.backgroundColor = [ UIColor clearColor];
//        _alertWindow.rootViewController = self;
        _alertWindow.windowLevel = UIWindowLevelNormal;
        objc_setAssociatedObject(self, &UIView_AlertWindow, _alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _alertWindow;
}
@end
