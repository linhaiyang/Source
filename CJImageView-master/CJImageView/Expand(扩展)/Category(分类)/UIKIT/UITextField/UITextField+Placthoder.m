//
//  UITextField+Placthoder.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UITextField+Placthoder.h"
#import <objc/runtime.h>

static const void *JKTextFieldInputLimitMaxLength = &JKTextFieldInputLimitMaxLength;
@implementation UITextField (Placthoder)
-(void)addPlaceholder:(NSString *)placeHolder withPlaceHolderColor:(UIColor *)placeHolderColor Font:(CGFloat)font{
    if (placeHolder.length == 0) {
        return;
    }
    if (@available(iOS 13.0, *)) {
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:placeHolder attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],NSForegroundColorAttributeName:placeHolderColor?placeHolderColor:[UIColor lightGrayColor]}];
        self.attributedPlaceholder = att;
    }else{
        self.placeholder = placeHolder;
        [self setValue:[UIFont systemFontOfSize:font] forKeyPath:@"_placeholderLabel.font"];
        [self setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];;
    }
}


- (NSInteger)jk_maxLength {
    return [objc_getAssociatedObject(self, JKTextFieldInputLimitMaxLength) integerValue];
}
- (void)setJk_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(jk_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)jk_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.jk_maxLength > 0 && toBeString.length > self.jk_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.jk_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.jk_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.jk_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.jk_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}
@end
