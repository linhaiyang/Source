//
//  UIView+EaseBlankPage.m
//  Blossom
//
//  Created by wujunyang on 15/9/21.
//  Copyright © 2015年 wujunyang. All rights reserved.
//

#import "UIView+EaseBlankPage.h"
#import <objc/runtime.h>
static char BlankPageViewKey;

@implementation UIView(EaseBlankPage)

- (void)setBlankPageView:(EaseBlankPageView *)blankPageView{
    [self willChangeValueForKey:@"BlankPageViewKey"];
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"BlankPageViewKey"];
}

- (EaseBlankPageView *)blankPageView{
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[EaseBlankPageView alloc] init];
        }
        self.blankPageView.hidden = NO;
        [self.blankPageContainer addSubview:self.blankPageView];
        [self.blankPageView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

- (UIView *)blankPageContainer{
    UIView *blankPageContainer = self;
//    for (UIView *aView in [self subviews]) {
//        if ([aView isKindOfClass:[UITableView class]]) {
//            blankPageContainer = aView;
//        }
//    }
    return blankPageContainer;
}
@end


@implementation UITableView(EaseBlankPage)

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData){
        self.backgroundView = nil;
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[EaseBlankPageView alloc] init];
            
            [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
        }
        self.backgroundView = self.blankPageView;
    }
}
@end


@implementation UICollectionView(EaseBlankPage)

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData){
        self.backgroundView = nil;
    }else{
        if (!self.blankPageView) {
            self.blankPageView = [[EaseBlankPageView alloc] initWithFrame:self.bounds];
        }
        self.backgroundView = self.blankPageView;
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}
@end
