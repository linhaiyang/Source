//
//  MPUploadImageItemService.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "MPUploadImageItemService.h"
#import <AFNetworking.h>
@implementation MPUploadImageItemService{
    MPImageItemModel *_model;
}

- (instancetype)initWithUploadImageItem:(MPImageItemModel *)model
{
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

- (NSString *)requestUrl {
    return @"";
}
- (AFConstructingBlock)constructingBodyBlock{
     if (_model.image) {
         return ^(id<AFMultipartFormData> formData) {
             NSData *data = UIImageJPEGRepresentation(_model.image, 0.9);
             NSString *name = @"files";
             NSString *formKey = _model.photoName?:@"image.jpg";
             NSString *type = @"image/jpeg";
             [formData appendPartWithFileData:data name:name fileName:formKey mimeType:type];
         };
     }
    return nil;
}
@end
