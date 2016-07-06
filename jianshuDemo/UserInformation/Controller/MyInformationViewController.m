//
//  MyInformationViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MyInformationViewController.h"
#import "FQCustomToolbarView.h"

@interface MyInformationViewController ()

@end

@implementation MyInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSArray *images =  [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], nil];
    FQCustomToolbarView *gggg = [[FQCustomToolbarView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44) withTitles:[[NSArray alloc]initWithObjects:@"ffdf", @"ffdf", @"ffdf", nil] andImages:nil];
    gggg.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    gggg.responseTapEvent = ^(int index) {
        NSLog(@"tap at :  %d", index);
    };
    [self.view addSubview:gggg];
    
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
