//
//  CollectionViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "HorizontalScrollView.h"

#import "PublicClass.h"

NSString * const CELL_ID  = @"Cell";
CGFloat const LAYOUT_ITEM_OFFSET = 20.0;


@interface CollectionLayout : UICollectionViewFlowLayout

//@property (nonatomic, assign) BOOL enableSelect;

@end

@interface CollectionCell : UICollectionViewCell

@property (nonatomic, strong) CollectionCellImageView *collectionImageItem;


@end

@interface HorizontalScrollView() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSInteger _centerIndex;
}
@property (nonatomic, strong) CollectionLayout *collectionLayout;

@property CGFloat widthMargin_imageView_nameLabel; //图片与文本的水平间距

@property CGSize contentViewSize; //每个项的大小

@property CGSize imageSize ;//图片大小


@end


# pragma mark - implementation

@implementation HorizontalScrollView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    
    return self;
}

-(void)setHorizontalItems:(NSMutableArray<HomeHorizontalClass *> *)horizontalItems {
    _horizontalItems = horizontalItems;
    [self updateData];
}


# pragma mark - private func
// set default
- (void)initData {
    
    _acuteScroll = YES;
    _showIndicator = NO;
    
    _collectionLayout = [[CollectionLayout alloc] init];
    _collectionView = nil;
}

- (void)initView {
    CGRect rct = self.bounds;
    
    if (_collectionView) {
        [_collectionView removeFromSuperview];
        _collectionView = nil;
    }
    _collectionView = [[UICollectionView alloc] initWithFrame:rct collectionViewLayout:_collectionLayout];
    
    
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _collectionView.showsHorizontalScrollIndicator = _showIndicator;
    _collectionView.decelerationRate = _acuteScroll ? UIScrollViewDecelerationRateNormal : UIScrollViewDecelerationRateFast;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:CELL_ID];
    
    [self addSubview:_collectionView];
    
    _imageSize = CGSizeMake(rct.size.height*0.2, rct.size.height*0.2);
    
    _widthMargin_imageView_nameLabel = rct.size.height*0.1;
    
    _contentViewSize = CGSizeMake(_collectionView.bounds.size.width*0.3, _collectionView.bounds.size.height*0.5);
    
}


# pragma mark - CollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return _images.count;
    return _horizontalItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    
//    cell.collectionImageItem.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
//    cell.collectionImageItem.nameLabel.text = _itemTitles[indexPath.row];
    
    cell.collectionImageItem.imageView.image = [UIImage imageNamed:_horizontalItems[indexPath.row].imageUrl];
    cell.collectionImageItem.nameLabel.text = _horizontalItems[indexPath.row].titleString;
    cell.collectionImageItem.image = [UIImage imageNamed:_horizontalItems[indexPath.row].backgroundImageUrl];
    
    CGSize size = CGSizeMake(cell.collectionImageItem.frame.size.width-_widthMargin_imageView_nameLabel-_imageSize.width, _imageSize.height);
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:12]};
    CGSize labelWidth = [PublicClass boolLabelLength:cell.collectionImageItem.nameLabel.text size:size option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
    
    cell.collectionImageItem.imageView.frame = CGRectMake((cell.collectionImageItem.frame.size.width-labelWidth.width-_widthMargin_imageView_nameLabel-_imageSize.width)*0.5, (cell.collectionImageItem.frame.size.height-_imageSize.height)*0.5, _imageSize.width, _imageSize.height);
    
    cell.collectionImageItem.nameLabel.frame = CGRectMake(_widthMargin_imageView_nameLabel+_imageSize.width+cell.collectionImageItem.imageView.frame.origin.x, (cell.collectionImageItem.frame.size.height-_imageSize.height)*0.5, labelWidth.width, _imageSize.height);
    
    cell.collectionImageItem.nameLabel.font = [UIFont systemFontOfSize:12];
    cell.collectionImageItem.nameLabel.adjustsFontSizeToFitWidth = YES;
    cell.collectionImageItem.backgroundColor = [UIColor whiteColor];
    
//    cell.collectionImageItem.nameLabel.backgroundColor = [UIColor greenColor];
//    cell.collectionImageItem.imageView.backgroundColor = [UIColor blueColor];

    return cell;
}

# pragma mark - CollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(selectItemAtIndex:)]) {
        [_delegate selectItemAtIndex:indexPath.item];
    }
}


# pragma mark - CollectionViewFlowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return _contentViewSize;
    
}

//Asks the delegate for the margins to apply to content in the specified section.
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

- (void)updateData {
    [self initData];
    [self initView];
}


@end







# pragma mark - CollectionViewLayout
@implementation CollectionLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumInteritemSpacing = LAYOUT_ITEM_OFFSET * 2;
    }
    return self;
}

// return YES to cause the collection view to recall prepareLayout and layoutAttributesForElementsInRect
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


@end


#pragma mark - CollectionCell
@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    self.layer.doubleSided = NO;
    
    _collectionImageItem = [[CollectionCellImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    
//    _collectionImageItem.image = [UIImage imageNamed:@"h1"];
//    _collectionImageItem.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:_collectionImageItem];
    

}




@end




