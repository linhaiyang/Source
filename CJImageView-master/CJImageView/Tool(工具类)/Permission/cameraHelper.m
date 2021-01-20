//
//  cameraHelper.m
//  MobileProject
//
//  Created by wujunyang on 16/7/20.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "cameraHelper.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>

@import AVFoundation;

@implementation cameraHelper

+ (BOOL)checkPhotoLibraryAuthorizationStatus
{
    PHAuthorizationStatus authStatus;
    // 查询权限
    if (@available(iOS 14, *)) {
        PHAccessLevel level = PHAccessLevelReadWrite;
        authStatus = [PHPhotoLibrary authorizationStatusForAccessLevel:level];
    } else {
        if ([PHPhotoLibrary respondsToSelector:@selector(authorizationStatus)]) {
            authStatus = [PHPhotoLibrary authorizationStatus];
        }else{
            return false;
        }
    }
    switch (authStatus) {
        case PHAuthorizationStatusLimited:
            NSLog(@"limited");
            break;
        case PHAuthorizationStatusDenied:
            NSLog(@"denied");
            break;
        case PHAuthorizationStatusAuthorized:
            return true;
            break;
        default:
            break;
  }
//    if (PHAuthorizationStatusNotDetermined == authStatus ||
//        PHAuthorizationStatusRestricted == authStatus||
//        PHAuthorizationStatusDenied == authStatus) {
//
//        return NO;
//    }
    [MBProgressHUD showMessage:@"请在iPhone的“设置->隐私->照片”中打开本应用的访问权限" toView:nil];
    return false;
}

+ (BOOL)checkCameraAuthorizationStatus
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [MBProgressHUD showMessage:@"该设备不支持拍照" toView:nil];
        return NO;
    }

    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (AVAuthorizationStatusDenied == authStatus ||
            AVAuthorizationStatusRestricted == authStatus) {
            [MBProgressHUD showMessage:@"请在iPhone的“设置->隐私->相机”中打开本应用的访问权限" toView:nil];
            return NO;
        }
    }
    return YES;
}

@end
