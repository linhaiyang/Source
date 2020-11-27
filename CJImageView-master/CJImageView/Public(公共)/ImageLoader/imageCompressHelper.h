//
//  imageCompressHelper.h
//  CJImageView
//  图片压缩
//  Created by shengkai li on 2020/7/11.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/PHAsset.h>//Photos.PHImageManager
#import <Photos/PHImageManager.h>
NS_ASSUME_NONNULL_BEGIN

@interface imageCompressHelper : NSObject
/**
 *  @author wujunyang, 16-04-14 15:04:54
 *
 *  @brief  图片大于多少KB会进行压缩
 *
 *  @param kb    <#kb description#>
 *  @param image <#image description#>
 *
 *  @return <#return value description#>
 */
+(UIImage*)compressedImageToLimitSizeOfKB:(CGFloat)kb image:(UIImage*)image;

+(NSData*)returnDataCompressedImageToLimitSizeOfKB:(CGFloat)kb image:(UIImage*)image;

//对图片进行处理 画圆并增加外圈
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;

//指定宽度按比例缩放
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

//按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
+(UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth;

//调整图片方向
+ (UIImage *)fullScreenImageALAsset:(PHAsset *)asset;
@end

NS_ASSUME_NONNULL_END
