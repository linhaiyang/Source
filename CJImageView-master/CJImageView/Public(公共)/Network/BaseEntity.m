//
//  BaseEntity.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/29.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
//    return @{@"coupon" : [CouponsListDataCouponModel class],
//             @"list":[AskListDataAskModel class]
//             };.
    return [NSDictionary new];
}
// 当 JSON 转为 Model 完成后，该方法会被调用。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // 可以在这里处理一些数据逻辑，如NSDate格式的转换
//    Dlog(@"%@----modelCustomTransformFromDictionary",[dic dicToString]);
    return YES;
}

@end
