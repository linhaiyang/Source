//
//  UITableViewCell+Tool.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Tool)
//cell 添加圆角
-(void)addCornerRedius:(CGFloat)redius backGroundColor:(UIColor *)backGroundColor;
@end

NS_ASSUME_NONNULL_END
