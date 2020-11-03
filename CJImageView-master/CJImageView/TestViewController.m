//
//  TestViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/8/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "TestViewController.h"
#import "UIBezierPath+BasicShapes.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    Byte byteData[] = {1,2,3,4,5,6};
    Byte y = byteData[0];
    Byte x = byteData[1];
    NSLog(@"%hhu---------------%hhu",y,x);
    
    
    NSString * str[] = {@"1",@"2"};
    
    NSLog(@"%@------NSString---------%@",str[0],str[1]);
    
    //background
    //button_navibars_4w
    UIImage * img01 = [UIImage imageNamed:@"test_image_2"];
    
    //imageCroppedToRect
    //imageScaledToSize
    /*
    CGFloat img01Width = img01.size.width;
    CGFloat img01height = img01.size.height;
    Dlog(@"%f------img01-----%f",img01Width,img01height);
    
    UIImage * img02 = [UIImage imageWithColor:[UIColor orangeColor]];
    CGFloat img02Width = img02.size.width;
    CGFloat img02height = img02.size.height;
    Dlog(@"%f------img02-----%f",img02Width,img02height);
    
    CGFloat cgWidth =  CGImageGetWidth(img01.CGImage);
    CGFloat cgheight =  CGImageGetHeight(img01.CGImage);
    Dlog(@"%f------img01CG-----%f",cgWidth,cgheight);
    
        UIImageView * bgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 240, 128)];
        [self.view addSubview:bgView];
    UIImageView * bgView02 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 200, 240, 128)];
    [self.view addSubview:bgView02];
    UIImage * cropped = [img01 imageCroppedToRect:CGRectMake(0,0, 240, 128)];
    UIImage * scaled = [img01 imageScaledToSize:CGSizeMake(240, 128)];
    bgView.image =  cropped;
    bgView02.image = scaled;
    */
    UILabel * label = [UILabel new];
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    NSString * text = @"当您具有绝对URL且仅想使用SDWebImage显示图像时,计算UIlabel的宽高";
    label.text = text;
    label.numberOfLines = 0;
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(200);
        make.top.left.equalTo(50);
    }];
    NSString * textStr = @"当您具有绝对URL且仅想使用SDWebImage显示图像时,计算UIlabel的宽高";
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                 NSParagraphStyleAttributeName: paragraph};
    CGSize textSize = [textStr boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    CGFloat height = [textStr heightWithFont:nil constrainedToWidth:100];
    Dlog(@"%f--------------",height);
    
    
    UIBezierPath * starPath = [UIBezierPath stars:5 shapeInFrame:CGRectMake(0, 0, 200, 30)];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
       lineLayer.lineWidth = 1;
    lineLayer.contentsScale = [[UIScreen mainScreen] scale];
    lineLayer.frame = CGRectMake(10, 200, 100, 30);
       lineLayer.strokeColor = HEXCOLOR(0x68ccf6).CGColor;
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.lineJoin = kCALineJoinBevel;
       lineLayer.path = starPath.CGPath;
       lineLayer.fillColor = nil; // 默认为blackColor
       
    [self.view.layer addSublayer:lineLayer];
}

@end
