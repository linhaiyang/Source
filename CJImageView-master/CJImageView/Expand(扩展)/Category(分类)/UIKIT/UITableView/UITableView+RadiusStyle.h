//
//  UITableView+RadiusStyle.h
//  CJImageView
//
//  Created by shengkai li on 2020/9/14.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RadiusStyle)
/**
 *  @brief  ios7设置页面的UITableViewCell样式
 *
 *  @param cell      cell
 *  @param indexPath indexPath
 */
-(void)applyRadiusSettingsStyleGrouping:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
