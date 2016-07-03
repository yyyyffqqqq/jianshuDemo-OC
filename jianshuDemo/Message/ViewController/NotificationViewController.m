//
//  NotificationViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息";
    
    self.tableView.rowHeight = 80;
    
    _dataTitle = [[NSMutableArray alloc]initWithObjects:@"评论", @"简信", @"请求", @"喜欢", @"关注", @"其他提醒",nil];
    
    UIBarButtonItem *notificationBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_notification_settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapnotificationButton)];
    self.navigationItem.rightBarButtonItem = notificationBt;
    
}

-(void)tapnotificationButton {
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataTitle.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    //显示数据，暂时不获取；
    UITableViewCell *cell;
//    if (indexPath.row<2) {
//        if (indexPath.row == 1) {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
//            cell.textLabel.text = @"一键查看全部关注更新";
//            cell.imageView.image = [UIImage imageNamed:@"icon_all_new"];
//        } else {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
//            cell.textLabel.text = @"简友圈";
//            cell.imageView.image = [UIImage imageNamed:@"icon_notification_frds"];
//        }
//        
//    } else {
//        
//    }
    
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    cell.textLabel.text = _dataTitle[indexPath.row];
//    cell.detailTextLabel.text = @"Ios开发之约束布局";
    cell.imageView.image = [UIImage imageNamed:@"icon_all_new"];
    
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.height*0.5;
    cell.imageView.layer.masksToBounds = YES;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
