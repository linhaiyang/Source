//
//  BaseView.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView
+ (instancetype)nibClassInit{
    BaseView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    return view;
}


@end
