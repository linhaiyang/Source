//
//  LoginModel.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/4.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HomePageInfoDataModel,HomePageInfoDataHotProductModel,HomePageInfoDataCarouselModel,HomePageInfoDataNewProductModel,HomePageInfoDataSprikeModel,HomePageInfoDataNavModel,HomePageInfoDataRollNavModel,HomePageInfoDataLogoModel,HomePageInfoDataHotProductListModel,HomePageInfoDatabigADModel;
@interface LoginModel : NSObject
@property (nonatomic, assign) NSInteger notice;
@property (nonatomic, strong) HomePageInfoDataNewProductModel * hot_product;//热销
@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSArray * sub_title;
@property (nonatomic, strong) NSArray * homeData;
@property (nonatomic, strong) HomePageInfoDataLogoModel * logo_search;
@property (nonatomic, strong) NSArray * view_evaluation;
@property (nonatomic, strong) NSArray * nav_data;
@property (nonatomic, strong) HomePageInfoDataNewProductModel * New_Product;//新品发售
@property (nonatomic, strong) NSArray * roll_nav;
@property (nonatomic, strong) HomePageInfoDataSprikeModel * spike_data;//限时购
@property (nonatomic, strong) HomePageInfoDatabigADModel * big_ad;
@property (nonatomic, copy) NSArray *show_window;
@property (nonatomic, copy) NSString * token;
@end
@interface HomePageInfoDataHotProductModel : NSObject
//@property (nonatomic, copy) NSString * name;
//@property (nonatomic, strong) NSArray * product_list;
@end

@interface HomePageInfoDatabigADModel : NSObject
@property(nonatomic,assign)int address_id;
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * url;

@property (nonatomic, copy) NSString * keyword;
@property (nonatomic, copy) NSString * name;
@property(nonatomic,assign)CGFloat imageHeight;
@property(nonatomic,assign)int url_type;
@property(nonatomic,assign)int type_id;
@end
@interface HomePageInfoDataHotProductListModel : NSObject//热销版
@property (nonatomic, copy) NSString * alias;
@property (nonatomic, copy) NSString * asus_url;
@property (nonatomic, copy) NSString * catId;
@property (nonatomic, copy) NSString * channel;
@property (nonatomic, copy) NSString * goods_id;
@property (nonatomic, copy) NSString * goods_name;
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * spike_price;
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * keyword;
@property (nonatomic, copy) NSString * is_del;
@property (nonatomic, assign) NSInteger is_gift;
@property (nonatomic, assign) NSInteger is_limit;
@property (nonatomic, copy) NSString * is_pub;
@property (nonatomic, assign) NSInteger is_service;
@property (nonatomic, assign) NSInteger sale_price;
@property (nonatomic, assign) NSInteger market_price;
@property (nonatomic, strong) NSArray * pos_data;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, copy) NSString * product_id;
@property (nonatomic, copy) NSString * type_id;
@property (nonatomic, copy) NSString * url_type;
@property (nonatomic, copy) NSString * object_id;
@property (nonatomic, copy) NSString * product_name;
@property (nonatomic, copy) NSString * product_sn;
@property (nonatomic, strong) NSObject * property_str;
@property (nonatomic, copy) NSString * series;
@property (nonatomic, copy) NSString * sort;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * title;
@end
@interface HomePageInfoDataCarouselModel : NSObject//轮播图
@property (nonatomic, copy) NSString * end_at;
@property (nonatomic, copy) NSString * act_type;
@property (nonatomic, copy) NSString * start_at;
@property (nonatomic, copy) NSString * type_con;
@property (nonatomic, copy) NSString * keyword;
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * switch_time;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger type_id;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, assign) NSInteger url_type;
@end
@interface HomePageInfoDataNewProductModel : NSObject//新品发售
@property (nonatomic, copy) NSString * title;
@property (nonatomic, strong) NSArray * product_list;
@end
@interface HomePageInfoDataSprikeModel : NSObject//限时购
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * start_left_time;
@property (nonatomic, assign) NSInteger end_left_time;
@property (nonatomic, strong) NSArray * products;
@end
@interface HomePageInfoDataNavModel : NSObject//icon板块
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * keyword;
@property (nonatomic, copy) NSString * type_con;
@property (nonatomic, copy) NSString * act_type;
@property (nonatomic, assign) NSInteger type_id;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, assign) NSInteger url_type;
@end
@interface HomePageInfoDataRollNavModel : NSObject//横向导航
@property (nonatomic, copy) NSString * deputy_title;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString *  type_id;
@property (nonatomic, copy) NSString *  tab_id;
@property (nonatomic, copy) NSString *  visitor_id;
@end
@interface HomePageInfoDatasubTitleModel : NSObject//banner 下方的标签
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * title;
@end
@interface HomePageInfoDataLogoModel : NSObject//
@property (nonatomic, copy) NSString * img_url;
@property (nonatomic, copy) NSString * title;
@end
NS_ASSUME_NONNULL_END
