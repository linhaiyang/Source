//
//  UIView+Layer.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/29.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

-(void)addCornerRedius:(CGFloat)redius backGroundColor:(UIColor*)color{
    self.backgroundColor = [UIColor clearColor];
    UIRectCorner corner = UIRectCornerAllCorners; // 圆角位置，全部位置
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(redius, redius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    maskLayer.fillColor = color.CGColor;
    [self.layer insertSublayer:maskLayer atIndex:0];
//    if (@available(iOS 11.0, *)) {
//        self.layer.cornerRadius = redius;
//        self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
//    } else {
//
//    }
    
//     CGRect rect = CGRectMake(0, 0, redius, redius);
////    UIGraphicsBeginImageContextWithOptions(CGSizeMake(redius, redius), NO, [UIScreen mainScreen].scale);
//    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
//    CGContextAddPath(ctx,path.CGPath);
//    CGContextClip(ctx);
//    [self drawRect:rect];
//    CGContextDrawPath(ctx, kCGPathFillStroke);
//UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
//UIGraphicsEndImageContext();
    
    /*
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(redius, redius)];
    layer.path = path.CGPath;

      //颜色修改
               layer.fillColor = [UIColor clearColor].CGColor;
               layer.strokeColor=[UIColor whiteColor].CGColor;
    //        UIView *testView = [[UIView alloc] initWithFrame:bounds];
            [self.layer insertSublayer:layer atIndex:0];;
     */
}

-(void)addCornerRediusBorderWidth:(CGFloat)redius borderColor:(UIColor*)color lineWidth:(CGFloat)lineWidth{
   if (@available(iOS 11.0, *)) {
        self.layer.cornerRadius = redius;
       self.layer.borderColor = color.CGColor;
       self.layer.borderWidth = lineWidth;
        self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
    } else {
        UIRectCorner corner = UIRectCornerAllCorners; // 圆角位置，全部位置
                  UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(redius, redius)];
                  CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
                  maskLayer.frame = self.bounds;
                  maskLayer.path = path.CGPath;
                  
               
               // 带边框则两个颜色不要设置成一样即可
               maskLayer.strokeColor = [UIColor redColor].CGColor;
               maskLayer.fillColor = [UIColor yellowColor].CGColor;
               
               [self.layer insertSublayer:maskLayer atIndex:0];
    }
    
}
@end
