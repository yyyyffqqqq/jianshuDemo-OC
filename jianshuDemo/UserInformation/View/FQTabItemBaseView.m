//
//  YXTabItemBaseView.m
//  仿造淘宝商品详情页
//
//  Created by yixiang on 16/3/29.
//  Copyright © 2016年 yixiang. All rights reserved.
//

#import "FQTabItemBaseView.h"


@implementation FQTabItemBaseView

-(void)renderUI{
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTopBarHeight-kBottomBarHeight-kTabTitleViewHeight);
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //_tableView.scrollEnabled = NO;
    [self addSubview:self.tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kGoTopNotificationName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kLeaveTopNotificationName object:nil];//其中一个TAB离开顶部的时候，如果其他几个偏移量不为0的时候，要把他们都置为0
}

-(void)acceptMsg : (NSNotification *)notification{
    
    NSString *notificationName = notification.name;
    if ([notificationName isEqualToString:kGoTopNotificationName]) {
        NSDictionary *userInfo = notification.userInfo;
        NSString *canScroll = userInfo[@"canScroll"];
        if ([canScroll isEqualToString:@"1"]) {
            self.canScroll = YES;
            self.tableView.showsVerticalScrollIndicator = YES;
        }
    }else if([notificationName isEqualToString:kLeaveTopNotificationName]){
        self.tableView.contentOffset = CGPointZero;
        self.canScroll = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.canScroll) {
        [scrollView setContentOffset:CGPointZero];
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kLeaveTopNotificationName object:nil userInfo:@{@"canScroll":@"1"}];
    }
}

@end
