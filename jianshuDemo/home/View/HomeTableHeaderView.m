//
//  HomeTableHeaderView.m
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "HomeTableHeaderView.h"

CGFloat const cycleScrollViewHeight = 0.5;  // 占比
CGFloat const horizontalScrollViewHeight = 0.25;  // 占比
CGFloat const searchBarHeight = 0.13;  // 占比
CGFloat const hotArticleImageViewHeight = 0.12;// 占比

@implementation HomeTableHeaderView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
//    NSArray *imageNames_1 = @[@"h1.jpg",
//                            @"h2.jpg",
//                            @"h3.jpg"// 本地图片请填写全名
//                            ];
//    [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, 0, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames_1];
    _cycleScrollView =  [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:nil placeholderImage:[UIImage imageNamed:@"h1.jpg"]];
//    _cycleScrollView.imageURLStringsGroup = imageNames_1;
    
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self addSubview:_cycleScrollView];
    
    _horizontalScrollView = [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height*0.2)];
    [self addSubview:_horizontalScrollView];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectZero];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self addSubview: _searchBar];
    
    _hotArticleImageView = [[UIImageView alloc]init]; //热门文章图标；
    [self addSubview:_hotArticleImageView];
    
    _hotArticleLabel = [[UIButton alloc]init]; //热门文章标签；
    _hotArticleLabel.titleLabel.font = [UIFont systemFontOfSize:12];
    _hotArticleLabel.titleLabel.adjustsFontSizeToFitWidth = YES;
    _hotArticleLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_hotArticleLabel setTitle:@"热门文章" forState:UIControlStateNormal];
    [_hotArticleLabel setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [self addSubview:_hotArticleLabel];
    
    _homePageImageView = [[UIImageView alloc]init];  //首页投稿图标；
    [self addSubview:_homePageImageView];
    
    _homePageLabel = [[UIButton alloc]init];  //首页投稿标签
    _homePageLabel.titleLabel.font = [UIFont systemFontOfSize:12];
    _homePageLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
    _homePageLabel.titleLabel.adjustsFontSizeToFitWidth = YES;
    [_homePageLabel setTitle:@"首页投稿" forState:UIControlStateNormal];
    [_homePageLabel setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self addSubview:_homePageLabel];
    
    [self layoutViews];
    
    return self;
}

-(void)setCycleScrollView:(SDCycleScrollView *)cycleScrollView {
    
}

//布局
-(void)layoutViews {
//    _cycleScrollView.backgroundColor = [UIColor blueColor];
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_cycleScrollView.superview.mas_top).with.offset(0);
        make.left.equalTo(_cycleScrollView.superview.mas_left).with.offset(0);
        make.width.equalTo(_cycleScrollView.superview.mas_width);
        make.height.equalTo(_cycleScrollView.superview.mas_height).multipliedBy(0.52);
        
    }];
    
//    _horizontalScrollView.backgroundColor = [UIColor grayColor];
    
    [_horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_cycleScrollView.mas_bottom).offset(10);
        make.left.equalTo(_horizontalScrollView.superview.mas_left).offset(0);
        make.width.equalTo(_horizontalScrollView.superview.mas_width);
        make.height.mas_equalTo(_horizontalScrollView.superview.mas_height).multipliedBy(0.2);
        
    }];
    
//    _searchBar.backgroundColor = [UIColor greenColor];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_horizontalScrollView.mas_bottom).with.offset(0);
        make.left.equalTo(_horizontalScrollView.superview.mas_left).with.offset(0);
        make.width.equalTo(_horizontalScrollView.superview.mas_width);
        make.height.mas_equalTo(_horizontalScrollView.superview.mas_height).multipliedBy(0.12);
        
    }];
    
    _hotArticleImageView.backgroundColor = [UIColor brownColor];
    [_hotArticleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_searchBar.superview.mas_bottom).with.offset(-5);
        make.left.equalTo(_searchBar.superview.mas_left).with.offset(10);
        make.width.equalTo(_searchBar.superview.mas_width).multipliedBy(0.01);
        make.height.mas_equalTo(_searchBar.superview.mas_height).multipliedBy(0.05);
        
    }];
    
//    _hotArticleLabel.backgroundColor = [UIColor yellowColor];
    [_hotArticleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_searchBar.superview.mas_bottom).with.offset(-5);
        make.left.equalTo(_hotArticleImageView.mas_right).with.offset(0);
        make.width.equalTo(_searchBar.superview.mas_width).multipliedBy(0.18);
        make.height.mas_equalTo(_searchBar.superview.mas_height).multipliedBy(0.05);
        
    }];
    
//    _homePageLabel.backgroundColor = [UIColor yellowColor];
    [_homePageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_searchBar.superview.mas_bottom).with.offset(-5);
        make.right.equalTo(_homePageLabel.superview.mas_right).with.offset(-10);
        make.width.equalTo(_searchBar.superview.mas_width).multipliedBy(0.18);
        make.height.mas_equalTo(_searchBar.superview.mas_height).multipliedBy(0.05);
        
    }];
    
    [_homePageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_searchBar.superview.mas_bottom).with.offset(-5);
        make.right.equalTo(_homePageLabel.mas_left).with.offset(0);
        make.width.equalTo(_searchBar.superview.mas_width).multipliedBy(0.05);
        make.height.mas_equalTo(_searchBar.superview.mas_height).multipliedBy(0.05);
        
    }];
    
}

@end
