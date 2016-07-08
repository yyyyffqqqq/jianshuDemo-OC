//
//  ArticleContentViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "TextEditViewController.h"

#import "PickerViewController.h"

@interface TextEditViewController ()

@end

@implementation TextEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Standard";
    
    // Export HTML
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Export" style:UIBarButtonItemStylePlain target:self action:@selector(exportHTML)];
    
    // HTML Content to set in the editor
    NSString *html = @"<!-- This is an HTML comment -->"
    "<p>This is a test of the <strong>ZSSRichTextEditor</strong> by <a title=\"Zed Said\" href=\"http://www.zedsaid.com\">Zed Said Studio</a></p>";
    
    // Set the base URL if you would like to use relative links, such as to images.
    self.baseURL = [NSURL URLWithString:@"http://www.zedsaid.com"];
    self.shouldShowKeyboard = NO;
    // Set the HTML contents of the editor
    [self setHTML:html];
    
    self.view.backgroundColor = [UIColor greenColor];
    
}


- (void)showInsertURLAlternatePicker {
    
    [self dismissAlertView];
    
    PickerViewController *picker = [[PickerViewController alloc] init];
    picker.textEditVC = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:picker];
    nav.navigationBar.translucent = NO;
    [self presentViewController:nav animated:YES completion:nil];
    
}


- (void)showInsertImageAlternatePicker {
    
    [self dismissAlertView];
    
    PickerViewController *picker = [[PickerViewController alloc] init];
    picker.textEditVC = self;
    picker.isInsertImagePicker = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:picker];
    nav.navigationBar.translucent = NO;
    [self presentViewController:nav animated:YES completion:nil];
    
}


- (void)exportHTML {
    
    NSLog(@"%@", [self getHTML]);
    
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
