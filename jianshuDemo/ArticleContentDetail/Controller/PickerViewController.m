//
//  PickerViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/9.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation PickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Picker";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveURL)];
    self.navigationItem.rightBarButtonItem = save;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, 40)];
    self.textField.text = !self.isInsertImagePicker ? @"http://www.apple.com" : @"http://fineprintnyc.com/images/blog/history-of-apple-logo/apple-logo-2.jpg";
    self.textField.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField.layer.borderWidth = 0.5f;
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:self.textField];
    
}

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveURL {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    TextEditViewController *vc = self.textEditVC;
    if (!self.isInsertImagePicker) {
        [vc showInsertLinkDialogWithLink:self.textField.text title:nil];
    } else {
        [vc showInsertImageDialogWithLink:self.textField.text alt:nil];
    }
    
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
