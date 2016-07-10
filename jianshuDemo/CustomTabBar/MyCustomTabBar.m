//
//  MyCustomTabBar.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MyCustomTabBar.h"

#import "PublishViewController.h"

#import "WPEditorViewController.h"
//#import <WordPressEditor/WPEditorViewController.h>

@implementation MyCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置背景图片
//        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
        // 添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"button_write"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"button_write"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)publishClick
{
    //    if (_publishBtTapCallback) {
    //        self.publishBtTapCallback();
    //    }
    
    PublishViewController *publish = [[PublishViewController alloc] initWithMode:kWPEditorViewControllerModeEdit];
    UINavigationController *publishNV = [[UINavigationController alloc]initWithRootViewController:publish];
    [self.window.rootViewController presentViewController:publishNV animated:YES completion:nil];
    
}

/**
 * 布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // tabBar的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 设置发布按钮的位置
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 按钮索引
    int index = 0;
    
    // 按钮的尺寸
    CGFloat tabBarButtonW = width / 5;
    CGFloat tabBarButtonH = height;
    CGFloat tabBarButtonY = 0;
    
    // 设置4个TabBarButton的frame
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"]) continue;
        
        // 计算按钮的X值
        CGFloat tabBarButtonX = index * tabBarButtonW;
        if (index >= 2) { // 给后面2个button增加一个宽度的X值
            tabBarButtonX += tabBarButtonW;
        }
        
        // 设置按钮的frame
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
        // 增加索引
        index++;
    }
}

@end
