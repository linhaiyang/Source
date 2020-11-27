//
//  MPUploadImagesService.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "MPUploadImagesService.h"
#import <AFNetworking.h>

@implementation MPUploadImagesService{
    MPUploadImagesHelper *_model;
}
- (instancetype)initWithUploadImages:(MPUploadImagesHelper *)model{
    
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 60;
}

//-(SERVERCENTER_TYPE)centerType
//{
//    return PICTURE_SERVERCENTER;
//}

- (NSString *)requestUrl {
    return @"upload-images";
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        for (MPImageItemModel *imageItem in _model.imagesArray) {
            NSData *data = UIImageJPEGRepresentation(imageItem.image, 0.9);
            NSString *name = @"files";
            NSString *formKey = imageItem.photoName?:@"image.jpg";
            NSString *type = @"image/jpeg";
            [formData appendPartWithFileData:data name:name fileName:formKey mimeType:type];
        }
    };
}
@end
