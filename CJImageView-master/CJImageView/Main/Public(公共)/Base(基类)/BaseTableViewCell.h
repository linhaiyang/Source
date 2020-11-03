//
//  BaseTableViewCell.h
//  CJImageView
//
//  Created by shengkai li on 2020/6/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN const NSString * tableViewIdentify;

@interface BaseTableViewCell : UITableViewCell
/**
 注册"Cell"
 
 @param collectionView  tableView视图
 */
+ (instancetype)registerNibCell:(UITableView *)tableView;

+ (instancetype)registerCell:(UITableView *)tableView;

-(void)refreshCell:(id)model;
@end

NS_ASSUME_NONNULL_END
