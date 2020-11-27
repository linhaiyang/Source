//
//  UIViewController+Alert.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^UIAlertViewCallBackBlock)(NSInteger buttonIndex);
@interface UIViewController (Alert)
//@property (nonatomic, copy) UIAlertViewCallBackBlock alertViewCallBackBlock;
-(void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title cancelButtonName:(NSString *)cancelButtonName defaultButtonTitle:(NSString *)otherButtonName;
-(void)ActionSheetWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock  title:(NSString *)msg  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSArray *)otherButtonTitles;
@end

NS_ASSUME_NONNULL_END
