//
//  AttensionViewController.h
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultViewController.h"

@interface AttensionViewController : UITableViewController<UISearchResultsUpdating, UISearchControllerDelegate>

@property(strong, nonatomic) UISearchController *searchController;
@property (nonatomic , strong) SearchResultViewController *searchResultVC;

@end
