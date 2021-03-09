//
//  UIViewController+AlertController.h
//  CJImageView
//
//  Created by shengkai li on 2021/3/8.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AlertController)
-(void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message AlertActionTitle:(NSArray *)titles handler:(void (^ __nullable)(UIAlertAction *action))handler;
@end

NS_ASSUME_NONNULL_END
