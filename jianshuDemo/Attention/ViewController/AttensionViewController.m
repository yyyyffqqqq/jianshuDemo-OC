//
//  AttensionViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "AttensionViewController.h"

@interface AttensionViewController ()

@end

@implementation AttensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"关注";
    self.tableView.rowHeight = 80;
    
    UIBarButtonItem *addBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_side_add"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapAddButton)];
    self.navigationItem.leftBarButtonItem = addBt;
    
    UIBarButtonItem *notificationBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_notification_settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapnotificationButton)];
    self.navigationItem.rightBarButtonItem = notificationBt;
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.definesPresentationContext = YES;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
    
    _searchResultVC = [[SearchResultViewController alloc]initWithStyle:UITableViewStylePlain];
    _searchResultVC.searchResults = [[NSMutableArray alloc]initWithObjects:@"ios 开发", @"ios 开发 布局", @"ios 开发 发布流程", nil];
    
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
    _searchResultVC.tableView.frame = CGRectMake(0, 64, _searchResultVC.tableView.frame.size.width, _searchResultVC.tableView.frame.size.height);
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
    
    //显示数据，暂时不获取；
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (indexPath.row<2) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
        if (indexPath.row == 1) {
            cell.textLabel.text = @"一键查看全部关注更新";
            cell.imageView.image = [UIImage imageNamed:@"icon_all_new"];
            cell.detailTextLabel.text = @"20";
        } else {
            cell.textLabel.text = @"简友圈";
            cell.imageView.image = [UIImage imageNamed:@"icon_notification_frds"];
        }
        
    } else {
        
        cell.textLabel.text = @"IOS Developer";
        cell.detailTextLabel.text = @"Ios开发之约束布局";
//        cell.detailTextLabel.layer.borderWidth = 1;
//        cell.detailTextLabel.layer.borderColor = [UIColor redColor].CGColor;
        cell.imageView.image = [UIImage imageNamed:@"icon_all_new"];
    }
    
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.height*0.5;
    cell.imageView.layer.masksToBounds = YES;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"-End-";
    return label;
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
