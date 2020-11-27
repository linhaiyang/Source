//
//  MPUploadImagesService.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseRequestService.h"
#import "MPUploadImagesHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPUploadImagesService : BaseRequestService
- (instancetype)initWithUploadImages:(MPUploadImagesHelper *)model;
@end

NS_ASSUME_NONNULL_END
