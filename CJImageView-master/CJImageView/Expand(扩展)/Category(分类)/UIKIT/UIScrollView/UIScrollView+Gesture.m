//
//  UIScrollView+Gesture.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/21.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIScrollView+Gesture.h"

@implementation UIScrollView (Gesture)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    return NO;
    
}

//location_X可自己定义,其代表的是滑动返回距左边的有效长度
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    
    //是滑动返回距左边的有效长度
    int location_X =0.15*KScreen_Width;
    
    if (gestureRecognizer ==self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state ||UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            
            //这是允许每张图片都可实现滑动返回
            int temp1 = location.x;
            int temp2 =KScreen_Width;
            NSInteger XX = temp1 % temp2;
            if (point.x >0 && XX < location_X) {
                return YES;
            }
            //下面的是只允许在第一张时滑动返回生效
            //            if (point.x > 0 && location.x < location_X && self.contentOffset.x <= 0) {
            //                return YES;
            //            }
        }
    }
    return NO;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
    
}
@end
