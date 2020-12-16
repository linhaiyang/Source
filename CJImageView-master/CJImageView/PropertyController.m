//
//  PropertyController.m
//  CJImageView
//
//  Created by shengkai li on 2020/6/23.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "PropertyController.h"
#import "LogInApi.h"
#import "RACObserveController.h"
#import "ClassifyApi.h"

#define  MRScreenWidth [UIScreen mainScreen].bounds.size.width
#define  MRScreenHeight [UIScreen mainScreen].bounds.size.height
@interface PropertyController ()<UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>
{
    @public
    int _no;
    int _age;
}
@property(copy,nonatomic)NSMutableString*aCopyMStr;
@property(strong,nonatomic)NSMutableString*strongMStr;
@property(weak,nonatomic)NSMutableString*weakMStr;
@property(assign,nonatomic)NSMutableString*assignMStr;
@property(nonatomic,assign)void * myTable;
@property(nonatomic,copy)NSArray * muAry;
@property(nonatomic,strong)UIScrollView * srcollView;
@property(nonatomic,strong)UIImageView * imageView;
@end

@implementation PropertyController

+(void)initialize{
    Dlog(@"initialize调用");
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = true;
    [self.navigationController.navigationBar setBarTintColor: UIColor.clearColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    CATransition
//    self.fd_prefersNavigationBarHidden = true;
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationController.navigationBar.translucent = true;
    self.fd_prefersBarTintColor = UIColor.clearColor;
    [self addTableView];
    if (@available(iOS 11.0, *)) {
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //加上这两句话，会让tableview的内容视图就是frame的大小。
        //默认情况下tableview会自动计算出安全区域，也就是内容视图会从64或20(隐藏导航栏时)开始。适用视图控制器从导航底部开始的情况
    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO; //默认是YES  iOS 11以下适配
    }
    LogInApi*request = [[LogInApi alloc] init];
    NSError *loadCacheError = nil;
    if ([request loadCacheWithError:&loadCacheError]) {
        id obj = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
    }
    [request startRequestWithCompletionBlockWithSuccess:^(BaseRequestService * _Nonnull batchRequest) {
        LoginModel * model = batchRequest.paraData;
//        [batchRequest saveResponseDataToCacheFile:batchRequest.responseData];
    } failure:^(YTKBaseRequest * _Nonnull batchRequest) {
        [MPRequstFailedHelper requstFailed:batchRequest];
    }];
    self.muAry = @[@"http://img.daimg.com/uploads/allimg/201103/1-2011031K128.jpg",
                   @"http://img.daimg.com/uploads/allimg/201104/1-201104000616.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-201103230950.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-201103230406.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-2011031QI2.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-2011031Q207.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031K128.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031JF0.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031IF9.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031H511.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-2011031GT2.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031G337.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031F914.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031F414.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-2011031A359.jpg",
                   @"http://img.daimg.com/uploads/allimg/201103/1-201103163558.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-201103155Z3.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-201103155216.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-201103142006.jpg",
                                  @"http://img.daimg.com/uploads/allimg/201103/1-201103140Z8.jpg",
                        @"http://img.daimg.com/uploads/allimg/201103/1-201103001308.jpg",
    @"http://img.daimg.com/uploads/allimg/201103/1-201103000Z9.jpg",
    @"http://img.daimg.com/uploads/allimg/201102/1-201102225936.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102224120.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-2011021P108.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102161K0.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102161115.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102155455.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102154U7.jpg",
                        @"http://img.daimg.com/uploads/allimg/201102/1-201102145608.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-2010291K411.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-2010291JH8.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-2010291H459.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-2010291G226.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-2010291F401.jpg",
                        @"http://img.daimg.com/uploads/allimg/201029/1-201029162106.jpg"
    ];
    @weakify(self);
    
    [[RACObserve(self.tableV, contentOffset) filter:^BOOL(id  _Nullable value) {
            return true;
    }] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        CGFloat offset = (CGFloat)[x CGSizeValue].height;
        if (offset>150) {
            self.navigationController.navigationBar.translucent = false;
            [self.navigationController.navigationBar setBarTintColor:KColorNavDefault];
        }else{
            self.navigationController.navigationBar.translucent = true;
            [self.navigationController.navigationBar setBarTintColor: UIColor.clearColor];
//            self.fd_prefersBarTintColor = UIColor.clearColor;
        }
    }];
//    RAC(self.tableV,)
    
}
-(void)addTableView{
    self.tableV = [self.view addTableViewDelegate:self];
    [self.tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(-0, 0, 0, 0));
    }];
    self.tableV.rowHeight = 50.f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.muAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [UITableViewCell registerCell:tableView];
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    [cell.imageView sd_setImageWithURL:self.muAry[indexPath.row] placeholderImage:[UIImage imageNamed:@"test_image_2"]options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        Dlog(@"%ld----SDWebImageLowPriority-----%ld",receivedSize,expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
//    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
}

@end
