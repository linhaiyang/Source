//
//  UIView+FX.h
//  CJImageView
//
//  Created by shengkai li on 2021/2/19.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FX)
- (void)FXWithCornerRadius:(CGFloat)radius backGroundColor:(UIColor*)bgColor rect:(CGRect)rect;

- (void)drawImage:(CGContextRef) context image:(CGImageRef) image cgrect:(CGRect)rect;
@end

NS_ASSUME_NONNULL_END
