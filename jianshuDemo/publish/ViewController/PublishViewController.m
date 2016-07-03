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
    
    UIBarButtonItem *backBt = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(tapCancelGoBack)];
    self.navigationItem.leftBarButtonItem = backBt;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapCancelGoBack {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
