//
//  SearchViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "SearchResultViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    if (!self.searchController.active) {
//        return self.searchHistorys.count;
//    } else {
//        return 1;
//    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (!self.searchController.active) {
////        NSString *key = self.cityKeys[section];
////        NSArray *citySection = self.cityDict[key];
//        return _searchHistorys.count;
//    } else {
//        return self.searchResults.count;
//    }
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // 根据UISearchController的active属性来判断cell中的内容
//    if (!self.searchController.active) {
////        NSString *key = self.cityKeys[indexPath.section];
////        cell.textLabel.text = [self.cityDict[key] objectAtIndex:indexPath.row];
//        cell.textLabel.text = [_searchHistorys objectAtIndex:indexPath.row];
//    } else {
//        cell.textLabel.text = self.searchResults[indexPath.row];
//    }
    cell.textLabel.text = self.searchResults[indexPath.row];
    return cell;
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
