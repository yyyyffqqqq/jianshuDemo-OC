//
//  AttensionViewController.h
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultViewController.h"

@interface AttensionViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

//@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) UISearchController *searchController;
@property (nonatomic , strong) SearchResultViewController *searchResultVC;

@end
