//
//  MPUploadImageItemService.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPUploadImagesHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPUploadImageItemService : BaseRequestService
- (instancetype)initWithUploadImageItem:(MPImageItemModel *)model;
@end

NS_ASSUME_NONNULL_END
