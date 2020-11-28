//
//  UIImage+Tool.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tool)
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius;
/**
*  @brief  根据颜色生成纯色图片
*
*  @param color 颜色
*
*  @return 纯色图片
*/
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
