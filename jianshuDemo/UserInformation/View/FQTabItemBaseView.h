//
//  YXTabItemBaseView.h
//  仿造淘宝商品详情页
//
//  Created by yixiang on 16/3/29.
//  Copyright © 2016年 yixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kGoTopNotificationName = @"goTop";//进入置顶命令
static NSString *const kLeaveTopNotificationName = @"leaveTop";//离开置顶命令
//static CGFloat const kTopBarHeight = 60.;
static CGFloat const kTopBarHeight = 64.;
//static CGFloat const kBottomBarHeight = 60.;
static CGFloat const kBottomBarHeight = 0.;
//static CGFloat const kTabTitleViewHeight = 45.;
static CGFloat const kTabTitleViewHeight = 44.;
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height

@interface FQTabItemBaseView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL canScroll;

-(void)renderUI;

@end
