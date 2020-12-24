//
//  UIViewController+MJPopupViewController.m
//  MJModalViewController
//
//  Created by Martin Juhasz on 11.05.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "UIViewController+MJPopupViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

#define kPopupModalAnimationDuration 0.35
#define kMJPopupViewController @"kMJPopupViewController"
#define kMJPopupBackgroundView @"kMJPopupBackgroundView"
#define kMJSourceViewTag 23941
#define kMJPopupViewTag 23942
#define kMJOverlayViewTag 23945

@interface UIViewController (MJPopupViewControllerPrivate)
- (UIView*)topView;
- (void)presentPopupView:(UIView*)popupView;
@end

static NSString *MJPopupViewDismissedKey = @"MJPopupViewDismissed";

////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public

@implementation UIViewController (MJPopupViewController)

static void * const keypath = (void*)&keypath;

- (UIViewController*)mj_popupViewController {
    return objc_getAssociatedObject(self, kMJPopupViewController);
}

- (void)setMj_popupViewController:(UIViewController *)mj_popupViewController {
    objc_setAssociatedObject(self, kMJPopupViewController, mj_popupViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (MJPopupBackgroundView*)mj_popupBackgroundView {
    return objc_getAssociatedObject(self, kMJPopupBackgroundView);
}

- (void)setMj_popupBackgroundView:(MJPopupBackgroundView *)mj_popupBackgroundView {
    objc_setAssociatedObject(self, kMJPopupBackgroundView, mj_popupBackgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)presentPopupViewController:(UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType backgroundTouch:(BOOL)enable dismissed:(void(^)(void))dismissed
{
    self.mj_popupViewController = popupViewController;
    [self presentPopupView:popupViewController.view animationType:animationType backgroundTouch:enable dismissed:dismissed];
}

- (void)presentPopupViewController:(UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType
{
    [self presentPopupViewController:popupViewController animationType:animationType backgroundTouch:YES dismissed:nil];
}

- (void)dismissPopupViewControllerWithanimationType:(MJPopupViewAnimation)animationType
{
    UIView *sourceView = [self topView];
    UIView *popupView = [sourceView viewWithTag:kMJPopupViewTag];
    UIView *overlayView = [sourceView viewWithTag:kMJOverlayViewTag];
    
    switch (animationType) {
        case MJPopupViewAnimationSlideBottomTop:
        case MJPopupViewAnimationSlideBottomBottom:
        case MJPopupViewAnimationSlideTopTop:
        case MJPopupViewAnimationSlideTopBottom:
        case MJPopupViewAnimationSlideLeftLeft:
        case MJPopupViewAnimationSlideLeftRight:
        case MJPopupViewAnimationSlideRightLeft:
        case MJPopupViewAnimationSlideRightRight:
            [self slideViewOut:popupView sourceView:sourceView overlayView:overlayView withAnimationType:animationType];
            break;
            
        default:
            [self fadeViewOut:popupView sourceView:sourceView overlayView:overlayView];
            break;
    }
}



////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark View Handling

- (void)presentPopupView:(UIView*)popupView animationType:(MJPopupViewAnimation)animationType
{
    [self presentPopupView:popupView animationType:animationType backgroundTouch:YES dismissed:nil];
}

- (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        if (rootViewController) {
            return rootViewController;
        }else{
            UIViewController *recentView = self;
            
            while (recentView.parentViewController != nil) {
                recentView = recentView.parentViewController;
            }
            return recentView;
            
        }
    }
}

- (void)presentPopupView:(UIView*)popupView animationType:(MJPopupViewAnimation)animationType backgroundTouch:(BOOL)enable dismissed:(void(^)(void))dismissed
{
    UIView *sourceView = [self topView];
    sourceView.tag = kMJSourceViewTag;
    popupView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    popupView.tag = kMJPopupViewTag;
    
    // check if source view controller is not in destination
    if ([sourceView.subviews containsObject:popupView]) return;
    
    // customize popupView
    popupView.layer.shadowPath = [UIBezierPath bezierPathWithRect:popupView.bounds].CGPath;
    popupView.layer.masksToBounds = NO;
    popupView.layer.shadowOffset = CGSizeMake(5, 5);
    popupView.layer.shadowRadius = 5;
    popupView.layer.shadowOpacity = 0.5;
    popupView.layer.shouldRasterize = YES;
    popupView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    // Add semi overlay
    UIView *overlayView = [[UIView alloc] initWithFrame:sourceView.bounds];
    overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    overlayView.tag = kMJOverlayViewTag;
    overlayView.backgroundColor = [UIColor clearColor];
    
    // BackgroundView
    self.mj_popupBackgroundView = [[MJPopupBackgroundView alloc] initWithFrame:sourceView.bounds];
    self.mj_popupBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mj_popupBackgroundView.backgroundColor = [UIColor clearColor];
    self.mj_popupBackgroundView.alpha = 0.0f;
    [overlayView addSubview:self.mj_popupBackgroundView];
    
    // Make the Background Clickable
    UIButton * dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    dismissButton.backgroundColor = [UIColor clearColor];
    dismissButton.frame = sourceView.bounds;
    [overlayView addSubview:dismissButton];
    
    popupView.alpha = 0.0f;
    [overlayView addSubview:popupView];
    [sourceView addSubview:overlayView];
    
    
    [dismissButton addTarget:self action:@selector(dismissPopupViewControllerWithanimation:) forControlEvents:UIControlEventTouchUpInside];
    switch (animationType) {
        case MJPopupViewAnimationSlideBottomTop:
        case MJPopupViewAnimationSlideBottomBottom:
        case MJPopupViewAnimationSlideTopTop:
        case MJPopupViewAnimationSlideTopBottom:
        case MJPopupViewAnimationSlideLeftLeft:
        case MJPopupViewAnimationSlideLeftRight:
        case MJPopupViewAnimationSlideRightLeft:
        case MJPopupViewAnimationSlideRightRight:
            dismissButton.tag = animationType;
            [self slideViewIn:popupView sourceView:sourceView overlayView:overlayView withAnimationType:animationType];
            break;
        default:
            dismissButton.tag = MJPopupViewAnimationFade;
            [self fadeViewIn:popupView sourceView:sourceView overlayView:overlayView];
            break;
    }
    dismissButton.enabled = enable;
    [self setDismissedCallback:dismissed];
}

-(UIView*)topView {
    
    return  [self topViewController].view;
}
//-(UIView*)topView {
//    UIViewController *recentView = self;
//
//    while (recentView.parentViewController != nil) {
//        recentView = recentView.parentViewController;
//    }
//    return recentView.view;
//}

- (void)dismissPopupViewControllerWithanimation:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton* dismissButton = sender;
        switch (dismissButton.tag) {
            case MJPopupViewAnimationSlideBottomTop:
            case MJPopupViewAnimationSlideBottomBottom:
            case MJPopupViewAnimationSlideTopTop:
            case MJPopupViewAnimationSlideTopBottom:
            case MJPopupViewAnimationSlideLeftLeft:
            case MJPopupViewAnimationSlideLeftRight:
            case MJPopupViewAnimationSlideRightLeft:
            case MJPopupViewAnimationSlideRightRight:
                [self dismissPopupViewControllerWithanimationType:dismissButton.tag];
                break;
            default:
                [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
                break;
        }
    } else {
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    }
}

//////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Animations

#pragma mark --- Slide

- (void)slideViewIn:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView withAnimationType:(MJPopupViewAnimation)animationType
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupStartRect;
    switch (animationType) {
        case MJPopupViewAnimationSlideBottomTop:
        case MJPopupViewAnimationSlideBottomBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        sourceSize.height,
                                        popupSize.width,
                                        popupSize.height);
            
            break;
        case MJPopupViewAnimationSlideLeftLeft:
        case MJPopupViewAnimationSlideLeftRight:
            popupStartRect = CGRectMake(-sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        case MJPopupViewAnimationSlideTopTop:
        case MJPopupViewAnimationSlideTopBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        -popupSize.height,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        default:
            popupStartRect = CGRectMake(sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
    }
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     (sourceSize.height - popupSize.height) / 2,
                                     popupSize.width,
                                     popupSize.height);
    
    // Set starting properties
    popupView.frame = popupStartRect;
    popupView.alpha = 1.0f;
    [UIView animateWithDuration:kPopupModalAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.mj_popupViewController viewWillAppear:NO];
        self.mj_popupBackgroundView.alpha = 1.0f;
        popupView.frame = popupEndRect;
    } completion:^(BOOL finished) {
        [self.mj_popupViewController viewDidAppear:NO];
    }];
}

