//
//  ClassifyModel.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ClassDataAdModel,ClassDataExpansionModel,ClassDataExpansionSetKeyModel;

@interface ClassifyModel : NSObject
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) ClassDataAdModel *ad;

@property (nonatomic, copy) NSString *cat_id;

@property (nonatomic, copy) NSString *parent_id;

@property (nonatomic, copy) NSString *update_parent_id;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *is_del;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *enabled;

@property (nonatomic, copy) NSString *is_pub;

@property (nonatomic, strong) NSArray *expansion;

@property (nonatomic, copy) NSString *sort;

@property(assign, nonatomic) BOOL isSelect;
@end
@interface ClassDataAdModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *end_at;

@property (nonatomic, copy) NSString *cat_id;

@property (nonatomic, copy) NSString *update_parent_id;

@property (nonatomic, copy) NSString *channel;

@property (nonatomic, copy) NSString *act_type;

@property (nonatomic, copy) NSString *ad_price;

@property (nonatomic, copy) NSString *is_del;

@property (nonatomic, copy) NSString *img_url;

@property (nonatomic, copy) NSString *start_at;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *enabled;

@property (nonatomic, copy) NSString *clicks;

@property (nonatomic, copy) NSString *is_pub;

@property (nonatomic, copy) NSString *type_con;

@property (nonatomic, copy) NSString *mark;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *position_id;

@end

@interface ClassDataExpansionModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *type_id;

@property (nonatomic, copy) NSString *cat_id;

@property (nonatomic, copy) NSString *parent_id;

@property (nonatomic, copy) NSString *update_parent_id;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *is_del;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *enabled;

@property (nonatomic, copy) NSString *is_pub;

@property (nonatomic, strong) NSArray *set_key;

@property (nonatomic, copy) NSString *ad_img;

@property (nonatomic, assign) int url_type;

@property (nonatomic, copy) NSString *ad_url;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *keyword;

@end

@interface ClassDataExpansionSetKeyModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString * cat_id;

@property (nonatomic, copy) NSString *parent_id;

@property (nonatomic, copy) NSString *update_parent_id;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *is_del;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *enabled;

@property (nonatomic, copy) NSString *is_pub;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *keyword;
@end
NS_ASSUME_NONNULL_END
