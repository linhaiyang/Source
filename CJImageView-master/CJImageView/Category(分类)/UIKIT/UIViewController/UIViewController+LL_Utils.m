//
//  UIViewController+LL_Utils.m
//
//  Copyright (c) 2018 LLBaseFoundation Software Foundation (https://github.com/HDB-Li/UIViewController)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UIViewController+LL_Utils.h"
#import <objc/runtime.h>

static const char *LL_automaticallySetModalPresentationStyleKey;

@implementation UIViewController (LL_Utils)

+ (void)load {
//    Method originAddObserverMethod = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
//    Method swizzledAddObserverMethod = class_getInstanceMethod(self, @selector(LL_presentViewController:animated:completion:));
//    method_exchangeImplementations(originAddObserverMethod, swizzledAddObserverMethod);
}

- (void)setLL_automaticallySetModalPresentationStyle:(BOOL)LL_automaticallySetModalPresentationStyle {
    objc_setAssociatedObject(self, @selector(LL_automaticallySetModalPresentationStyle), @(LL_automaticallySetModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
    /**
     其实可以使用静态指针 static void * 类型的参数来代替，不过在这里，笔者强烈推荐使用 @selector(LL_automaticallySetModalPresentationStyle) 作为 key 传入。因为这种方法省略了声明参数的代码，并且能很好地保证 key 的唯一性。
     */
}

- (BOOL)LL_automaticallySetModalPresentationStyle {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return [obj boolValue];
    }
    return [self.class LL_automaticallySetModalPresentationStyle];
}

+ (BOOL)LL_automaticallySetModalPresentationStyle {
    
    if ([self isKindOfClass:[UIImagePickerController class]] || [self isKindOfClass:[UIAlertController class]]) {
        return NO;
    }
    return YES;
}

- (void)LL_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
//        if (viewControllerToPresent.LL_automaticallySetModalPresentationStyle) {//设置--弹出试图---的弹出方式
//            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self LL_presentViewController:viewControllerToPresent animated:flag completion:completion];
        });
        
    } else {
        // Fallback on earlier versions
        dispatch_async(dispatch_get_main_queue(), ^{
            [self LL_presentViewController:viewControllerToPresent animated:flag completion:completion];
        });
    }
}

@end
