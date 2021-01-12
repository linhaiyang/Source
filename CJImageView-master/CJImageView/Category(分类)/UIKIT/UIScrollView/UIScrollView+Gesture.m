//
//  UIScrollView+Gesture.m
//  CJImageView
//
//  Created by shengkai li on 2021/1/12.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "UIScrollView+Gesture.h"

@implementation UIScrollView (Gesture)

/**
 左滑返回与scrollView滑动冲突
 
 */

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([self isPanBackAction:gestureRecognizer]) {
        return true;
    }
    return false;
}


-(BOOL)isPanBackAction:(UIGestureRecognizer*)getstureRecognize{
    if (self.contentOffset.x == 0) {
        if (getstureRecognize == self.panGestureRecognizer) {
            CGPoint velocity = [self.panGestureRecognizer velocityInView: self.panGestureRecognizer.view];
            if (velocity.x > 0) {
                return true;
            }
        }
    }
    return false;
}

@end
