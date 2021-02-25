//
//  loadAinitializeTest.m
//  CJImageView
//
//  Created by shengkai li on 2020/11/9.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "loadAinitializeTest.h"



@interface loadLabel : UILabel
@end

@implementation loadLabel

- (CGSize)sizeThatFits:(CGSize)size{
    CGSize s = [super sizeThatFits:size];
    s.height = s.height + 10.f;
    return s;
}
-(CGSize)intrinsicContentSize{
    CGSize size = [self sizeThatFits:CGSizeMake(self.ui_width, 0)];
    return CGSizeMake(size.width, size.height+30);
}
@end


@interface loadAinitializeTest()

@property(nonatomic,strong)UILabel * yyLabel;
@property(nonatomic,copy)NSString * name;

@end


@implementation loadAinitializeTest

-(void)dealloc{
    Dlog(@"testDealloc");
//    AutoreleasePoolPage
}

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
    
    self.yyLabel.origin = CGPointMake(0, 0 );

    self.yyLabel.frame = CGRectMake(0, 0, self.ui_width, 0);
    
    [self.yyLabel sizeToFit];//-------会调用label 的- (CGSize)sizeThatFits:(CGSize)size方法
    Dlog(@"%f---layoutSubviews",self.yyLabel.intrinsicContentSize.height);
//    self.yyLabel.frame = CGRectZero;
    //触发label 的 sizeThatFits方法
    /**
     1、init初始化不会触发layoutSubviews
     但是是用initWithFrame 进行初始化时，当rect的值不为CGRectZero时,也会触发
     */
}
/**
 在AutoLayout中，它作为UIView的属性（不是语法上的属性），意思就是说我知道自己的大小，如果你没有为我指定大小，我就按照这个大小来。
 
 */
-(CGSize)intrinsicContentSize{
    CGSize size = [self.yyLabel sizeThatFits:CGSizeMake(self.ui_width, 0)];
    return CGSizeMake(size.width, size.height+30);
}

-(void)drawRect:(CGRect)rect{
//    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, UIColor.blueColor, NSForegroundColorAttributeName, nil];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//       UIImage *image = [UIImage imageNamed:@"test_image_2.png"];
//       CGRect rect1 = CGRectMake(30, 50, 100.0, 100.0);
//    drawImage(context, [image CGImage], rect1);
    
//    [self FXWithCornerRadius:10 backGroundColor:UIColor.redColor rect:rect];
    
    
//    [@"我的zzzzzzzzzzzzzzzzzz" drawAtPoint:CGPointZero withAttributes:attrs];//不会换行
//    [@"我的abc123456" drawInRect:CGRectMake(0, 10, rect.size.width, rect.size.height) withAttributes:attrs];
}
void drawImage(CGContextRef context, CGImageRef image , CGRect rect){
    CGContextSaveGState(context);

    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    CGContextDrawImage(context, rect, image);

    CGContextRestoreGState(context);
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
//-(id)copyWithZone:(NSZone *)zone{
//    loadAinitializeTest * test = [[loadAinitializeTest allocWithZone:zone]init];
//    return test;
//}

-(instancetype)init{
    self = [super init];
    self.clipsToBounds = true;
    self.backgroundColor = UIColor.blueColor;
    self.yyLabel = [[loadLabel alloc]init];
    @weakify(self);
    self.yyLabel.userInteractionEnabled = true;
    [self.yyLabel addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
        @strongify(self);
        [self willChangeValueForKey:@"name"];
        self.name = @"name";
        [self didChangeValueForKey:@""];
    }];
    
    
    
    self.yyLabel.text = @"YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试";
    self.yyLabel.numberOfLines = 0;
    [self addSubview:self.yyLabel];
    [loadAinitializeTest initializeTestBegin];
    return self;
}

+(void)initializeTestBegin{
    
    NSString * string = @"loadMy";
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    Byte byte[] = {1,2,3,4,5,6,7,8,9,10};
    NSData *byteData = [[NSData alloc] initWithBytes:byte length:10];
    
    //NSData 转换成 Byte
    Byte *testByte = (Byte *)[byteData bytes];//\x01\x02\x03\x04\x05\x06\a\b\t\n
    
    NSString *hexStr=@"";
       for(int i=0;i<[byteData length];i++) {
           NSString *newHexStr = [NSString stringWithFormat:@"%x",testByte[i]&0xff]; //16进制数
           if([newHexStr length]==1) {
               hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
           } else {
               hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
           }
       }
//6c6f616400000000fb07
    /**
     7b22636f 6465223a 3230302c 22646174 61223a7b 226e6f74 69636522 3a312c22 6269675f 6164223a 7b226964 223a2233 39353922 2c227469 746c6522 3a22222c 2275726c 223a2238 38222c22 696d675f 75726c22 3a22222c 22736f72 74223a22 30222c22 706f7369 74696f6e 5f696422 3a223330 39222c22 69735f70
     
     */
}




@end



