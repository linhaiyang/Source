//
//  UIView+FX.m
//  CJImageView
//
//  Created by shengkai li on 2021/2/19.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "UIView+FX.h"

@implementation UIView (FX)

/***- (void)drawRect:(CGRect)rect*/

- (void)FXWithCornerRadius:(CGFloat)radius backGroundColor:(UIColor*)bgColor rect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(context, path.CGPath);
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
//    [bgColor setFill];
////    CGContextDrawPath(context, kCGPathFill);//绘制填充
//    [path addClip];
    CGContextFillPath(context);
    
}

- (void)drawImage:(CGContextRef) context image:(CGImageRef) image cgrect:(CGRect)rect{
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    CGContextDrawImage(context, rect, image);
    
    CGContextRestoreGState(context);
}
@end
