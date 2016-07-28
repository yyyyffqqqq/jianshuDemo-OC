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
#import "DXPopover.h"

static CGFloat const attenssionRowHeight = 80.0f;

@interface AttensionViewController ()

@property(strong, nonatomic) UITableView *popTableView;

@property UIButton *titleBt;

@property DXPopover *popover;

@property NSArray *popoverDatas;

@property CGFloat popTableViewRowHeight ;

@end

@implementation AttensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popover = [DXPopover new];
    
    _popTableViewRowHeight = 50;
    _popoverDatas = [[NSArray alloc]initWithObjects:@"全部关注",@"只看专题",@"只看文集", @"只看用户", @"只看推送更新", nil];
    
    self.popTableView = [[UITableView alloc]initWithFrame:(CGRect){CGPointZero, CGSizeMake(150, _popTableViewRowHeight*_popoverDatas.count)} style:UITableViewStylePlain];
    self.popTableView.delegate = self;
    self.popTableView.dataSource = self;
    self.popTableView.scrollEnabled = NO;
    _popTableView.rowHeight = _popTableViewRowHeight;
    
    
    
    _titleBt = [[UIButton alloc] initWithFrame:(CGRect){CGPointZero, CGSizeMake(100, 30)}];
    [_titleBt setTitle:@"关注全部" forState:UIControlStateNormal];
    [_titleBt setImage:[UIImage imageNamed:@"icon_following_arrow_open"] forState:UIControlStateNormal];
    [_titleBt addTarget:self
                action:@selector(titleShowPopover)
      forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _titleBt;
    CGFloat labelWidth = self.navigationItem.titleView.layer.bounds.size.width;
    CGFloat imageWidth = _titleBt.imageView.layer.bounds.size.width;
    _titleBt.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
    _titleBt.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth-imageWidth*2, 0, -imageWidth);
    
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
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
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

- (void)updateTableViewFrame {
    CGRect tableViewFrame = self.popTableView.frame;
//    tableViewFrame.size.width = _popoverWidth;
    self.popTableView.frame = tableViewFrame;
    self.popover.contentInset = UIEdgeInsetsZero;
    self.popover.backgroundColor = [UIColor whiteColor];
}

- (void)bounceTargetView:(UIView *)targetView {
//    targetView.transform = CGAffineTransformMakeScale(0.9, 0.9);
//    [UIView animateWithDuration:0.5
//                          delay:0.0
//         usingSpringWithDamping:0.3
//          initialSpringVelocity:5
//                        options:UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         targetView.transform = CGAffineTransformIdentity;
//                     }
//                     completion:nil];
    
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:0.2f];
    //顺时针旋转180度
    _titleBt.imageView.transform = CGAffineTransformMakeRotation(0);
    /* Commit the animation */
    [UIView commitAnimations];
}

- (void)titleShowPopover {
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:0.2f];
    //顺时针旋转180度
    _titleBt.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    /* Commit the animation */
    [UIView commitAnimations];

    [self updateTableViewFrame];
    
    UIView *titleView = self.navigationItem.titleView;
    CGPoint startPoint =
    CGPointMake(CGRectGetMidX(titleView.frame), CGRectGetMaxY(titleView.frame) + 20);
    
    [self.popover showAtPoint:startPoint
               popoverPostion:DXPopoverPositionDown
              withContentView:self.popTableView
                       inView:self.tabBarController.view];
    __weak typeof(self) weakSelf = self;
    self.popover.didDismissHandler = ^{
        [weakSelf bounceTargetView:titleView];
    };
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
    if (tableView == _popTableView) {
        return _popoverDatas.count;
    }
    return 50;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _popTableView) {
        if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _popTableView) {
        static NSString *reuseIdentifier = @"popTableViewCellID";
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.textLabel.text = _popoverDatas[indexPath.row];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.backgroundColor = [UIColor redColor];
        
        return cell;
    }
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
    if (tableView == _popTableView) {
        return 0;
    }
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
