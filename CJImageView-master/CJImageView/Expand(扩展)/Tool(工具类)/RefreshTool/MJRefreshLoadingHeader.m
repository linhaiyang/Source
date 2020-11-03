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
//- (RefreshAnimation *)gifView
//{
//    if (!_gifView) {
//        RefreshAnimation *gifView = [[RefreshAnimation alloc] init];
//        [self addSubview:_gifView = gifView];
//    }
//    return _gifView;
//}

- (void)prepare
{
    [super prepare];
    
    // 初始化间距
    self.labelLeftInset = 0;
}
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    if (self.state != MJRefreshStateIdle ) return;
}
- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.gifView.constraints.count) return;
    if (!_gifView) {
        RefreshAnimation *gifView = [[RefreshAnimation alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_gifView = gifView];
    }
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeRight;
        
        CGFloat stateWidth = self.stateLabel.mj_textWith;
        CGFloat timeWidth = 0.0;
        if (!self.lastUpdatedTimeLabel.hidden) {
            timeWidth = self.lastUpdatedTimeLabel.mj_textWith;
        }
        CGFloat textWidth = MAX(stateWidth, timeWidth);
        self.gifView.mj_w = self.mj_w * 0.5 - textWidth * 0.5 - self.labelLeftInset;
    }
}
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
//        [self.gifView removeAnimation];
        [self.gifView addAnimation];
//        [self.gifView.layer addAnimation:<#(nonnull CAAnimation *)#> forKey:<#(nullable NSString *)#>];

    } else if (state == MJRefreshStateIdle) {
        [self.gifView removeAnimation];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        });
       
    }
}
@end
