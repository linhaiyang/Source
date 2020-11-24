//
//  UIViewController+Swizzle.m
//  designer
//
//  Created by wujunyang on 16/3/2.
//  Copyright © 2016年 zhangchun. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "BaseViewController.h"


@implementation UIViewController (Swizzle)

+ (void)load
{
    Dlog(@"ios load");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL origSel = @selector(viewDidAppear:);//它的名字叫做选择子（SEL）
        SEL swizSel = @selector(swiz_viewDidAppear:);
        [UIViewController swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
        
        SEL vcWillAppearSel=@selector(viewWillAppear:);
        SEL swizWillAppearSel=@selector(swiz_viewWillAppear:);
        [UIViewController swizzleMethods:[self class] originalSelector:vcWillAppearSel swizzledSelector:swizWillAppearSel];
        
        SEL vcDidDisappearSel=@selector(viewDidDisappear:);
        SEL swizDidDisappearSel=@selector(swiz_viewDidDisappear:);
        [UIViewController swizzleMethods:[self class] originalSelector:vcDidDisappearSel swizzledSelector:swizDidDisappearSel];
        
        SEL vcWillDisappearSel=@selector(viewWillDisappear:);
        SEL swizWillDisappearSel=@selector(swiz_viewWillDisappear:);
        objc_getClass("");
        [UIViewController swizzleMethods:[self class] originalSelector:vcWillDisappearSel swizzledSelector:swizWillDisappearSel];
    });
}

+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
{
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
//    IMP impl = class_getMethodImplementation(class, origSel);
    
//    class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
    
    //class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

- (void)swiz_viewDidAppear:(BOOL)animated
{
    //可以对控制器名称做过滤 达到过滤哪些是不操作
  //  NSString *curClassName=NSStringFromClass([self class]);
//    if (curClassName.length>0&&([curClassName isEqualToString:@"ZUHomeRecommendViewController"]||[curClassName isEqualToString:@"ZUHomeServiceViewController"]||[curClassName isEqualToString:@"ZUHomeBroadcastViewController"]||[curClassName isEqualToString:@"ZUHomeMineViewController"])) {
//        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
//    }
    [self swiz_viewDidAppear:animated];
}

-(void)swiz_viewWillAppear:(BOOL)animated
{
    
    if ([[self.navigationController childViewControllers] count] > 1) {
    }
    
    //umeng跟踪page 以本项目的VC页面才进入友盟统计
    if ([self filterZUPages]) {
        Dlog(@"ios Aop--[%@]WillAppear",NSStringFromClass([self class]));
//        [MPUmengHelper beginLogPageView:[self class]];
    }
    
    [self swiz_viewWillAppear:animated];
}

-(void)swiz_viewDidDisappear:(BOOL)animated
{
    //umeng跟踪page 以开头本项目的VC页面才进入友盟统计
    if ([self filterZUPages]) {
        Dlog(@"ios Aop--[%@]Disappear",NSStringFromClass([self class]));
//    [MPUmengHelper endLogPageView:[self class]];
    }
    [self swiz_viewDidDisappear:animated];
}

-(void)swiz_viewWillDisappear:(BOOL)animated
{
    [self swiz_viewWillDisappear:animated];
    if (self.request) {
        if (self.request.isExecuting) {
            [self.request stop];
        }
    }
}

//过滤掉一些不要统计的页面
-(BOOL)filterZUPages
{
    if ([self isKindOfClass:[BaseViewController class]]) {
        return YES;
    }
    return false;
}

-(void)setRequest:(BaseRequestService *)request{
    objc_setAssociatedObject(self, @selector(request), request, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BaseRequestService *)request{
    return objc_getAssociatedObject(self, _cmd);
}
@end
