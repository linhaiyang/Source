//
//  UIScrollView+Refresh.h
//  CJImageView
//
//  Created by shengkai li on 2020/12/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseRequestService.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Refresh)


/**适配下拉加载 和 上拉加载更多*/
-(void)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingFootBlock   refreshApi:(BaseRequestService*)api;
@end

NS_ASSUME_NONNULL_END
