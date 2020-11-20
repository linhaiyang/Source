//
//  MJRefreshLoadingHeader.m
//  AsusMall
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 mac. All rights reserved.
//

#import "MJRefreshLoadingHeader.h"
#import "RefreshAnimation.h"
@interface MJRefreshLoadingHeader()
//{
//    __unsafe_unretained RefreshAnimation *_gifView;
//}
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@property (strong, nonatomic) RefreshAnimation *gifView;
@end
@implementation MJRefreshLoadingHeader
- (void)prepare
{
    [super prepare];
}

- (void)placeSubviews
{
    [super placeSubviews];
    if (self.gifView.constraints.count) return;
    if (!_gifView) {
        RefreshAnimation *gifView = [[RefreshAnimation alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_gifView = gifView];
    }
}
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        [self.gifView addAnimation];

    } else if (state == MJRefreshStateIdle) {
        [self.gifView removeAnimation];
    }
}
@end
