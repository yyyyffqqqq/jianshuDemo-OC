//
//  NotificationViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "NotificationViewController.h"

#import "FQPageScrollView.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息";
    
    self.tableView.rowHeight = 80;
    
    _dataTitle = [[NSMutableArray alloc]initWithObjects:@"评论", @"简信", @"请求", @"喜欢", @"关注", @"其他提醒",nil];
    
    _dataImages = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"icon_notification_comment"], [UIImage imageNamed:@"icon_notification_message"], [UIImage imageNamed:@"icon_notification_request"], [UIImage imageNamed:@"icon_notification_like"], [UIImage imageNamed:@"icon_notification_follow"], [UIImage imageNamed:@"icon_notification_more"], nil];
    
    UIBarButtonItem *notificationBt = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_notification_settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(tapnotificationButton)];
    self.navigationItem.rightBarButtonItem = notificationBt;
    
    
    //测试自定义的分页scrollView；
    FQPageScrollView *scrollView = [[FQPageScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    UIView *view1 = [[UIView alloc]init];
    UIView *view2 = [[UIView alloc]init];
    UIView *view3 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor greenColor];
    view3.backgroundColor = [UIColor yellowColor];
    
    NSArray *views = @[view1, view2, view3];
    
    [scrollView addCustomSubview:views];
    
    self.tableView.tableHeaderView = scrollView;
    
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
    
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    cell.textLabel.text = _dataTitle[indexPath.row];
    cell.imageView.image = _dataImages[indexPath.row];
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
