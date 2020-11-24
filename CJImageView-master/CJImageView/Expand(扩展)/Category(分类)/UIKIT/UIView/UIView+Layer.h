//
//  UIView+Layer.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/29.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Layer)

/**圆角*/
-(void)addCornerRedius:(CGFloat)redius;

/**圆角加边框*/
-(void)addCornerRediusBorderWidth:(CGFloat)redius borderColor:(UIColor*)color lineWidth:(CGFloat)lineWidth;
@end

NS_ASSUME_NONNULL_END
