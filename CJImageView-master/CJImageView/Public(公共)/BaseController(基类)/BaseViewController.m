//
//  BaseViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     1.self.automaticallyAdjustsScrollViewInsets = NO;// 默认是YES

     2.self.edgesForExtendedLayout = UIRectEdgeNone;// 推荐使用

     3. // 默认是YES
     */
    /**
     self.edgesForExtendedLayout = UIRectEdgeNone;(0 0; 414 808);//滑动时，没有穿透到导航栏的底部
     */
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (@available(iOS 11.0, *)) {// 适配iOS 11
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
//    self.extendedLayoutIncludesOpaqueBars=YES;
    
//    //是一个类型为UIExtendedEdge的属性，指定边缘要延伸的方向。 因为iOS7鼓励全屏布局，它的默认值很自然地是UIRectEdgeAll，四周边缘均延伸，就是说，如果即使视图中上有NavigationBar，下有tabBar，那么视图仍会延伸覆盖到四周的区域。
    
    /**
     <RefreshAnimation: 0x7fe7f3f53270; frame = (0 20; 414 54); layer = <CALayer: 0x60000267c0e0>>
     
     */
    
    // 解决pop的时候,前一个页面会有一个向下的位移,然后向上飘
//    if (@available(iOS 11, *)) {
//        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (UITableView *)tableV{
//    if (!_tableV) {
//        _tableV = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
//        if (@available(iOS 11.0, *)) {
//            _tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            // Fallback on earlier versions
//        }
//        _tableV.delegate = self;
//        _tableV.dataSource = self;
////        _tableV.backgroundColor = QkColor;
//        _tableV.showsVerticalScrollIndicator = NO;
//        _tableV.showsHorizontalScrollIndicator = NO;
//        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableV.estimatedRowHeight = 0;
//        _tableV.estimatedSectionFooterHeight = 0;
//        _tableV.estimatedSectionHeaderHeight = 0;
////        _tableV.pagingEnabled = YES;
////        [self.view addSubview:self.tableV];
//    }
//    return _tableV;
//}




-(void)dealloc{
    Dlog(@"%@---dealloc",NSStringFromClass([self class]));
}
@end
