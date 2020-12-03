//
//  NSString+AttributedString.m
//  CJImageView
//
//  Created by shengkai li on 2020/12/2.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)
-(NSMutableAttributedString *)addForegroundColorAttributeNameValue:(UIColor*)color range:(NSRange)range1 FontAttributeName:(UIFont*)font range:(NSRange)range2{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self];
    [title addAttribute:NSForegroundColorAttributeName value:color range:range1];
    [title addAttribute:NSFontAttributeName value:font range:(NSRange)range2];
    return title;
}
@end
