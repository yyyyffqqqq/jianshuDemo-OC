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

#import "HomeTableHeaderView.h"

@interface FindViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) HomeTableHeaderView *homeTableHeader;

@property(strong, nonatomic) UISearchController *searchController;

@property (nonatomic , strong) SearchResultViewController *searchResultVC;
@property (nonatomic , strong) NSMutableArray *searchHistorys;


@end