- (void)slideViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView withAnimationType:(MJPopupViewAnimation)animationType
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect;
    switch (animationType) {
        case MJPopupViewAnimationSlideBottomTop:
        case MJPopupViewAnimationSlideTopTop:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      -popupSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case MJPopupViewAnimationSlideBottomBottom:
        case MJPopupViewAnimationSlideTopBottom:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      sourceSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case MJPopupViewAnimationSlideLeftRight:
        case MJPopupViewAnimationSlideRightRight:
            popupEndRect = CGRectMake(sourceSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
        default:
            popupEndRect = CGRectMake(-popupSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
    }
    
    [UIView animateWithDuration:kPopupModalAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.mj_popupViewController viewWillDisappear:NO];
        popupView.frame = popupEndRect;
        self.mj_popupBackgroundView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [popupView removeFromSuperview];
        [overlayView removeFromSuperview];
        [self.mj_popupViewController viewDidDisappear:NO];
        self.mj_popupViewController = nil;
        
        id dismissed = [self dismissedCallback];
        if (dismissed != nil)
        {
            ((void(^)(void))dismissed)();
            [self setDismissedCallback:nil];
        }
    }];
}

#pragma mark --- Fade

- (void)fadeViewIn:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView
{
    // Generating Start and Stop Positions
    CGSize sourceSize = sourceView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     (sourceSize.height - popupSize.height) / 2,
                                     popupSize.width,
                                     popupSize.height);
    
    // Set starting properties
    popupView.frame = popupEndRect;
    popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        [self.mj_popupViewController viewWillAppear:NO];
        self.mj_popupBackgroundView.alpha = 0.5f;
        popupView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self.mj_popupViewController viewDidAppear:NO];
    }];
}

