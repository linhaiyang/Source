//
//  UIBezierPath+BasicShapes.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIBezierPath+BasicShapes.h"

@implementation UIBezierPath (BasicShapes)
+ (CGRect)maximumSquareFrameThatFits:(CGRect)frame;
{
    CGFloat a = MIN(frame.size.width, frame.size.height);
    return CGRectMake(frame.size.width/2 - a/2, frame.size.height/2 - a/2, a, a);
}
+ (UIBezierPath *)starShape:(CGRect)originalFrame
{
    CGRect frame = [self maximumSquareFrameThatFits:originalFrame];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.05000 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.67634 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.30729 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.97553 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39549 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.78532 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64271 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.79389 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95451 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85000 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.20611 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95451 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.21468 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64271 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02447 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39549 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.32366 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.30729 * CGRectGetHeight(frame))];
    [bezierPath closePath];
    
    return bezierPath;
}

+ (UIBezierPath *)stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame
{
    // divide the original frame into equally sized frames
    CGFloat w = originalFrame.size.width/numberOfStars;
    CGRect babyFrame = CGRectMake(0, 0, w, originalFrame.size.height);
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    for (int i=0; i < numberOfStars; i++) {
        // get the star shape
        UIBezierPath* startPath = [UIBezierPath starShape:babyFrame];
        // move it to the desired location
        [startPath applyTransform:CGAffineTransformTranslate(CGAffineTransformIdentity, i*w, 0)];
        // add the path
        [bezierPath appendPath:startPath];
    }
    
    return bezierPath;
}
@end
