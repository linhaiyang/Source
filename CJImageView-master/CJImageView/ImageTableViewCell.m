//
//  ImageTableViewCell.m
//  CJImageView
//
//  Created by shengkai li on 2021/2/23.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    UIView * imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake((kScreenWidth-140)/2, 10, 140, 140);
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];
    self.mainImageView  =  imageView;
    
    return self;
}
@end
