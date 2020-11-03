//
//  CALayer+Addition.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Addition)

/// 添加渐变颜色
/// @param color01 渐变颜色1
/// @param color02 渐变颜色2
/// @param vertical 横向/竖向渐变
-(void)addGradientLayer:(UIColor*)color01 color02:(UIColor*)color02 gradientOrientation:(BOOL)vertical;
@end

NS_ASSUME_NONNULL_END
