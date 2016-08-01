//
//  ArticleListTableViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/28.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "ArticleListTableViewController.h"
#import "HomeTableViewCell.h"

static CGFloat const tableRowHeight = 150.0f;

@interface ArticleListTableViewController ()

@end

@implementation ArticleListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = tableRowHeight;
    
    UIBarButtonItem *detailMoreBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_detail_more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapDetailMoreBtButton)];
    self.navigationItem.rightBarButtonItem = detailMoreBt;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapDetailMoreBtButton {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"reuseId";
    HomeTableViewCell *cell;
    
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID jianShuCellStyle:JianShuCellStyleHasContentImageView];
    }
    
    cell.textLabel.text = @"fdfs";
    
    return cell;
}




@end
