//
//  DashLineView.h
//  QuYiBao_iOS
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//
//  虚线view

#import <UIKit/UIKit.h>

@interface DashLineView : UIView
{
    NSInteger _lineLength;
    NSInteger _lineSpacing;
    UIColor *_lineColor;
    CGFloat _height;
}

// 竖直的虚线
- (instancetype)initWithFrame:(CGRect)frame withLineLength:(NSInteger)lineLength withLineSpacing:(NSInteger)lineSpacing withLineColor:(UIColor *)lineColor;

@end
