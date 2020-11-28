//
//  NSDate+Extension.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/28.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#define D_MINUTE    60
#define D_HOUR    3600
#define D_DAY    86400
#define D_WEEK    604800
#define D_YEAR    31556926
NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)

@end


@interface NSDateFormatter (Make)
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
@end
NS_ASSUME_NONNULL_END
