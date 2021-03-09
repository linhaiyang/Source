//
//  UIViewController+AlertController.m
//  CJImageView
//
//  Created by shengkai li on 2021/3/8.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "UIViewController+AlertController.h"

@implementation UIViewController (AlertController)
-(void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message AlertActionTitle:(NSArray *)titles handler:(void (^ __nullable)(UIAlertAction *action))handler{
    //1.创建UIAlertControler
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
      /*
       参数说明：
       Title:弹框的标题
       message:弹框的消息内容
       preferredStyle:弹框样式：UIAlertControllerStyleAlert
       */
      
      //2.添加按钮动作
      //2.1 确认按钮
      UIAlertAction *conform = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
          handler?handler(action):nil;
      }];
      //2.2 取消按钮
      UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
          
      }];
//      //2.3 还可以添加文本框 通过 alert.textFields.firstObject 获得该文本框
//      [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//          textField.placeholder = @"请填写您的反馈信息";
//      }];
//
      //3.将动作按钮 添加到控制器中
      [alert addAction:conform];
      [alert addAction:cancel];
      
      //4.显示弹框
      [self presentViewController:alert animated:YES completion:nil];

}

-(void)ActionSheetControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message AlertActionTitle:(NSArray *)titles handler:(void (^ __nullable)(UIAlertAction *action))handler{
    
}
@end
