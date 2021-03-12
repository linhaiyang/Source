//
//  BaseNavigationController.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //重写了leftbarItem之后,需要添加如下方法才能重新启用右滑返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
//    self.navigationBar.backgroundColor = [UIColor cyanColor];
//    self.navigationBar
//    [self.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor cyanColor]]];
//    self.navigationBar set
//    self.navigationBar
//    self.navigationBar.translucent = false;
    NSLog(@"%@---------subviews-",self.navigationBar);
    
    UIView*overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.navigationBar.bounds) + 20)];
    overlay.userInteractionEnabled = NO;
    overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    [self.navigationBar insertSubview:overlay atIndex:0];
//    [self.navigationBar.layer insertSublayer:overlay.layer atIndex:0];
    overlay.backgroundColor = [UIColor orangeColor];
//    self.navigationItem.backBarButtonItem
    self.delegate = self;
}


+ (void)initialize {
    Dlog(@"初始化导航控制器");
    // 设置导航items数据主题
    [self setupNavigationItemsTheme];
    
    // 设置导航栏主题
    [self setupNavigationBarTheme];
}


#pragma mark -  设置导航items数据主题
+ (void)setupNavigationItemsTheme {
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    // 设置字体颜色
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    [barButtonItem setTintColor:[UIColor blackColor]];
//    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateHighlighted];
//    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateDisabled];
    
}

#pragma mark -  设置导航栏主题
+ (void)setupNavigationBarTheme {
    UINavigationBar * navBar = [UINavigationBar appearance];
    // 设置导航栏title属性
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

    
//    UIColor * color = HEXCOLOR(0xF9F9F9);
//    UIImage *image = [UIImage imageWithColor:color];//
//    [navBar setBackgroundColor:[UIColor clearColor]];
////
    [navBar setBackgroundImage:[UIImage imageWithColor:UIColor.orangeColor] forBarMetrics:UIBarMetricsDefault];//UIViewController 从导航栏底部开始
//    [navBar setBarTintColor:KColorNavDefault];
    
    navBar.tintColor = [UIColor clearColor];
    
    navBar.translucent = false;//不透明的//UIViewController 从导航栏顶部开始
//    navBar.opaque = true;//不透明的
    __block UINavigationBar * bnavBar = navBar;
    [UIImage imageWithColor:[UIColor clearColor] completion:^(UIImage *img) {
        [bnavBar setShadowImage:img];
    }];
    // 设置导航栏颜色
}


#pragma mark -  拦截所有push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.extendedLayoutIncludesOpaqueBars=YES;
    if (@available(iOS 11.0, *)) {
        viewController.navigationItem.backButtonTitle = @"";
    } else {
        if (self.viewControllers.count > 0) {
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"button_navibars_4w"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            [backButton setImageInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
            viewController.navigationItem.backBarButtonItem = backButton;
        }

        // Fallback on earlier versions
    }
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark -  拦截所有pop方法
- (void)back {
    [super popViewControllerAnimated:YES];
     //这里就可以自行修改返回按钮的各种属性等
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
}
@end
