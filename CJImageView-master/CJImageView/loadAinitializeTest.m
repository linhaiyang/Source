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

- (void)initCSocket{
    UIViewController * controller=self.viewController;
    self.didSelecBlock = ^NSString * _Nonnull(NSString * _Nonnull blockT) {

        return @"1";
    };
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    UITextField * txf;
    
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
//    [self.yyLabel addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
//        @strongify(self);
//        [self willChangeValueForKey:@"name"];
//        self.name = @"name";
//        [self didChangeValueForKey:@""];
//    }];
    
//    @weakify(self);
    [self.yyLabel addLongPressGestureRecognizer:^(UILongPressGestureRecognizer *recognizer, NSString *gestureId) {
        @strongify(self);
        [self becomeFirstResponder];
    }];
    
        KeyBoardView * keyBoard = [[KeyBoardView alloc]init];
        [self addSubview:keyBoard];
        keyBoard.frame = CGRectMake(100, 200, 100, 50);
        keyBoard.text = @"keyborad";
    
    self.yyLabel.text = @"YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试YYLabel 测试";
    self.yyLabel.numberOfLines = 0;
    [self addSubview:self.yyLabel];
    [loadAinitializeTest initializeTestBegin];
    
        [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(becomeFirstRes)]];

    
    return self;
}

+(void)initializeTestBegin{
    
    NSString * string = @"严";//<6c6f6164 4d79><e4b8a5>
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

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(myCut::) ||
        action == @selector(myPaste::)) {
        return true;
    }
//    if (action == @selector(copy:)) {
//        return true;
//    }
    
    
    return [super canPerformAction:action withSender:sender];;
}
-(void)becomeFirstRes{
    NSLog(@"%s",__func__);
    
    //1.设置label为第一响应者
    //通过设置第一响应者UIMenuController可以获得支持哪些操作的信息,操作怎么处理
    [self becomeFirstResponder];
    
    //2.设置UIMenuController
    UIMenuController * menu = [UIMenuController sharedMenuController];
    
    //自定义 UIMenuController
    
    UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"剪切" action:@selector(myCut:)];
    UIMenuItem * item2 = [[UIMenuItem alloc]initWithTitle:@"粘贴" action:@selector(myPaste:)];
    menu.menuItems = @[item1,item2];
    
    NSLog(@"%d",menu.isMenuVisible);
    //当长按label的时候，这个方法会不断调用，menu就会出现一闪一闪不断显示，需要在此处进行判断
    if (menu.isMenuVisible)return;
    /**
     *  设置UIMenuController的显示相关信息
     *
     *  @param targetRect UIMenuController 需要指向的矩形框
     *  @param targetView targetRect会以targetView的左上角为坐标原点进行显示
     */
//    - (void)setTargetRect:(CGRect)targetRect inView:(UIView *)targetView;
    [menu setTargetRect:self.bounds inView:self];
//    [menu setTargetRect:self.frame inView:self.superview];
    
    [menu setMenuVisible:YES animated:YES];
    
}
- (void)pressesEnded:(NSSet<UIPress *> *)presses withEvent:(nullable UIPressesEvent *)event API_AVAILABLE(ios(9.0)){
    [self becomeFirstResponder];
}

-(void)select:(id)sender{
    
}
-(void)copy:(id)sender{
    
}
- (void)myCut:(UIMenuController *)menu
{
    //当没有文字的时候调用这个方法会崩溃
     if (!self.yyLabel.text) return;
    //复制文字到剪切板
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    paste.string = self.yyLabel.text;

}

- (void)myPaste:(UIMenuController *)menu
{
    //将剪切板文字赋值给label
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    self.yyLabel.text = paste.string;
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}

@end






@implementation KeyBoardView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    [self addGestureRecognizer:tap];
}
- (void)tapGes:(UITapGestureRecognizer *)ges{
    [self becomeFirstResponder];
}
-(UIView *)inputAccessoryView{
    if(!_inputAccessoryView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
        view.backgroundColor = [UIColor grayColor];

        UIToolbar *toolBar = [[UIToolbar alloc]init];
        toolBar.frame = CGRectMake(0, 0, 100, 44);
        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dodo)];
        toolBar.items = [NSArray arrayWithObject:right];
        
        [view addSubview:toolBar];
        return view;
    }
    return _inputAccessoryView;
}
-(void)dodo{
    [self resignFirstResponder];
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}
//-(UIPickerView *)inputView{
//    if(!_inputView)
//    {
//        UIPickerView *  pickView = [[UIPickerView alloc]init];
////        pickView.delegate =self;
////        pickView.dataSource = self;
//        pickView.showsSelectionIndicator = YES;
//        return pickView;
//    }
//    return _inputView;
//}

//-(UIPickerView *)inputView{
//    if(!_inputView)
//    {
//        UIPickerView *  pickView = [[UIPickerView alloc]init];
////        pickView.delegate =self;
////        pickView.dataSource = self;
//        pickView.showsSelectionIndicator = YES;
//        return pickView;
//    }
//    return _inputView;
//}
@end
