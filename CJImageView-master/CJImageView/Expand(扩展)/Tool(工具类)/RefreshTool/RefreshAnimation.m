
//
//  RefreshAnimation.m
//  AsusMall
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 mac. All rights reserved.
//

#import "RefreshAnimation.h"

@implementation RefreshAnimation{
    CAShapeLayer *_lineLayer;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
        if (self) {
            self.backgroundColor = [UIColor clearColor];
            self.translatesAutoresizingMaskIntoConstraints = NO;
            UIBezierPath* linePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:10 startAngle:(CGFloat) (M_PI*3/2) endAngle:(CGFloat) (M_PI/2+M_PI*5) clockwise:YES];
                CAShapeLayer *lineLayer = [CAShapeLayer layer];
                lineLayer.lineWidth = 2;
             lineLayer.contentsScale = [[UIScreen mainScreen] scale];
             lineLayer.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
                lineLayer.strokeColor = HEXCOLOR(0x68ccf6).CGColor;
             lineLayer.lineCap = kCALineCapRound;
             lineLayer.lineJoin = kCALineJoinBevel;
                lineLayer.path = linePath.CGPath;
                lineLayer.fillColor = nil; // 默认为blackColor
                
                [self.layer addSublayer:lineLayer];
             
             CALayer *maskLayer = [CALayer layer];
             maskLayer.contents = (__bridge id)[[UIImage imageNamed:@"MBProgressHUD.bundle/angle-mask"] CGImage];
             maskLayer.frame = lineLayer.bounds;
             lineLayer.mask = maskLayer;
            _lineLayer = lineLayer;
        }
        return self;
}

-(void)addAnimation{
    NSTimeInterval animationDuration = 0.8;
    CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = (id) 0;
    animation.toValue = @(M_PI*2);
    animation.duration = animationDuration;
    animation.timingFunction = linearCurve;
    animation.removedOnCompletion = NO;
    animation.repeatCount = INFINITY;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    if (_lineLayer.mask.animationKeys) {
        return;
    }
    [_lineLayer.mask addAnimation:animation forKey:@"rotate"];

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = INFINITY;
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = linearCurve;

    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @0.015;
    strokeStartAnimation.toValue = @0.515;

    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @0.485;
    strokeEndAnimation.toValue = @0.985;

    animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    [_lineLayer addAnimation:animationGroup forKey:@"progress"];
}
-(void)removeAnimation{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_lineLayer removeAllAnimations];
        [_lineLayer.mask removeAllAnimations];
    });

}
-(CGSize)intrinsicContentSize{//translatesAutoresizingMaskIntoConstraints

    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

@end
