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
    tableV.delegate = delegate;
    tableV.dataSource = delegate;
//    tableV.backgroundColor = kCOLOR_BG_GRAY;
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableV.estimatedRowHeight = 0;
    tableV.estimatedSectionFooterHeight = 0;
    tableV.estimatedSectionHeaderHeight = 0;
    [self addSubview:tableV];
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
