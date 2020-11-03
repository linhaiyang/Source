//
//  CALayer+Addition.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "CALayer+Addition.h"

@implementation CALayer (Addition)
-(void)addGradientLayer:(UIColor*)color01 color02:(UIColor*)color02 gradientOrientation:(BOOL)vertical{
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self insertSublayer:gradientLayer atIndex:0];
    //设置渐变区域的起始和终止位置（范围为0-1）
    if (vertical) {
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
    }else{
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
    }
    
    //设置颜色数组
    gradientLayer.colors = @[(__bridge id)color01.CGColor,
                                        (__bridge id)color02.CGColor];
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.0f), @(1.0f)];
}
@end
