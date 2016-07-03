//
//  FindViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController () <HorizontalScrollViewDelegate>

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:0.96 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _homeTableHeader = [[HomeTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.5)];
    
    _tableView.tableHeaderView = _homeTableHeader;
    
    _tableView.rowHeight = 150;
    
    NSArray *itemNames = @[@"新上榜", @"日报", @"七日热门", @"三十日热门。。。。", @"市集", @"有奖活动",@"简书出版"];
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", nil];
    
    _homeTableHeader.horizontalScrollView.itemTitles = itemNames;
    _homeTableHeader.horizontalScrollView.images = imageNames;
    _homeTableHeader.horizontalScrollView.delegate = self;
//    [_homeTableHeader.horizontalScrollView updateData];
    
    _searchResultVC = [[SearchResultViewController alloc]initWithStyle:UITableViewStylePlain];
    
    _searchHistorys= [[NSMutableArray alloc]initWithObjects:@"ios 开发", @"ios 开发 布局", @"ios 开发 发布流程", nil];
    _searchResultVC.searchResults = [_searchHistorys copy];
    
    _homeTableHeader.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _homeTableHeader.searchBar.delegate = self;
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.definesPresentationContext = YES;
    
    self.navigationItem.titleView = self.searchController.searchBar;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    if (self.searchController.active) {
//        self.searchController.active = NO;
//        [self.searchController.searchBar removeFromSuperview];
//    }

}

- (void)willPresentSearchController:(UISearchController *)searchController {
    _searchResultVC.tableView.frame = CGRectMake(0, 64, _searchResultVC.tableView.frame.size.width, _searchResultVC.tableView.frame.size.height);
    [self.view addSubview:_searchResultVC.tableView];
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    self.navigationController.navigationBar.hidden = YES;
    [_searchResultVC.tableView removeFromSuperview];
}



- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",  self.searchController.searchBar.text];
    if (![self.searchController.searchBar.text isEqualToString:@""]) {
        _searchResultVC.searchResults = [[self.searchHistorys filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    } else {
        _searchResultVC.searchResults = self.searchHistorys;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [_searchResultVC.tableView reloadData];
    });
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    self.navigationController.navigationBar.hidden = NO;
    [self.searchController.searchBar becomeFirstResponder];
    
    return NO;
}


//HorizontalScrollViewDelegate
- (void)selectItemAtIndex:(NSInteger)index {
    NSLog(@"index is %ld", (long)index);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    }
    
    return 10;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return 44;
//    }
//    
//    return 0;
//}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return self.searchBar;
//    }
////    if (section==0) {
////        return self.searchController.searchBar;
////    }
//    return nil;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    cell.textLabel.text = @"ddsdsd";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
