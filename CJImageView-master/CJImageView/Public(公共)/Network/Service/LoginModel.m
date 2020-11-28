//
//  LoginModel.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"carousel" : [HomePageInfoDataCarouselModel class],
             @"top_serve":[HomePageInfoDataNavModel class],
             @"nav_data":[HomePageInfoDataNavModel class],
             @"roll_nav":[HomePageInfoDataRollNavModel class],
             @"sub_title":[HomePageInfoDatasubTitleModel class],
             @"show_window":[HomePageInfoDatabigADModel class ]
             };
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"New_Product":@"new_product"};
}
@end
@implementation HomePageInfoDataHotProductModel
//product_list
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
return @{@"product_list" : [HomePageInfoDataHotProductListModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"product_id":@"id"};
}
@end

@implementation HomePageInfoDataHotProductListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end

@implementation HomePageInfoDataCarouselModel

@end

@implementation HomePageInfoDataNewProductModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
return @{@"product_list" : [HomePageInfoDataHotProductListModel class]};
}
@end

@implementation HomePageInfoDataSprikeModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
return @{@"products" : [HomePageInfoDataHotProductListModel class]};
}
@end

@implementation HomePageInfoDataNavModel

@end

@implementation HomePageInfoDataRollNavModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"type_id":@"id"};
}
@end

@implementation HomePageInfoDataLogoModel

@end

@implementation HomePageInfoDatasubTitleModel



@end
@implementation HomePageInfoDatabigADModel
@end
