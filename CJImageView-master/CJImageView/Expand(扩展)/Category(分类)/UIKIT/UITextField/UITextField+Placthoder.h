//
//  UITextField+Placthoder.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Placthoder)
-(void)addPlaceholder:(NSString *)placeHolder withPlaceHolderColor:(UIColor *)placeHolderColor Font:(CGFloat)font;

@property (assign, nonatomic)  NSInteger jk_maxLength;//if <=0, no limit
@end

NS_ASSUME_NONNULL_END
