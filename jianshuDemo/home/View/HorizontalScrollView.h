//
//  CollectionViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionCellImageView.h"

@protocol HorizontalScrollViewDelegate <NSObject>

- (void)selectItemAtIndex:(NSInteger)index;

@end


@interface HorizontalScrollView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

/// array of images' name
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *itemTitles;

/// scroll speed
@property (nonatomic, assign) BOOL acuteScroll;

/// show scroll indicator
@property (nonatomic, assign) BOOL showIndicator;

@property (nonatomic, weak) id<HorizontalScrollViewDelegate> delegate;


- (void)updateData;


@end
