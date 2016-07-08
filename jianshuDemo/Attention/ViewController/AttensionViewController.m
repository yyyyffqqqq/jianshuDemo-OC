//
//  AttensionViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "AttensionViewController.h"
#import "AttenssionTableViewCell.h"
#import "MJRefresh.h"

CGFloat const attenssionRowHeight = 80.0f;

@interface AttensionViewController ()

@end

@implementation AttensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20) style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    
//    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"关注";
    self.tableView.rowHeight = attenssionRowHeight;
    
    UIBarButtonItem *addBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_side_add"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapAddButton)];
    self.navigationItem.leftBarButtonItem = addBt;
    
    UIBarButtonItem *notificationBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_notification_settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapnotificationButton)];
    self.navigationItem.rightBarButtonItem = notificationBt;
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.definesPresentationContext = YES;
    self.searchController.searchBar.barTintColor = [UIColor colorWithWhite:0.95 alpha:0.8];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"-End-" forState:MJRefreshStateIdle];
    [footer setTitle:@"-End-" forState:MJRefreshStateNoMoreData];
    footer.refreshingTitleHidden = YES;
    self.tableView.mj_footer = footer;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    [view addSubview:self.searchController.searchBar];
    
    self.tableView.tableHeaderView = view;
    
    _searchResultVC = [[SearchResultViewController alloc]initWithStyle:UITableViewStylePlain];
    _searchResultVC.searchResults = [[NSMutableArray alloc]initWithObjects:@"ios 开发", @"ios 开发 布局", @"ios 开发 发布流程", nil];
    
    
    
}

-(void)loadNewData {
    //请求数据
//    ....
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

-(void)loadMoreData {
    //请求数据
//    ....
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
    
//    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    
    
}

//添加关注
-(void)tapAddButton {
    
}

-(void)tapnotificationButton {
    
}

#pragma mark -- UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
//    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",  self.searchController.searchBar.text];
//    if (![self.searchController.searchBar.text isEqualToString:@""]) {
//        _searchResultVC.searchResults = [[self.searchHistorys filteredArrayUsingPredicate:searchPredicate] mutableCopy];
//    } else {
//        _searchResultVC.searchResults = self.searchHistorys;
//    }
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_searchResultVC.tableView reloadData];
//    });
}

- (void)willPresentSearchController:(UISearchController *)searchController {
    _searchResultVC.tableView.frame = CGRectMake(0, 44, _searchResultVC.tableView.frame.size.width, _searchResultVC.tableView.frame.size.height);
    [self.view addSubview:_searchResultVC.tableView];
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    [_searchResultVC.tableView removeFromSuperview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    //显示数据，暂时不获取；
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    AttenssionTableViewCell *cell = [[AttenssionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier withFrame:CGRectMake(0, 0, self.view.frame.size.width, attenssionRowHeight)];
    if (indexPath.row<2) {
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"一键查看全部关注更新";
            cell.headerImageView.image = [UIImage imageNamed:@"icon_all_new"];
            
        } else {
            cell.titleLabel.text = @"简友圈";
            cell.headerImageView.image = [UIImage imageNamed:@"icon_notification_frds"];
        }
        
    } else {
        
        cell.nameLabel.text = @"IOS Developer";
        cell.nameLabel.font = [UIFont systemFontOfSize:16];
        
        cell.contentLabel.text = @"Ios开发之约束布局";
        
        cell.contentLabel.font = [UIFont systemFontOfSize:12.5];
        cell.contentLabel.textColor = [UIColor colorWithWhite:0.8 alpha:0.9];
        
        cell.accessoryTypeValueLabel.text = @"2562";
        cell.accessoryTypeValueLabel.font = [UIFont systemFontOfSize:13];
        cell.accessoryTypeValueLabel.textColor = [UIColor whiteColor];
        cell.accessoryTypeValueLabel.backgroundColor = [UIColor redColor];
        
        
        cell.headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        
    }
    
    cell.headerImageView.layer.cornerRadius = attenssionRowHeight*headerImageViewHeight*0.5; //0.5是长宽相等的控件剪切成圆的比率
    cell.headerImageView.layer.masksToBounds = YES;
    
    //0.3是accessoryTypeValueLabel大小占行高的比率,0.4是决定圆角弧度
    cell.accessoryTypeValueLabel.layer.cornerRadius = attenssionRowHeight*accessoryTypeValueLabelHeight*0.5;
    cell.accessoryTypeValueLabel.layer.masksToBounds = YES;
    
//    cell.headerImageView.backgroundColor = [UIColor greenColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
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
