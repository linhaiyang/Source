//
//  UIView+Frame.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint ui_origin;
@property (nonatomic, assign) CGSize ui_size;

// shortcuts for positions
@property (nonatomic) CGFloat ui_centerX;
@property (nonatomic) CGFloat ui_centerY;


@property (nonatomic) CGFloat ui_top;
@property (nonatomic) CGFloat ui_bottom;
@property (nonatomic) CGFloat ui_right;
@property (nonatomic) CGFloat ui_left;

@property (nonatomic) CGFloat ui_width;
@property (nonatomic) CGFloat ui_height;
@end
