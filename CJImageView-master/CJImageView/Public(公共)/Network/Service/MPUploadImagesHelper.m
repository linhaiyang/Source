

//
//  MPUploadImagesHelper.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "MPUploadImagesHelper.h"
@interface MPUploadImagesHelper()
@property(nonatomic)BOOL isUploadProcess;
@end
static MPUploadImagesHelper *_mpUploadImageHelper = nil;
@implementation MPUploadImagesHelper

+(MPUploadImagesHelper *)MPUploadImageForSend:(BOOL)isUploadProcess
{
    _mpUploadImageHelper = [[MPUploadImagesHelper alloc] init];
    _mpUploadImageHelper.isUploadProcess=isUploadProcess;
    return _mpUploadImageHelper;
}

@end

@implementation MPImageItemModel

@end
