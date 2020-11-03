//
//  DismissVCAnimation.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/22.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "DismissVCAnimation.h"

@implementation DismissVCAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 前一个ViewController,动画的发起者
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 后一个ViewController,动画的结束者
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect screenBounds = [UIScreen mainScreen].bounds;
    // 获取前一个页面的frame
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
     // 转场动画的toView的最终的frame
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    // 转换的容器view
    UIView *containerView = [transitionContext containerView];
    // 下面这里是为了让转场动画衔接的更和谐,不然,下滑一点距离就直接看到之前页面的内容,体验不好
    UIView *bgView = [[UIView alloc] initWithFrame:fromVC.view.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    [toVC.view addSubview:bgView ];

    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVC.view.frame = finalFrame;
        bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [bgView removeFromSuperview];
        BOOL complate = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:(!complate)];
    }];
}

-(void)animationEnded:(BOOL)transitionCompleted {
}
@end