- (void)fadeViewOut:(UIView*)popupView sourceView:(UIView*)sourceView overlayView:(UIView*)overlayView
{
    [UIView animateWithDuration:kPopupModalAnimationDuration animations:^{
        [self.mj_popupViewController viewWillDisappear:NO];
        self.mj_popupBackgroundView.alpha = 0.0f;
        popupView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [popupView removeFromSuperview];
        [overlayView removeFromSuperview];
        [self.mj_popupViewController viewDidDisappear:NO];
        self.mj_popupViewController = nil;
        
        id dismissed = [self dismissedCallback];
        if (dismissed != nil)
        {
            ((void(^)(void))dismissed)();
            [self setDismissedCallback:nil];
        }
    }];
}

#pragma mark -
#pragma mark Category Accessors

#pragma mark --- Dismissed

- (void)setDismissedCallback:(void(^)(void))dismissed
{
    objc_setAssociatedObject(self, &MJPopupViewDismissedKey, dismissed, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self.mj_popupViewController, &MJPopupViewDismissedKey, dismissed, OBJC_ASSOCIATION_RETAIN);
    
}

- (void(^)(void))dismissedCallback
{
    return objc_getAssociatedObject(self, &MJPopupViewDismissedKey);
}

@end



@implementation MJPopupBackgroundView

- (void)drawRect:(CGRect)rect
{

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    size_t locationsCount = 2;
    CGFloat locations[2] = {0.0f, 1.0f};
    CGFloat colors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.75f};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = 0.0;
    myStartPoint.y = 0.0;
    myEndPoint.x = rect.size.width;
    myEndPoint.y = rect.size.height;

//    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
//    float radius = MIN(self.bounds.size.width , self.bounds.size.height) ;
    CGContextDrawLinearGradient(context, gradient, myStartPoint, myEndPoint, 0);
//    CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);
}


@end
/**
 //
 //  VipCenterTopCell.m
 //  AsusMall
 //
 //  Created by shengkai li on 2020/9/27.
 //  Copyright © 2020 mac. All rights reserved.
 //

 #import "VipCenterTopCell.h"
 #import "MyCenterModel.h"
 #import "VipCenterVipDetailCell.h"
 #import "VipCenterModel.h"

 @interface VipCenterTopCell()<UICollectionViewDelegate,UICollectionViewDataSource>
 //@property (weak, nonatomic) IBOutlet UILabel * desTitle;
 //@property (weak, nonatomic) IBOutlet UIImageView * VipImage;
 //@property (weak, nonatomic) IBOutlet UIView * tipView01;
 //@property (weak, nonatomic) IBOutlet UIView * tipView02;
 //@property (weak, nonatomic) IBOutlet UIView * tipBgView;
 //@property (weak, nonatomic) IBOutlet UILabel * vipTipLabel;
 @property (strong, nonatomic) VipCenterUser* user_model;
 @property (weak, nonatomic) IBOutlet UICollectionView * mainCollectionView;


 @end

 @implementation VipCenterTopCell

 - (void)awakeFromNib {
     [super awakeFromNib];
     [self.mainCollectionView registerNib:[UINib nibWithNibName:@"VipCenterVipDetailCell" bundle:nil] forCellWithReuseIdentifier:@"VipCenterVipDetailCell"];
     
 }
 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 //    return self.dataArray.count;
     return 1;
 }
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     VipCenterVipDetailCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VipCenterVipDetailCell" forIndexPath:indexPath];
 //    [cell refreshCell:[self.dataArray objectAtIndex:indexPath.row]];
     [cell refreshTopCell:self.user_model];
     return cell;
 }
 -(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
     return UIEdgeInsetsMake(0, 20, 0, 20);
 }
 // 每个cell的尺寸
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
     return CGSizeMake(kSCREEN_WIDTH-40, (kSCREEN_WIDTH-40)*171/325);;
 }
 // X间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

     return 15.f;
 }
 // Y间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
     return 15.f;
 }

 -(void)refreshTopCell:(VipCenterUser*)model{
     self.user_model = model;
     if (GlobalUserDefault.isLogin) {
         [self.mainCollectionView reloadData];
         self.mainCollectionView.hidden = false;
     }else{
         self.mainCollectionView.hidden = true;
     }
 //    [self.mainCollectionView reloadData];
 }
 @end

 
 
 */
