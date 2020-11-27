//
//  ImageUploadHelper.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "ImageUploadHelper.h"
#import "imageCompressHelper.h"

@interface ImageUploadHelper()
@property(nonatomic)BOOL isUploadProcess;
@end

static ImageUploadHelper *_mpUploadImageHelper = nil;

@implementation ImageUploadHelper
+(ImageUploadHelper *)MPUploadImageForSend:(BOOL)isUploadProcess
{
    _mpUploadImageHelper = [[ImageUploadHelper alloc] init];
    _mpUploadImageHelper.isUploadProcess=isUploadProcess;
    return _mpUploadImageHelper;
}
@end
