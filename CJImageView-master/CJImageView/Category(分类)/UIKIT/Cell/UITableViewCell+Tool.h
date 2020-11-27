//
//  UITableViewCell+Tool.h
//  CJImageView
//
//  Created by shengkai li on 2020/7/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Tool)
//cell 添加圆角
-(void)addCornerRedius:(CGFloat)redius backGroundColor:(UIColor *)backGroundColor;

+ (instancetype)registerCell:(UITableView *)tableView;

+(instancetype)registerNibCell:(UITableView *)tableView;

-(void)refreshCell:(id)model;
@end


@interface UICollectionViewCell (Tool)
/**
 注册"Cell"
 
 @param collectionView  集合视图
 */
+ (void)registerCell:(UICollectionView *)collectionView;

/**
 注册"Cell"
 
 @param collectionView  集合视图
 */
+ (void)registerNibCell:(UICollectionView *)collectionView;

-(void)refreshCell:(id)model;
@end

NS_ASSUME_NONNULL_END
