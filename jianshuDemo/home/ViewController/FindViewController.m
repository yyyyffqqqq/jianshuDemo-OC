//
//  FindViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FindViewController.h"

#import "HomeArticleListTableViewCell.h"
#import "FQPopViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "FQHomeClass.h"
#import "MJRefresh.h"

#define SCREEN_SIZE_HEIGHT [UIScreen mainScreen].bounds.size.height
CGFloat const homeTableRowHeight = 150.0f;

@interface FindViewController () <HorizontalScrollViewDelegate>

@property CGFloat homeTableHeaderHeight;

@property NSMutableArray<FQHomeArticleClass*> *homeArticleObjs;

@property (strong, nonatomic) MJRefreshAutoNormalFooter *footer;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:0.96 alpha:1.0];
//    self.navigationController.navigationBar.translucent = NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    
    [self.view addSubview:_tableView];
    
    _homeArticleObjs = [[NSMutableArray alloc]init];
    
    _homeTableHeaderHeight = self.view.frame.size.height*0.5;
    _homeTableHeader = [[HomeTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _homeTableHeaderHeight)];
    
    _tableView.rowHeight = homeTableRowHeight;
    
    [FQHomeClass requestHomeData:^(NSMutableArray<FQHomeArticleClass*> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass*> *homeHorizontalObjects) {
        
        _homeArticleObjs = articleObjects;
        
        _homeTableHeader.horizontalScrollView.horizontalItems = homeHorizontalObjects;
        _homeTableHeader.horizontalScrollView.delegate = self;
        
        _homeTableHeader.homePageImageView.image = [UIImage imageNamed:homeObjects.homePageImageURL];
//        _homeTableHeader.hotArticleImageView.image = [UIImage imageNamed:homeObjects.hotArticleImageURL];
        
        [_homeTableHeader.homePageLabel setTitle:homeObjects.homePageLabelString forState:UIControlStateNormal];
        
        [_homeTableHeader.hotArticleLabel setTitle:homeObjects.hotArticleLabelString forState:UIControlStateNormal];
        
        
        _homeTableHeader.cycleScrollView.imageURLStringsGroup = homeObjects.homeCycleImageUrl;
    }];
    
    
    _searchResultVC = [[SearchResultViewController alloc]initWithStyle:UITableViewStylePlain];
    
    _searchHistorys= [[NSMutableArray alloc]initWithObjects:@"ios 开发", @"ios 开发 布局", @"ios 开发 发布流程", nil];
    _searchResultVC.searchResults = [_searchHistorys copy];
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.definesPresentationContext = YES;
    
    _homeTableHeader.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _homeTableHeader.searchBar.delegate = self;
    
    _tableView.tableHeaderView = _homeTableHeader;
    self.navigationItem.titleView = self.searchController.searchBar;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewData];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
    
}

-(void)loadNewData {
    //请求数据
    [FQHomeClass pullRequestData:^(NSMutableArray<FQHomeArticleClass *> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass *> *homeHorizontalObjects) {
        if (articleObjects) {
            
        }
        _homeArticleObjs = articleObjects;
        _homeTableHeader.horizontalScrollView.delegate = self;
        _homeTableHeader.horizontalScrollView.horizontalItems = homeHorizontalObjects;
        
        
        _homeTableHeader.homePageImageView.image = [UIImage imageNamed:homeObjects.homePageImageURL];
        //_homeTableHeader.hotArticleImageView.image = [UIImage imageNamed:homeObjects.hotArticleImageURL];
        
        [_homeTableHeader.homePageLabel setTitle:homeObjects.homePageLabelString forState:UIControlStateNormal];
        
        [_homeTableHeader.hotArticleLabel setTitle:homeObjects.hotArticleLabelString forState:UIControlStateNormal];
        
        _homeTableHeader.cycleScrollView.imageURLStringsGroup = homeObjects.homeCycleImageUrl;
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];

    }];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"-End-" forState:MJRefreshStateIdle];
    [footer setTitle:@"-End-" forState:MJRefreshStateNoMoreData];
    footer.refreshingTitleHidden = YES;
    self.tableView.mj_footer = footer;

}

-(void)loadMoreData {
    //请求数据
    
    [FQHomeClass infiniteScrollingRequestDataWithCounts:2 complete:^(NSMutableArray<FQHomeArticleClass *> *articleObjects) {
        if (articleObjects) {
            [_homeArticleObjs addObjectsFromArray:articleObjects];
            
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        } else {
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        
    }];

}

#pragma mark - FDFullscreenPopGesture
//- (BOOL)fd_prefersNavigationBarHidden {
//    return YES;
//}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //不移除对tableview的监听，这样会影响右滑返回的效果，与FDFullscreenPopGesture
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
    
    self.hidesBottomBarWhenPushed = NO;

}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchController.searchBar becomeFirstResponder];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    return NO;
}

- (void)willPresentSearchController:(UISearchController *)searchController {
//    self.navigationController.navigationBar.translucent = YES;
    _searchResultVC.tableView.frame = CGRectMake(0, 64, _searchResultVC.tableView.frame.size.width, _searchResultVC.tableView.frame.size.height);
    [self.view addSubview:_searchResultVC.tableView];
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {
//    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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


//HorizontalScrollViewDelegate
- (void)selectItemAtIndex:(NSInteger)index {
    NSLog(@"index is %ld", (long)index);
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _homeArticleObjs.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"55555");
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    HomeArticleListTableViewCell *cell = [[HomeArticleListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier withFrame:CGRectMake(0, 0, self.view.frame.size.width, homeTableRowHeight)];
//    cell.backgroundColor = [UIColor greenColor];
    cell.homeArticle = _homeArticleObjs[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hidesBottomBarWhenPushed = YES;
    FQPopViewController *ArticleContentVC = [[FQPopViewController alloc]init];
    [self showViewController:ArticleContentVC sender:self];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        if (![self.homeTableHeader.searchBar isFirstResponder ] && ![self.searchController.searchBar isFirstResponder]) {
            CGPoint newPoint = [change[NSKeyValueChangeNewKey] CGPointValue];
            //CGPoint oldPoint = [change[NSKeyValueChangeOldKey] CGPointValue];
            if (newPoint.y + 20 >= _homeTableHeaderHeight*0.72 ) { //0.72是头部视图布局时的比率
//                self.navigationController.navigationBar.translucent = YES;
                [self.navigationController setNavigationBarHidden:NO animated:NO];
            } else {
                [self.navigationController setNavigationBarHidden:YES animated:NO];
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
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
