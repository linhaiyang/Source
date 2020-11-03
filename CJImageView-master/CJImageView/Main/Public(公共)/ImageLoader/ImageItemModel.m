//
//  ImageItemModel.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "ImageItemModel.h"
#import <CoreLocation/CoreLocation.h>
#import "UIImage+FX.h"
#import <Photos/PHAsset.h>
#import "MPFileManager.h"
@implementation ImageItemModel
+ (instancetype)imageWithAssetURL:(NSURL *)assetURL isUploadProcess:(BOOL)isUploadProcess{
    ImageItemModel *imageItem = [[ImageItemModel alloc] init];
    imageItem.uploadState = MPImageUploadStateInit;
    imageItem.assetURL = assetURL;
    void (^selectAsset)(PHAsset *) = ^(PHAsset *asset){
        
    };
   
    return imageItem;
    
}

+ (instancetype)imageWithAssetURL:(NSURL *)assetURL andImage:(UIImage *)image{
    ImageItemModel *imageItem = [[ImageItemModel alloc] init];
    imageItem.uploadState = MPImageUploadStateInit;
    imageItem.assetURL = assetURL;
    imageItem.image = image;
    imageItem.thumbnailImage = [image imageScaledToSize:CGSizeMake(AdaptedWidth(70), AdaptedWidth(70))];
    return imageItem;
}
@end
