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
    
    
    NSLog(@"发现");
    self.navigationItem.title = @"发现";
    
    
    NSArray *itemNames = @[@"新上榜", @"日报", @"七日热门", @"三十日热门。。。。", @"市集", @"有奖活动",@"简书出版"];
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", nil];
    
    
    _horizontalScrollView = [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    _horizontalScrollView.itemTitles = itemNames;
    _horizontalScrollView.images = imageNames;
    _horizontalScrollView.delegate = self;
    [_horizontalScrollView updateData];
    
    _horizontalScrollView.backgroundColor = [UIColor grayColor];
    
    
    self.tableView.tableHeaderView = _horizontalScrollView;
    
    
    
    _searchHistorys = [[NSMutableArray alloc]initWithObjects:@"ios 开发", @"ios 开发 布局", @"ios 开发 发布流程", nil];
    _searchResultVC = [[SearchResultViewController alloc]initWithStyle:UITableViewStylePlain];
    _searchResultVC.searchResults = _searchHistorys;
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:_searchResultVC];
    self.searchController.searchResultsUpdater = self;
//    self.searchController.hidesNavigationBarDuringPresentation = NO;
    //    self.searchController.dimsBackgroundDuringPresentation = false;
//    [self.searchController.searchBar sizeToFit];
    //    self.searchController.searchBar.backgroundColor = UIColorFromHex(0xdcdcdc);
    //    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    [self.tableView.tableHeaderView addSubview:self.searchController.searchBar];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.searchController.active) {
        self.searchController.active = NO;
        [self.searchController.searchBar removeFromSuperview];
    }
}

#pragma mark - searchController delegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.searchResults removeAllObjects];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.searchController.searchBar.text];
    self.searchResults = [[self.searchHistorys filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        _searchResultVC.searchResults = self.searchResults;
        [_searchResultVC.tableView reloadData];
    });
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

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return 44;
//    }
    
    return 0;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return self.searchController.searchBar;
//    }
//
//    return nil;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
