//
//  PickerViewController.h
//  jianshuDemo
//
//  Created by quan on 16/7/9.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextEditViewController.h"

@interface PickerViewController : UIViewController

@property (nonatomic, strong) TextEditViewController *textEditVC;
@property (nonatomic) BOOL isInsertImagePicker;

@end
