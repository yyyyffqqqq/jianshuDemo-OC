//
//  PublishViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"0字";
    
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithWhite:0.7 alpha:0.9],NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName, nil]];
    
    
    UIBarButtonItem *backBt = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(tapCancelGoBack)];
    self.navigationItem.leftBarButtonItem = backBt;
    
    UIBarButtonItem *rightBt = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(tapCancelGoBack)];
    self.navigationItem.rightBarButtonItem = rightBt;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回上个界面
-(void)tapCancelGoBack {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//发布文章
-(void)publishArticle {
    
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
