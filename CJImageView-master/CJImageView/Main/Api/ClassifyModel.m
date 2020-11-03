
//
//  ClassifyModel.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "ClassifyModel.h"

@implementation ClassifyModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"expansion" : [ClassDataExpansionModel class]};
}


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end

@implementation ClassDataAdModel


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation ClassDataExpansionModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"set_key" : [ClassDataExpansionSetKeyModel class]};
}


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation ClassDataExpansionSetKeyModel


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end
