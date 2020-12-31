//
//  UIView+Frame.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
#pragma mark - Shortcuts for the coords

- (CGFloat)ui_top
{
    return self.frame.origin.y;
}

- (void)setUi_top:(CGFloat)ui_top
{
    CGRect frame = self.frame;
    frame.origin.y = ui_top;
    self.frame = frame;
}

- (CGFloat)ui_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setUi_right:(CGFloat)ui_right
{
    CGRect frame = self.frame;
    frame.origin.x = ui_right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)ui_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setUi_bottom:(CGFloat)ui_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = ui_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)ui_left
{
    return self.frame.origin.x;
}

- (void)setUi_left:(CGFloat)ui_left
{
    CGRect frame = self.frame;
    frame.origin.x = ui_left;
    self.frame = frame;
}

- (CGFloat)ui_width
{
    return self.frame.size.width;
}

- (void)setUi_width:(CGFloat)ui_width
{
    CGRect frame = self.frame;
    frame.size.width = ui_width;
    self.frame = frame;
}

- (CGFloat)ui_height
{
    return self.frame.size.height;
}

- (void)setUi_height:(CGFloat)ui_height
{
    CGRect frame = self.frame;
    frame.size.height = ui_height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)ui_origin {
    return self.frame.origin;
}

- (void)setUi_origin:(CGPoint)ui_origin {
    CGRect frame = self.frame;
    frame.origin = ui_origin;
    self.frame = frame;
}

- (CGSize)ui_size {
    return self.frame.size;
}

- (void)setUi_size:(CGSize)ui_size {
    CGRect frame = self.frame;
    frame.size = ui_size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)ui_centerX {
    return self.center.x;
}

- (void)setUi_centerX:(CGFloat)ui_centerX {
    self.center = CGPointMake(ui_centerX, self.center.y);
}

- (CGFloat)ui_centerY {
    return self.center.y;
}

- (void)setUi_centerY:(CGFloat)ui_centerY {
    self.center = CGPointMake(self.center.x, ui_centerY);
}

@end
