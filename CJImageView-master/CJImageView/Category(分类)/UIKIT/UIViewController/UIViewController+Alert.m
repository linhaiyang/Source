//
//  UIViewController+Alert.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)
-(void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title  cancelButtonName:(NSString *)cancelButtonName defaultButtonTitle:(NSString *)otherButtonName{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:otherButtonName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [alert dismissViewControllerAnimated:YES completion:nil];
        if (alertViewCallBackBlock) {
            alertViewCallBackBlock(0);
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:cancelButtonName style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)ActionSheetWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock  title:(NSString *)msg  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSArray *)otherButtonTitles{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                      message:msg
                                                               preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < otherButtonTitles.count; i++) {
        NSString * title = [otherButtonTitles objectAtIndex:i];
        [alert addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       [alert dismissViewControllerAnimated:YES completion:nil];
                           if (alertViewCallBackBlock) {
                               alertViewCallBackBlock(i);
                           }
                       }]];
    }
    [alert addAction:[UIAlertAction actionWithTitle:cancelButtonName style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}


CG_INLINE void
BAKit_UITableViewAdaptatIOS11(UITableView *tableView)
{
    if (@available(iOS 11.0, *))
    {
        tableView.estimatedRowHeight = 0.f;
        tableView.estimatedSectionHeaderHeight = 0.f;
        tableView.estimatedSectionFooterHeight = 0.f;
    }
}
@end
