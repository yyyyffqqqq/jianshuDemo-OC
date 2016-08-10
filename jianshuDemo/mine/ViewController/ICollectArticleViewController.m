//
//  ICollectArticleViewController.m
//  jianshuDemo
//
//  Created by quan on 16/8/10.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "ICollectArticleViewController.h"

#import "ReactNativeView.h"
#import "NativeCallReact.h"

@interface ICollectArticleViewController ()

@property (strong, nonatomic) ReactNativeView *reactNativeView; //测试react native视图

@end

@implementation ICollectArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     * 测试集成React native
     *
     */
    _reactNativeView = [[ReactNativeView alloc] initWithFrame:self.view.frame];
    
    self.view = _reactNativeView;
    
    dispatch_after(5, dispatch_get_main_queue(), ^{
        
    });
    
    
    UIBarButtonItem *nativeCallReactBt = [[UIBarButtonItem alloc]initWithTitle:@"NativeCallReact" style:UIBarButtonItemStyleDone target:self action:@selector(nativeCallReact)];
    self.navigationItem.rightBarButtonItem = nativeCallReactBt;

}

- (void)nativeCallReact{
    NativeCallReact *nativeCallReact = [NativeCallReact shareInstance];
    NSNotification *notification = [[NSNotification alloc]initWithName:@"EventReminder" object:nil userInfo:@{@"name": @"yyyyy"}];
    [nativeCallReact handleNativeCallReact:notification];
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
