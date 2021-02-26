//
//  HomeViewController.m
//  CJImageView
//
//  Created by shengkai li on 2020/10/13.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "HomeViewController.h"
#import "loadAinitializeTest.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIColor+Gradient.h"
#import "NSString+Encrypt.h"
#import "NSString+hash.h"
#import "NSString+Base64.h"

typedef NSString * NSStringResourceKey NS_STRING_ENUM;

UIImage* coverImage(){
        static UIImage *image;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            CGSize size =CGSizeMake(141, 60);
            CGFloat kPadding = YYTextCGFloatPixelHalf(6.0),kRadius = 5.f;
            CGFloat kHeight = 32.0;
            CGFloat kArrow =14.0;
            CGRect rect = (CGRect) {.size = size, .origin = CGPointZero};
            
            UIGraphicsBeginImageContextWithOptions(size, NO, 0);
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            CGPathRef boxPath = CGPathCreateWithRect(rect, NULL);
            
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, kPadding + kRadius, kPadding);
            CGPathAddLineToPoint(path, NULL, size.width - kPadding - kRadius, kPadding);
            CGPathAddQuadCurveToPoint(path, NULL, size.width - kPadding, kPadding, size.width - kPadding, kPadding + kRadius);
            CGPathAddLineToPoint(path, NULL, size.width - kPadding, kHeight);
            CGPathAddCurveToPoint(path, NULL, size.width - kPadding, kPadding + kHeight, size.width - kPadding - kRadius, kPadding + kHeight, size.width - kPadding - kRadius, kPadding + kHeight);
            CGPathAddLineToPoint(path, NULL, size.width / 2 + kArrow, kPadding + kHeight);
            CGPathAddLineToPoint(path, NULL, size.width / 2, kPadding + kHeight + kArrow);
            CGPathAddLineToPoint(path, NULL, size.width / 2 - kArrow, kPadding + kHeight);
            CGPathAddLineToPoint(path, NULL, kPadding + kRadius, kPadding + kHeight);
            CGPathAddQuadCurveToPoint(path, NULL, kPadding, kPadding + kHeight, kPadding, kHeight);
            CGPathAddLineToPoint(path, NULL, kPadding, kPadding + kRadius);
            CGPathAddQuadCurveToPoint(path, NULL, kPadding, kPadding, kPadding + kRadius, kPadding);
            CGPathCloseSubpath(path);
            
            CGMutablePathRef arrowPath = CGPathCreateMutable();
            CGPathMoveToPoint(arrowPath, NULL, size.width / 2 - kArrow, YYTextCGFloatPixelFloor(kPadding) + kHeight);
            CGPathAddLineToPoint(arrowPath, NULL, size.width / 2 + kArrow, YYTextCGFloatPixelFloor(kPadding) + kHeight);
            CGPathAddLineToPoint(arrowPath, NULL, size.width / 2, kPadding + kHeight + kArrow);
            CGPathCloseSubpath(arrowPath);
            
            // inner shadow
            CGContextSaveGState(context); {
                CGFloat blurRadius = 25;
                CGSize offset = CGSizeMake(0, 15);
                CGColorRef shadowColor = [UIColor colorWithWhite:0 alpha:0.16].CGColor;
                CGColorRef opaqueShadowColor = CGColorCreateCopyWithAlpha(shadowColor, 1.0);
                CGContextAddPath(context, path);
                CGContextClip(context);
                CGContextSetAlpha(context, CGColorGetAlpha(shadowColor));
                CGContextBeginTransparencyLayer(context, NULL); {
                    CGContextSetShadowWithColor(context, offset, blurRadius, opaqueShadowColor);
                    CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                    CGContextSetFillColorWithColor(context, opaqueShadowColor);
                    CGContextAddPath(context, path);
                    CGContextFillPath(context);
                } CGContextEndTransparencyLayer(context);
                CGColorRelease(opaqueShadowColor);
            } CGContextRestoreGState(context);

            // outer shadow
            CGContextSaveGState(context); {
                CGContextAddPath(context, boxPath);
                CGContextAddPath(context, path);
                CGContextEOClip(context);
                CGColorRef shadowColor = [UIColor colorWithWhite:0 alpha:0.32].CGColor;
                CGContextSetShadowWithColor(context, CGSizeMake(0, 1.5), 3, shadowColor);
                CGContextBeginTransparencyLayer(context, NULL); {
                    CGContextAddPath(context, path);
                    [[UIColor colorWithWhite:0.7 alpha:1.000] setFill];
                    CGContextFillPath(context);
                } CGContextEndTransparencyLayer(context);
            } CGContextRestoreGState(context);
////
////            // arrow
            CGContextSaveGState(context); {
                CGContextAddPath(context, arrowPath);
                [[UIColor colorWithWhite:1 alpha:0.95] set];
                CGContextFillPath(context);
            } CGContextRestoreGState(context);
//
//            // stroke
            CGContextSaveGState(context); {
                CGContextAddPath(context, path);
                [[UIColor blueColor] setStroke];
                CGContextSetLineWidth(context, YYTextCGFloatFromPixel(1));
                CGContextStrokePath(context);
            } CGContextRestoreGState(context);
            
            CFRelease(boxPath);
            CFRelease(path);
            CFRelease(arrowPath);
            
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
        });
        return image;
}


