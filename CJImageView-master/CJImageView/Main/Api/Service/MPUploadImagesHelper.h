//
//  MPUploadImagesHelper.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/8.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPUploadImagesHelper : NSObject
//不要直接操作imagesArray 在操作selectedAssetURLs时会利用KVO直接操作
@property (readwrite, nonatomic, strong) NSMutableArray *imagesArray;
@property (readwrite, nonatomic, strong) NSMutableArray<NSURL * > *selectedAssetURLs;

/**
 *  @author wujunyang, 16-07-25 13:07:17
 *
 *  @brief  <#Description#>
 *
 *  @param isUploadProcess 是否缓存到沙盒中YES则会转到沙盒中
 *
 *  @return <#return value description#>
 */
+(MPUploadImagesHelper *)MPUploadImageForSend:(BOOL)isUploadProcess;
@end






typedef NS_ENUM(NSInteger, MPImageUploadState)
{
    MPImageUploadStateInit = 0,
    MPImageUploadStateIng,
    MPImageUploadStateSuccess,
    MPImageUploadStateFail
};
@interface MPImageItemModel : NSObject
//原图 缩略图
@property (readwrite, nonatomic, strong) UIImage *image, *thumbnailImage;
//当前图片asstURL
@property (strong, nonatomic) NSURL *assetURL;
//上传状态
@property (assign, nonatomic) MPImageUploadState uploadState;
//服务端绑定图片[因为可修改图片上传时，会从服务端绑定一些图片上来，这部分是不用修改,还未启用]
@property(nonatomic,copy)NSString *httpUrl;
@property(nonatomic,copy)NSString *upServicePath;
//照片基本信息 图片名称 经纬度 拍照时间
@property (readwrite, nonatomic, strong) NSString *photoName;
@property (readwrite, nonatomic, strong) NSString *photoLatitude;
@property (readwrite, nonatomic, strong) NSString *photoLongitude;
@property (readwrite, nonatomic, strong) NSString *photoTime;
@end
NS_ASSUME_NONNULL_END
