//
//  BaseCollectionViewCell.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
+ (void)registerCell:(UICollectionView *)collectionView{
    if ((!collectionView) ||
           (![collectionView isKindOfClass:[UICollectionView class]])) {
           return;
       }
       [collectionView registerClass:self forCellWithReuseIdentifier:NSStringFromClass(self)];
}

+ (void)registerNibCell:(UICollectionView *)collectionView{
    if ((!collectionView) ||
           (![collectionView isKindOfClass:[UICollectionView class]])) {
           return;
       }
       [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(self)];
}
@end
