//
//  HomeTableHeaderView.h
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HorizontalScrollView.h"
#import "SDCycleScrollView.h"
#import "Masonry.h"


@interface HomeTableHeaderView : UIView<SDCycleScrollViewDelegate>

@property (nonatomic, strong) MASConstraint *topConstraint;

@property (strong, nonatomic) HorizontalScrollView *horizontalScrollView;  //横向滚动视图
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView; //图片轮播

@property (strong, nonatomic) UISearchBar *searchBar;

@property (strong, nonatomic) UIImageView *hotArticleImageView; //热门文章图标；
@property (strong, nonatomic) UIButton *hotArticleLabel; //热门文章标签；

@property (strong, nonatomic) UIImageView *homePageImageView;  //首页投稿图标；
@property (strong, nonatomic) UIButton *homePageLabel;  //首页投稿标签；

@end