@interface HomeViewController ()
{
    YYLabel *      _titleLabel;
}
@property(nonatomic,copy)NSString * muStr;
@end

@implementation HomeViewController
@synthesize muStr=must;
-(void)setMuStr:(NSString *)muStr{
//    _muStr = muStr;
    must = muStr;
    Dlog(@"111111");
}




/***/
- (void)viewDidLoad  {
    [super viewDidLoad];
//    YYTextMagnifier
    NSString *string = @"Lorem    ipsum dolar   sit  amet.";
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    NSArray *components = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
    
    
    
    NSDate * date = [NSDate new];
    
    
    
    NSInteger year = date.year;
    NSInteger month = date.month;
    NSInteger day = date.day;
    NSInteger hour = date.hour;
    NSInteger min = date.minute;
    NSInteger second = date.second;
    NSString * dateStr = [date stringWithFormat:@"yyyyMMdd HHmmss"];
    
    NSDate * currentDate = [NSDate dateWithString:dateStr
                                           format:@"yyyyMMdd HHmmss"];
    
    Class class1=objc_getClass("HomeViewController");
    Class class2=object_getClass(class1);
    Class class3=object_getClass(class2);
    Class class4=object_getClass(class3);
    Class class5=object_getClass(class4);
    NSLog(@"%p time isa points to address: %p  %p  %p  %p",class1,class2,class3,class4,class5);
    
    

    _titleLabel = [YYLabel new];
    _titleLabel.ui_size = CGSizeMake(kScreenWidth - 100, 30);
//    _titleLabel.left = kWBCellPadding;
    _titleLabel.origin = CGPointMake(10, 100);
    _titleLabel.displaysAsynchronously = YES;
    _titleLabel.ignoreCommonProperties = YES;
    _titleLabel.fadeOnHighlight = NO;
    _titleLabel.fadeOnAsynchronouslyDisplay = NO;
    [self.view addSubview:_titleLabel];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"热门热门热门热门热门热门热门热门热门热门热门热门"];
    
    text.yy_color = UIColorHex(929292);
    text.yy_font = [UIFont systemFontOfSize:14];
    
    
    UIImage *blueVImage = [UIImage YYImageNamed:@"error"];
    
    NSMutableAttributedString *blueVText = [NSMutableAttributedString yy_attachmentStringWithContent:blueVImage contentMode:UIViewContentModeCenter attachmentSize:blueVImage.size alignToFont:[UIFont systemFontOfSize:14] alignment:YYTextVerticalAlignmentCenter];
    
//        NSAttributedString *blueVText = [self _attachmentWithFontSize:kWBCellNameFontSize image:blueVImage shrink:NO];
//    [text appendString:@" "];
    [text appendAttributedString:blueVText];
    
    
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(100, 30)];
    container.maximumNumberOfRows = 0;
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout*titleTextLayout = [YYTextLayout layoutWithContainer:container text:text];
    
    _titleLabel.textLayout = titleTextLayout;
    CGFloat  width=titleTextLayout.textBoundingRect.size.width;
    
    _titleLabel.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
    };
    
//    UIImageView * img = [[UIImageView alloc]init];
//    img.image = coverImage();
//    img.size = CGSizeMake(141, 60);
//    img.center = self.view.center;
//    [self.view addSubview:img];
    
    
//    [layer addAnimation:animationGroup forKey:@"progress"];
    
    /**
     // 高亮状态的背景
     YYTextBorder *highlightBorder = [YYTextBorder new];
     highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -2, 0);
     highlightBorder.cornerRadius = 2;
     highlightBorder.fillColor = kWBCellTextHighlightBackgroundColor;
     
     [text setColor:kWBCellTextHighlightColor range:text.rangeOfAll];
     
     // 高亮状态
     YYTextHighlight *highlight = [YYTextHighlight new];
     [highlight setBackgroundBorder:highlightBorder];
     // 数据信息，用于稍后用户点击
     highlight.userInfo = @{kWBLinkTagName : tag};
     [text setTextHighlight:highlight range:text.rangeOfAll];
     
     */
    /**
     1.1 ARC以后引入了__weak的概念来修饰Objective-C对象,使用这个关键字修饰的对象,对象的引用计数不会+1,这个关键字和__unsafe_unretained有些类似,只是在对象释放的时候__weak会将引用的对象置为nil,而__unsafe_unretained不会,这将会导致野指针的产生,所以一般情况下,我们一般不属于强引用某个对象的时候,可以使用__weak进行修饰,典型的例子就是代理
     */
    NSObject *obj = [[NSObject alloc] init];//<NSObject: 0x6000009344e0>
    id __weak obj1 = obj;//(id) obj1 = 0x00007fff6151f55a
    id __weak obj2 = obj;//(id) obj2 = 0x00007fff20176310
}

-(void)addsub:(NSStringResourceKey)resoure{}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
NSStringResourceKey const NSStringResourceKeyNamedPipe;
NSStringResourceKey const NSStringResourceKeyUserPipe;
@end
