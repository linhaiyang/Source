//
//  CustomAlertView.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/25.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "CustomAlertView.h"

@interface CustomAlertView()
/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;

/** 弹窗标题 */
@property (nonatomic,copy)   NSString *alertTitle;

/** 关闭按钮 */
@property (nonatomic,strong) UIButton * closeButton;
@end


@implementation CustomAlertView

-(instancetype)init{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        UIView * dismissView = [[UIView alloc]init];
        dismissView.backgroundColor = MASKCOLOR;
        [self addSubview:dismissView];
        [dismissView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        self.contentView = [UIView new];
        [self addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.left.equalTo(50);
            make.height.equalTo(self.contentView.mas_width).multipliedBy(1);
        }];
    }
    return self;
}

/** 弹出此弹窗 */
- (void)show {
    // 出场动画
    @weakify(self);
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, 0.8, 0.8);
    [UIView animateWithDuration:0.2 animations:^{
        @strongify(self);
        self.contentView.transform = CGAffineTransformIdentity;
    }];
}
@end
