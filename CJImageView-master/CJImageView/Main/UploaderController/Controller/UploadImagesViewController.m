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
#import "WZZPopViewController.h"

@interface UploadImagesViewController ()<UITableViewDataSource, UITableViewDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, QBImagePickerControllerDelegate,UIPopoverPresentationControllerDelegate>
@property (strong, nonatomic) MPUploadImagesHelper *curUploadImageHelper;
@property (nonatomic, strong) UIButton *rightItem;
@property (nonatomic, strong) WZZPopViewController *popVC;

@end

@implementation UploadImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title=@"上传图片";
    [self.view addSubview:self.tableV];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    //初始化
       _curUploadImageHelper=[MPUploadImagesHelper MPUploadImageForSend:NO];
    //设置右边
//       UIButton*rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//       [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//       [rightButton setTitle:@"保存" forState:UIControlStateNormal];
//       [rightButton addTarget:self action:@selector(popAction)forControlEvents:UIControlEventTouchUpInside];
//    [rightButton sizeToFit];
//       UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
       
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(popAction)];
    self.navigationItem.rightBarButtonItem= item;
    [item setTitlePositionAdjustment:UIOffsetMake(8, 0) forBarMetrics:UIBarMetricsDefault];
//    self.rightItem = rightButton;
}
-(void)popAction{
    
    //初始化 VC
    self.popVC = [[WZZPopViewController alloc] init];
    //设置 VC 弹出方式
    self.popVC.modalPresentationStyle = UIModalPresentationPopover;
    //设置依附的按钮
        self.popVC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
//    self.popVC.popoverPresentationController.sourceView = self.navigationItem.rightBarButtonItem.customView;
    //可以指示小箭头颜色
    self.popVC.popoverPresentationController.backgroundColor = [UIColor yellowColor];
    //箭头方向
    self.popVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    // 指定箭头所指区域的矩形框范围（位置和尺寸）,以sourceView的左上角为坐标原点
    // 这个可以 通过 Point 或  Size 调试位置
    // 使用导航栏的左右按钮不需要这句代码
//    self.popVC.popoverPresentationController.sourceRect = self.navigationItem.rightBarButtonItem.customView.bounds;
    self.popVC.popoverPresentationController.popoverLayoutMargins  = UIEdgeInsetsMake(-15, 0, 15, 0 );

    //代理
    self.popVC.popoverPresentationController.delegate = self;
    [self presentViewController:self.popVC animated:YES completion:nil];
    
    //content尺寸
    //self.itemPopVC.preferredContentSize = CGSizeMake(400, 400);
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover消失， 默认YES
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
