//
//  UIView+AddSubViewS.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AddSubView)
-(UILabel*)addUILabelWithtext:(NSString*)text font:(UIFont*)font textColor:(UIColor*)textColor;
-(UIButton *)addUIButtonWithFont:(UIFont*)font titleColor:(UIColor*)textColor title:(NSString*)title;
-(UITableView*)addTableViewDelegate:(id)delegate;
-(UICollectionView*)addCollectionViewDelegate:(id)delegate;
@end

NS_ASSUME_NONNULL_END
