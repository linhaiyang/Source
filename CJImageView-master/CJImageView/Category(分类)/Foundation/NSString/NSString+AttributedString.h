//
//  NSString+AttributedString.h
//  CJImageView
//
//  Created by shengkai li on 2020/12/2.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (AttributedString)
-(NSMutableAttributedString *)addForegroundColorAttributeNameValue:(UIColor*)color range:(NSRange)range1 FontAttributeName:(UIFont*)font range:(NSRange)range2;
@end

NS_ASSUME_NONNULL_END
