//
//  ImageTableViewCell.m
//  CJImageView
//
//  Created by shengkai li on 2021/2/23.
//  Copyright © 2021 C.K.Lian. All rights reserved.
//

#import "ImageTableViewCell.h"


@interface ImageTableViewCell()<NSCoding>

@end


@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    NSCoder * coder = [NSCoder new];
//
//    NSArray * array = [NSArray new];
    
    /**
     
     NSArchiver、NSUnarchiver、NSKeyedArchiver、NSKeyUnarchiver和NSPortCoder。NSCoder具体的子类统一称作：编码器类，他们的实例化对象则成为编码器对象，一个编码器对象如果只编码就称做：编码对象，一个编码器对象如果只解码就称作解码对象。
     
     将对象转为二进制流，存储在磁盘中
     注：一般对数据存储时，使用归档/解档；对象需要满足NSCoding协议，对它
     进行数据编码转化成二进制流，存储于磁盘中；解档是将序列化数据转化成
     对象，回调新的对象出来；
     */
    
//    [NSKeyedArchiver archivedDataWithRootObject:nil requiringSecureCoding:YES error:nil];  //
    
    
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:testArray];
//        [data writeToFile:filePath atomically:YES];
}
-(void)KVO{
    /**
     KVO全称KeyValueObserving，是苹果提供的一套事件通知机制。允许对象监听另一个对象特定属性的改变，并在改变时接收到事件
     KVO和NSNotificationCenter都是iOS中观察者模式的一种实现。区别在于，相对于被观察者和观察者之间的关系，KVO是一对一的，而不一对多的。KVO对被监听对象无侵入性，不需要修改其内部代码即可实现监听。
     */
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
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
}
@end

