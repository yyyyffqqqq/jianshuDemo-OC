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

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *reuseIdentifier = @"cellID";
    HomeTableViewCell *cell = nil;
    JianShuCellStyle style = JianShuCellStyleHasContentImageView;
    if (indexPath.row == 2 || indexPath.row == 5 || indexPath.row == 7) {
        style = JianShuCellStyleHasNoneView;
    }
    
    if (!cell) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier jianShuCellStyle:style];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSBundle *bundle = [NSBundle mainBundle];
    //    NSString *resourcePath = [bundle resourcePath];
    //    NSString *filePath = [resourcePath stringByAppendingPathComponent:@"icon_personal_qq"];
    //    cell.headerImageView.image = [UIImage imageWithContentsOfFile:filePath];//;
    ((HomeTableViewCell*)cell).headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}


@end
