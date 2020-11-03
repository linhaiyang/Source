//
//  CommonFlowLayout.m
//  CJImageView
//
//  Created by shengkai li on 2020/9/1.
//  Copyright © 2020 C.K.Lian. All rights reserved.
//

#import "CommonFlowLayout.h"

@interface CommonFlowLayout()
@property (nonatomic, weak) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic, strong) NSMutableArray *itemAttributes;
@property (nonatomic, assign) CGFloat contentWidth;//滑动宽度 水平
@property (nonatomic, assign) CGFloat contentHeight;//滑动高度 垂直
@property(nonatomic,assign)int colunms;//列数
@property(nonatomic,strong)NSMutableArray *frameYa;
@end


@implementation CommonFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = 5.0f;
        self.minimumLineSpacing = 5.0f;
        self.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
        CGFloat width = (KScreen_Width - self.sectionInset.left - self.sectionInset.right-self.minimumLineSpacing-1)/2;
        self.itemSize = CGSizeMake(width, 0.0f);
        self.colunms = 2;
    }
    return self;
}
#pragma mark -

- (void)prepareLayout
{
    [super prepareLayout];
     //计算每个cell的宽度
     self.minimumLineSpacing = 5;
     self.minimumInteritemSpacing = 5;
    [self.frameYa removeAllObjects];
         for (int i = 0; i<self.colunms; i++) {
             self.frameYa[i] = @(self.sectionInset.top);
         }
    // 清除之前所有的布局属性
       [self.itemAttributes removeAllObjects];
    // 1.创建每个item的属性
    // 获取第0section的item个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //遍历数组m，创建数组那么多的UICollectionViewLayoutAttributes
    for(int i = 0;i<count;i++){
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:index];
        [self.itemAttributes addObject:attributes];
    }
    self.contentHeight += self.sectionInset.bottom;
}
// 设置单个item的属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 1. 常见item属性
       UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //计算每个cell的高度
    CGSize itemSize = [self itemSizeForIndexPath:indexPath];
    CGFloat itemW = itemSize.width;
    CGFloat itemH = itemSize.height;

    // 假如最短的那列为第0列
    NSInteger minColumn = 0;
       // 这里要注意数组越界（一开始数组里面先初始化值）
    CGFloat minColumnHeight = [self.frameYa[0] doubleValue]; // 最短那列的高度
    // 通过比较获取实际最短的那列高度
    for (NSInteger i=1; i<self.colunms; i++) {
         // 获取第i列的高度
         CGFloat columnHeight = [self.frameYa[i] doubleValue];
         // 比较并找出最短列
         if (minColumnHeight > columnHeight) {
             minColumnHeight = columnHeight;
             minColumn = i;
         }
     }
    // 获取x、y
      CGFloat x = self.sectionInset.left + minColumn * (itemW + self.minimumInteritemSpacing);
      CGFloat y = minColumnHeight;
      // 判断是否是在第一行，如果不是，就增加行间距
      if (y != self.sectionInset.top) {
          y += self.self.minimumLineSpacing;
      }
      
      // 设置frame
      attr.frame = CGRectMake(x, y, itemW, itemH);
    
    // 更新最短那列
       self.frameYa[minColumn] = @(CGRectGetMaxY(attr.frame));
       
       // 记入内容的高度
       CGFloat contentH = [self.frameYa[minColumn] doubleValue];
       if (self.contentHeight < contentH) {
           self.contentHeight = contentH;
       }
    return attr;
}
- (CGSize)collectionViewContentSize
{
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
    } else {
        return CGSizeMake(self.contentWidth,self.collectionView.frame.size.height);
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.itemAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds)) {
        return YES;
    }
    
    return NO;
}

#pragma mark -

- (id<UICollectionViewDelegateFlowLayout>)delegate
{
    if (_delegate == nil) {
        _delegate =  (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    }
    
    return _delegate;
}

- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    return self.itemSize;
}

#pragma mark - 懒加载

//UICollectionViewLayoutAttributes数组
- (NSMutableArray *)itemAttributes {
    if (!_itemAttributes) {
        _itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}
- (NSMutableArray *)frameYa{
    if(!_frameYa){
        _frameYa = [NSMutableArray array];
    }
    return _frameYa;
}
@end
