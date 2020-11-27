//
//  UITableViewCell+Tool.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UITableViewCell+Tool.h"
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


+(instancetype)registerNibCell:(UITableView *)tableView{
    if ((!tableView) ||
        (![tableView isKindOfClass:[UITableView class]])) {
        return nil;
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

+ (instancetype)registerCell:(UITableView *)tableView{
    if ((!tableView) ||
        (![tableView isKindOfClass:[UITableView class]])) {
        return nil;
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end


@implementation UICollectionViewCell (Tool)
+ (void)registerCell:(UICollectionView *)collectionView{
    if ((!collectionView) ||
           (![collectionView isKindOfClass:[UICollectionView class]])) {
           return;
       }
       [collectionView registerClass:self forCellWithReuseIdentifier:NSStringFromClass(self)];
}

+ (void)registerNibCell:(UICollectionView *)collectionView{
    if ((!collectionView) ||
           (![collectionView isKindOfClass:[UICollectionView class]])) {
           return;
       }
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(self)];
}
@end
