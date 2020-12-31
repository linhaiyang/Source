//
//  loadAinitializeTest.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "loadAinitializeTest.h"

@interface loadAinitializeTest()

@property(nonatomic,strong)UILabel * yyLabel;

@end


@implementation loadAinitializeTest
//- (void)initCSocket{
//    self.didSelecBlock = ^NSString * _Nonnull(NSString * _Nonnull blockT) {
//
//        return @"1";
//    };
//}
+ (void)dataWithBytesNoCopy:(void *)bytes{
    
}
- (void)initCSocket{
    UIViewController * controller=self.viewController;
    self.didSelecBlock = ^NSString * _Nonnull(NSString * _Nonnull blockT) {

        return @"1";
    };
}

-(void)layoutSubviews{
    [super layoutSubviews];
    Dlog(@"%f---layoutSubviews",self.ui_width);
    self.yyLabel.frame = CGRectMake(0, 0, self.ui_width, self.ui_height);
//    [self.yyLabel sizeToFit];
    /**
     1、init初始化不会触发layoutSubviews
     但是是用initWithFrame 进行初始化时，当rect的值不为CGRectZero时,也会触发
     */
}
-(CGSize)intrinsicContentSize{
    Dlog(@"intrinsicContentSize");
    return CGSizeMake(100, 50);
}

-(void)drawRect:(CGRect)rect{
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, UIColor.blueColor, NSForegroundColorAttributeName, nil];
            
//    [@"我的zzzzzzzzzzzzzzzzzz" drawAtPoint:CGPointZero withAttributes:attrs];//不会换行
    [@"我的我的我的我的" drawInRect:CGRectMake(0, 10, rect.size.width, rect.size.height) withAttributes:attrs];
}
- (CGSize)sizeThatFits:(CGSize)size{
    Dlog(@"sizeThatFits");
    /**
     sizeToFit:会计算出最优的 size 而且会改变自己的size
     sizeThatFits:会计算出最优的 size 但是不会改变 自己的 size
     
     */
    CGSize s = [super sizeThatFits:size];
    s.height = s.height + 10.f;
    return s;
}


-(instancetype)init{
    self = [super init];
    self.yyLabel = [[UILabel alloc]init];
//    self.yyLabel.text = @"YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试";
    self.yyLabel.numberOfLines = 0;
    [self addSubview:self.yyLabel];
    return self;
}

+(void)initializeTestBegin{
    
    NSString * string = @"loadAinitializeTest";
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte byte[] = {1,2,3,4,5,6,7,8,9,10};
    NSData *byteData = [[NSData alloc] initWithBytes:byte length:10];
    
    //NSData 转换成 Byte
    Byte *testByte = (Byte *)[data bytes];//\x01\x02\x03\x04\x05\x06\a\b\t\n
    
    
    /**
     7b22636f 6465223a 3230302c 22646174 61223a7b 226e6f74 69636522 3a312c22 6269675f 6164223a 7b226964 223a2233 39353922 2c227469 746c6522 3a22222c 2275726c 223a2238 38222c22 696d675f 75726c22 3a22222c 22736f72 74223a22 30222c22 706f7369 74696f6e 5f696422 3a223330 39222c22 69735f70
     
     */
}




@end
