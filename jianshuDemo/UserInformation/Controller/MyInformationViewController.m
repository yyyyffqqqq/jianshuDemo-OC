//
//  MyInformationViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MyInformationViewController.h"
#import "FQCustomToolbarView.h"
#import "UserInformationHeaderView.h"

#define tableHeaderHeight self.view.frame.size.height

@interface MyInformationViewController ()

@property (strong, nonatomic) UserInformationHeaderView *userInfoHeaderView;

@end

@implementation MyInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSArray *images =  [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], nil];
//    FQCustomToolbarView *gggg = [[FQCustomToolbarView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44) withTitles:[[NSArray alloc]initWithObjects:@"ffdf", @"ffdf", @"ffdf", nil] andImages:nil];
//    gggg.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
//    gggg.responseTapEvent = ^(int index) {
//        NSLog(@"tap at :  %d", index);
//    };
//    [self.view addSubview:gggg];
    
    UIView *titleView = [[UIView alloc] init];
    self.navigationItem.titleView = titleView;
    self.titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_personal_qq"]];
    self.titleImageView.layer.cornerRadius = 40;
    self.titleImageView.layer.masksToBounds = YES;
    self.titleImageView.frame = CGRectMake(0, 0, 80, 80);
    self.titleImageView.layer.borderWidth = 1;
    self.titleImageView.layer.borderColor = [UIColor redColor].CGColor;
    self.titleImageView.center = CGPointMake(titleView.center.x, 0);
    [titleView addSubview:self.titleImageView];
    
    _userInfoHeaderView = [[UserInformationHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tableHeaderHeight*0.3)];
    self.tableView.tableHeaderView = _userInfoHeaderView;
    
    _userInfoHeaderView.nameLabel.text = @"ykllkk";
    
    _userInfoHeaderView.deatailLabel.text = @"写了130字，获得了5个喜欢";
    
    [_userInfoHeaderView.editBt setTitle:@"编辑个人资料" forState:UIControlStateNormal];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    CGFloat scale = 1.0;
    // 放大
    if (offsetY < 0) {
        // 允许下拉放大的最大距离为300
        // 1.5是放大的最大倍数，当达到最大时，大小为：1.5 * 70 = 105
        // 这个值可以自由调整
        scale = MIN(1.5, 1 - offsetY / 100);
    } else if (offsetY > 0) { // 缩小
        // 允许向上超过导航条缩小的最大距离为300
        // 为了防止缩小过度，给一个最小值为0.45，其中0.45 = 31.5 / 70.0，表示
        // 头像最小是31.5像素
        scale = MAX(0.45, 1 - offsetY / 100);
    }
    
    self.titleImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 保证缩放后y坐标不变
    CGRect frame = self.titleImageView.frame;
    frame.origin.y = -self.titleImageView.layer.cornerRadius / 2;
    self.titleImageView.frame = frame;
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
