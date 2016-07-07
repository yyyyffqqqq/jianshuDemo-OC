//
//  CollectionViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionCellImageView.h"
#import "HomeHorizontalClass.h"

@protocol HorizontalScrollViewDelegate <NSObject>

- (void)selectItemAtIndex:(NSInteger)index;

@end


@interface HorizontalScrollView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

//@property (nonatomic, strong) NSArray<NSString*> *images;
//@property (nonatomic, strong) NSArray *itemTitles;

@property (nonatomic, strong) NSArray<HomeHorizontalClass*> *horizontalItems;

/// scroll 速度
@property (nonatomic, assign) BOOL acuteScroll;

@property (nonatomic, assign) BOOL showIndicator;

@property (nonatomic, weak) id<HorizontalScrollViewDelegate> delegate;


- (void)updateData;



@end
