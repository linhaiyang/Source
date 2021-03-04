//
//  UIView+AddSubViewS.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "UIView+AddSubView.h"

@implementation UIView (AddSubView)
-(UILabel*)addUILabelWithtext:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor{
    UILabel * label = [[UILabel alloc]init];
    label.font = font;
    label.text = text;
    label.textColor = textColor;
    [self addSubview:label];
    return label;
}

-(UIButton *)addUIButtonWithFont:(UIFont*)font titleColor:(UIColor*)textColor title:(NSString*)title{
    UIButton *button = [[UIButton alloc] init];
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [self addSubview:button];
    return button;
}

-(UITableView*)addTableViewDelegate:(id)delegate{
    UITableView*tableV = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    tableV.showsVerticalScrollIndicator = NO;
    tableV.showsHorizontalScrollIndicator = NO;
    tableV.alwaysBounceVertical = YES;
    tableV.delegate = delegate;
    tableV.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
    tableV.dataSource = delegate;
    tableV.backgroundColor = CViewBgColor;
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableV.estimatedRowHeight = 0;
    tableV.estimatedSectionFooterHeight = 0;
    tableV.estimatedSectionHeaderHeight = 0;
    [self addSubview:tableV];
        if (@available(iOS 11.0, *)) {
//            tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            //加上这两句话，会让tableview的内容视图就是frame的大小。
            //默认情况下tableview会自动计算出安全区域，也就是内容视图会从64或20(隐藏导航栏时)开始。适用视图控制器从导航底部开始的情况
        } else {
//            self.viewController.automaticallyAdjustsScrollViewInsets = NO; //默认是YES  iOS 11以下适配
        }
    return tableV;
}
-(UICollectionView*)addCollectionViewDelegate:(id)delegate collectionViewLayout:(UICollectionViewLayout *)layout{
    UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//    collectionV.backgroundColor = kCOLOR_BG_GRAY;
    collectionV.dataSource = delegate;
    collectionV.delegate = delegate;
    collectionV.showsVerticalScrollIndicator = NO;
    [self addSubview:collectionV];
    collectionV.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    return collectionV;
    
    /**
     [self.mainCollectionView registerNib:[UINib nibWithNibName:@"MenuIconCell" bundle:nil] forCellWithReuseIdentifier:@"MenuIconCell"];
     [self.mainCollectionView registerClass:[HomepageBannerCell class] forCellWithReuseIdentifier:@"HomepageBannerCell"];
     [self.mainCollectionView registerClass:[PageMenuCollectionViewCell class] forCellWithReuseIdentifier:@"PageMenuCollectionViewCell"];
     [self.mainCollectionView registerNib:[UINib nibWithNibName:@"HomeHotCell" bundle:nil] forCellWithReuseIdentifier:@"HomeHotCell"];
     
     */
}
@end
