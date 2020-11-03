//
//  UITableViewCell+Tool.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UITableViewCell+Tool.h"
#import "BaseTableViewCell.h"
@implementation UITableViewCell (Tool)

-(void)addCornerRedius:(CGFloat)redius backGroundColor:(UIColor *)backGroundColor {
    self.backgroundColor = [UIColor clearColor];
    UIRectCorner corner = UIRectCornerAllCorners; // 圆角位置，全部位置
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(redius, redius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    maskLayer.fillColor = backGroundColor.CGColor;
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:self.bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:maskLayer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    self.backgroundView = roundView;
}
@end
