//
//  BaseViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseViewController.h"
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#endif
@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
    [self testRetainCycle];
#endif
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CViewBgColor;
    self.extendedLayoutIncludesOpaqueBars=YES;//是否延伸到包含不透明的状态栏。
    
/**在navBar.translucent = true;//透明的情况下，UIviewcontroller延伸到navBar下，告诉uiviewcontroller不要讲其扩展到整个屏幕。*/
//    self.edgesForExtendedLayout = UIRectEdgeAll;//------uiviewcontroller延伸到整个屏幕
//    self.edgesForExtendedLayout = UIRectEdgeNone;//-----uiviewcontroller从导航以下开始 到 tabbarController上方
    if (@available(iOS 11.0, *)) {
//        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //加上这两句话，会让tableview的内容视图就是frame的大小。
        //默认情况下tableview会自动计算出安全区域，也就是内容视图会从64或20(隐藏导航栏时)开始。适用视图控制器从导航底部开始的情况
    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO; //默认是YES  iOS 11以下适配
    }
}
//-(void)dealloc{
//    Dlog(@"%@---dealloc",NSStringFromClass([self class]));
//}


- (void)testRetainCycle {
#if __has_include(<FBMemoryProfiler/FBMemoryProfiler.h>)
    FBRetainCycleDetector *detector = [[FBRetainCycleDetector alloc] init];
    [detector addCandidate:self];
//    NSSet *retainCycles = [detector findRetainCycles];
//    NSLog(@"------retainCycles----------%@", retainCycles);
#endif

}
@end
