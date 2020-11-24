//
//  UIView+Nib.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)
+ (instancetype)loadNib{
    UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    return view;
}
@end
