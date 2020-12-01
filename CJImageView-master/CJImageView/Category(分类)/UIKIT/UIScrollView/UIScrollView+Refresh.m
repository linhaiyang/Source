//
//  UIScrollView+Refresh.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

-(void)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingFootBlock  refreshApi:(BaseRequestService*)api{
    @weakify(self);
    if (refreshingBlock) {
        MJRefreshStateHeader * head =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            if (refreshingFootBlock) {
                api.page = 1;
                [self.mj_footer resetNoMoreData];
            }
            refreshingBlock();
        }];
        head.lastUpdatedTimeLabel.hidden = true;
        head.stateLabel.hidden = true;
        self.mj_header = head;
        [RACObserve(api, page)subscribeNext:^(id  _Nullable x) {//在数据加载完后/加载失败，监听某个属性变化，停止刷新
            @strongify(self);
            [self.mj_header endRefreshing];
        }];
    }
    if (refreshingFootBlock) {
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if(api.page == 0)api.page = 1;
            api.page += 1;
            refreshingFootBlock();
        }];
        [RACObserve(api, page)subscribeNext:^(id  _Nullable x) {//在数据加载完后/加载失败，监听某个属性变化，停止刷新
            @strongify(self);
            [self.mj_footer endRefreshing];
            [self.mj_footer endRefreshingWithNoMoreData];
        }];
    }
}
@end
