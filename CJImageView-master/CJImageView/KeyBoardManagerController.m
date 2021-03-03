//
//  KeyBoardManagerController.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/11.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "KeyBoardManagerController.h"
#import "loadAinitializeTest.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface KeyBoardManagerController ()
{
    UITextField * _textField;
}
@end

@implementation KeyBoardManagerController
-(void)loadView{
    [super loadView];
//    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//    self.view = scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[IQKeyboardManager sharedManager] registerTextFieldViewClass:[YYTextView class] didBeginEditingNotificationName:YYTextViewTextDidBeginEditingNotification didEndEditingNotificationName:YYTextViewTextDidEndEditingNotification];

    UITextField * field = [UITextField new];
    field.placeholder = @"输入筛选数据1";
    field.frame = CGRectMake(100, 100, 200, 50);
    field.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:field];
    _textField = field;

    KeyBoardView * keyBoard = [[KeyBoardView alloc]init];
    [self.view addSubview:keyBoard];
    keyBoard.frame = CGRectMake(100, 200, 100, 50);
    keyBoard.text = @"keyborad";
    
    UITextField * field2 = [UITextField new];
    field2.placeholder = @"输入筛选数据2";
    field2.frame = CGRectMake(100,kScreenHeight - 200, 200, 50);
    field2.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:field2];
    
    YYTextView * textView = [[YYTextView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    textView.placeholderText = @"YYTextView placthoder";
    [self.view addSubview:textView];
//    textView.inputAccessoryView = [[IQToolbar alloc]init];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEdi:)];
        UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(endEdi:)];
        toolBar.items = [NSArray arrayWithObjects:right,right2,right,right, nil];
    field.inputAccessoryView = toolBar;
//        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 320)];
//        UIImageView *igView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180)];
////        igView.image = [UIImage imageNamed:@"pic2.png"];
//        [inputView addSubview:igView];
//        inputView.backgroundColor = [UIColor greenColor];
//    field.inputView =inputView;
    
    dispatch_after(0.5, dispatch_get_main_queue(), ^{
        UIWindow * win=_textField.window;
        if (win) {
            Dlog(@"window");
        }
    });

}
-(void)endEdi:(UIBarButtonItem*)batItem{
    UIWindow * win=_textField.window;
    if (win) {
        Dlog(@"window");
    }
}

@end
