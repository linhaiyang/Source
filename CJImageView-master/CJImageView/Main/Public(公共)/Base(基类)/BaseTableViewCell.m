//
//  BaseTableViewCell.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/16.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "BaseTableViewCell.h"
const NSString * tableViewIdentify = @"tableViewIdentify";

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)refreshCell:(id)model{};
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)registerNibCell:(UITableView *)tableView{
    if ((!tableView) ||
        (![tableView isKindOfClass:[UITableView class]])) {
        return nil;
    }
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

+ (instancetype)registerCell:(UITableView *)tableView{
    if ((!tableView) ||
        (![tableView isKindOfClass:[UITableView class]])) {
        return nil;
    }
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end
