//
//  FindViewController.h
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HorizontalScrollView.h"

#import "SearchResultViewController.h"

@interface FindViewController : UITableViewController<UISearchResultsUpdating, UISearchDisplayDelegate>

@property (strong, nonatomic) HorizontalScrollView *horizontalScrollView;

@property (nonatomic , strong) SearchResultViewController *searchResultVC;
@property(strong, nonatomic) UISearchController *searchController;
@property(strong, nonatomic) NSMutableArray *searchHistorys; // 搜索记录
@property(strong, nonatomic) NSMutableArray *searchResults; // 根据searchController搜索的结果

@end
