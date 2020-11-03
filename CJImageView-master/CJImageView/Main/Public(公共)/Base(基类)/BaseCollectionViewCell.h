//
//  BaseCollectionViewCell.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewCell : UICollectionViewCell
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
