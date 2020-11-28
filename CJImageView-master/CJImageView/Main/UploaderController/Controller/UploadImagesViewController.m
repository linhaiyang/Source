//
//  UploadImagesViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/7/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UploadImagesViewController.h"
#import <QBImagePickerController.h>
#import "MPUploadImagesService.h"
#import "MPRequstFailedHelper.h"
#import "cameraHelper.h"

@interface UploadImagesViewController ()<UITableViewDataSource, UITableViewDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, QBImagePickerControllerDelegate>
@property (strong, nonatomic) MPUploadImagesHelper *curUploadImageHelper;

@end

@implementation UploadImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"上传图片";
    [self.view addSubview:self.tableV];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    //初始化
       _curUploadImageHelper=[MPUploadImagesHelper MPUploadImageForSend:NO];
    //设置右边
       UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,70,30)];
       [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
       [rightButton setTitle:@"保存" forState:UIControlStateNormal];
       [rightButton addTarget:self action:@selector(myAction)forControlEvents:UIControlEventTouchUpInside];
       UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
       self.navigationItem.rightBarButtonItem= rightItem;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)modalView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        //拍照
        if (![cameraHelper checkCameraAuthorizationStatus]) {
            return;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;//设置可编辑
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];//进入照相界面
    }else if (buttonIndex == 1){
        //相册
        if (![cameraHelper checkPhotoLibraryAuthorizationStatus]) {
            return;
        }
//        QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
//        [imagePickerController.selectedAssets removeAllObjects];
//        [imagePickerController.selectedAssets addObjectsFromArray:self.curUploadImageHelper.selectedAssetURLs];
//        imagePickerController.filterType = QBImagePickerControllerFilterTypePhotos;
//        imagePickerController.delegate = self;
//        imagePickerController.maximumNumberOfSelection = kupdateMaximumNumberOfImage;
//        imagePickerController.allowsMultipleSelection = YES;
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
//        [self presentViewController:navigationController animated:YES completion:NULL];
    }
}

//上传图片
-(void)myAction{
    MPUploadImagesHelper * curUploadImageHelper = [MPUploadImagesHelper new];
    MPUploadImagesService *req=[[MPUploadImagesService alloc]initWithUploadImages:curUploadImageHelper];
    
    //上传进度
//    MPWeakSelf(self)
    @weakify(self);
    req.uploadPropressBlock = ^(NSProgress *uploadProgress){
        @strongify(self);
        CGFloat propress = uploadProgress.completedUnitCount*1.0/uploadProgress.totalUnitCount;
        NSLog(@"进度进度：%lld/%lld___%2f",uploadProgress.completedUnitCount,uploadProgress.completedUnitCount,propress);
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新UI
        });
    };
    
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        //进行上传后的图片地址
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [MPRequstFailedHelper requstFailed:request];
    }];
}


@end
