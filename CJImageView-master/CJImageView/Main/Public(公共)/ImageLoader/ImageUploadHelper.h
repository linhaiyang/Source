//
//  ImageUploadHelper.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/10.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageUploadHelper : NSObject
@property (readwrite, nonatomic, strong) NSMutableArray *imagesArray;
@property (readwrite, nonatomic, strong) NSMutableArray *selectedAssetURLs;


- (void)addASelectedAssetURL:(NSURL *)assetURL;
- (void)deleteASelectedAssetURL:(NSURL *)assetURL;
- (void)deleteAImage:(ImageItemModel *)imageInfo;

+(ImageUploadHelper *)MPUploadImageForSend:(BOOL)isUploadProcess;
@end

NS_ASSUME_NONNULL_END
