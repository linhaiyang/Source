//
//  CustomerController.m
//  CJImageView
//
//  Created by shengkai li on 2021/3/4.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "CustomerController.h"
#import "MainTabBarController.h"
#import "YYControl.h"

@protocol WBStatusCellDelegate <NSObject>
@optional
- (void)cellDidClickCard;
@end

@interface customerControllerView : UIView

@end



@implementation customerControllerView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    _trackingTouch = NO;
//    UITouch *t = touches.anyObject;
//    CGPoint p = [t locationInView:_bView];
//    if (CGRectContainsPoint(_bView.bounds, p)) {
//        _trackingTouch = YES;
//        _bView.backgroundColor = HEXCOLOR(f0f0f0);//
//
//    }
    self.backgroundColor = HEXCOLOR(f0f0f0);//
//    if (!_trackingTouch) {
//        [super touchesBegan:touches withEvent:event];
//    }
//    self.backgroundColor = kWBCellInnerViewHighlightColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = HEXCOLOR(f7f7f7);
//    [self.viewController performSelector:@selector(fadeRootController)];
//    if (_trackingTouch) {
//        [self fadeRootController];
//    }
//    else{
//        [super touchesEnded:touches withEvent:event];
//    }
//    if ([_cell.delegate respondsToSelector:@selector(cellDidClickCard:)]) {
//        [_cell.delegate cellDidClickCard:_cell];
//    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

//    if (!_trackingTouch) {
//        [super touchesCancelled:touches withEvent:event];
//    }
//    self.backgroundColor = HEXCOLOR(f7f7f7);
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(setBackgroundColor:) object:HEXCOLOR(f7f7f7)];
    self.backgroundColor = HEXCOLOR(f7f7f7);

//    self.backgroundColor = _isRetweet ? [UIColor whiteColor] : kWBCellInnerViewColor;
}
-(BOOL)canBecomeFirstResponder{
    return true;
}
@end

@interface CustomerController ()
{
    customerControllerView   * _bView;
    BOOL _trackingTouch;
}
@end

@implementation CustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    YYControl * bgView = [[YYControl alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 50)];
    bgView.backgroundColor = HEXCOLOR(f7f7f7);
    bgView.exclusiveTouch = YES;
    [self.view addSubview:bgView];
//    _bView = bgView;
    bgView.userInteractionEnabled = true;
    __block  UIView * blockView = bgView;
//    YYGestureRecognizer *gesture = [YYGestureRecognizer new];
//    [bgView addGestureRecognizer:gesture];
//    gesture.action = ^(YYGestureRecognizer *gesture, YYGestureRecognizerState state) {
//        if (state == YYGestureRecognizerStateCancelled) {
//            Dlog(@"YYGestureRecognizerStateCancelled");
//
//        }else if (state == YYGestureRecognizerStateEnded){
//            Dlog(@"YYGestureRecognizerStateEnded");
//
//        }else if (state == YYGestureRecognizerStateBegan){
//            Dlog(@"YYGestureRecognizerStateBegan");
//        }else if (state == YYGestureRecognizerStateMoved){
//            Dlog(@"YYGestureRecognizerStateMoved");
//        }
//        CGFloat width = gesture.currentPoint.x;
//        CGFloat height = gesture.currentPoint.y;
//        wlabel.width = width < 30 ? 30 : width;
//        wlabel.height = height < 30 ? 30 : height;
//    };
    
//    [bgView addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
//        blockView.backgroundColor = HEXCOLOR(f0f0f0);
//        if (recognizer.state == UIGestureRecognizerStateBegan) {
//            Dlog(@"YYGestureRecognizerStateBegan");
//        }else if (recognizer.state == UIGestureRecognizerStateCancelled){
////            [NSObject cancelPreviousPerformRequestsWithTarget:blockView selector:@selector(setBackgroundColor:) object:HEXCOLOR(f0f0f0)];
////            blockView.backgroundColor = HEXCOLOR(f7f7f7);
//            Dlog(@"YYGestureRecognizerStateCancelled");
//        }else if (recognizer.state == UIGestureRecognizerStateEnded){
////            [NSObject cancelPreviousPerformRequestsWithTarget:blockView selector:@selector(setBackgroundColor:) object:HEXCOLOR(f0f0f0)];
////            blockView.backgroundColor = HEXCOLOR(f7f7f7);
////            [self fadeRootController];
//            Dlog(@"UIGestureRecognizerStateEnded");
//        }
//    }];
    
    bgView.touchBlock = ^(YYControl *view, YYGestureRecognizerState state, NSSet *touches, UIEvent *event) {
        if (state == YYGestureRecognizerStateCancelled) {
                    Dlog(@"YYGestureRecognizerStateCancelled");
        
                }else if (state == YYGestureRecognizerStateEnded){
                    Dlog(@"YYGestureRecognizerStateEnded");
                    [self fadeRootController];
                }else if (state == YYGestureRecognizerStateBegan){
                    Dlog(@"YYGestureRecognizerStateBegan");
                }else if (state == YYGestureRecognizerStateMoved){
                    Dlog(@"YYGestureRecognizerStateMoved");
                }
    };
    
}


-(void)fadeRootController{
    MainTabBarController*mainTabBar = [MainTabBarController new];
    //UIViewAnimationTransition
//    CATransition *anima = [CATransition animation];//CATransaction事务 Transition过渡
//    /**The name of the transition. Current legal transition types include
//     * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. */
//    anima.type =kCATransitionFade;// @"cube" 设置动画的类型
////    anima.subtype = kCATransitionFromRight; //设置动画的方向
//    anima.duration = 0.3f;
//    anima.removedOnCompletion = true;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = kCATransitionPush;
//    [layer addAnimation:transition forKey:@"contents"];
//    5.动画切换方向
    transition.subtype = kCATransitionFromTop;//顶部
    self.view.window.rootViewController = mainTabBar;
    [self.view.window.layer addAnimation:transition forKey:@"revealAnimation"];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
