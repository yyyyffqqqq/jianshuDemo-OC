//
//  MyInformationViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MyInformationViewController.h"
#import "FQCustomToolbarView.h"
#import "UserInformationHeaderView.h"
#import "UserInforTableViewCell.h"

#import "YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView.h"

#define tableHeaderHeight (int)([UIScreen mainScreen].bounds.size.height*0.3)

CGFloat const firstHeaderViewHeight = 44;

@interface MyInformationViewController ()<FQPageScrollViewDelegate>

@property (strong, nonatomic) UserInformationHeaderView *userInfoHeaderView;

@property (strong, nonatomic) FQCustomToolbarView *headerToolbarView;

@property (strong, nonatomic) UserInforTableViewCell *pageScrollViewCell;


@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@property (nonatomic, assign) BOOL canScroll;

@end

@implementation MyInformationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-kBottomBarHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.rowHeight = (int)[UIScreen mainScreen].bounds.size.height - (int)firstHeaderViewHeight - 64; //64是导航栏和状态栏；
    self.tableView.showsVerticalScrollIndicator = NO;
    
    UIView *titleView = [[UIView alloc] init];
    self.navigationItem.titleView = titleView;
    self.titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_personal_qq"]];
    self.titleImageView.layer.cornerRadius = 40;
    self.titleImageView.layer.masksToBounds = YES;
    self.titleImageView.frame = CGRectMake(0, 0, 80, 80);
    self.titleImageView.center = CGPointMake(titleView.center.x, 0);
    [titleView addSubview:self.titleImageView];
    
    _userInfoHeaderView = [[UserInformationHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tableHeaderHeight)];
    self.tableView.tableHeaderView = _userInfoHeaderView;
    
    _userInfoHeaderView.nameLabel.text = @"ykllkk";
    
    _userInfoHeaderView.deatailLabel.text = @"写了130字，获得了5个喜欢";
    
    [_userInfoHeaderView.editBt setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_userInfoHeaderView.editBt setTitle:@"编辑个人资料" forState:UIControlStateNormal];
    _userInfoHeaderView.editBt.layer.borderColor = [UIColor greenColor].CGColor;
    _userInfoHeaderView.editBt.layer.borderWidth = 1.0;
    
    __weak MyInformationViewController *mySelf = self;
    
//    NSArray *images =  [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], [UIImage imageNamed:@"icon_tabbar_home"], nil];
    _headerToolbarView = [[FQCustomToolbarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, firstHeaderViewHeight) withTitles:[[NSArray alloc]initWithObjects:@"动态", @"文章", @"更多", nil] andImages:nil];
    _headerToolbarView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    _headerToolbarView.responseTapEvent = ^(int index) {
        
         UserInforTableViewCell *cell = (UserInforTableViewCell*)[mySelf.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [UIView animateWithDuration:0.3 animations:^{
            cell.pageScrollView.contentOffset = CGPointMake(cell.pageScrollView.pageWidth * index, 0);
            
            mySelf.tableView.contentOffset = CGPointMake(0, tableHeaderHeight - 64);
        }];
        
        
    };
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kLeaveTopNotificationName object:nil];
}

-(void)acceptMsg : (NSNotification *)notification{
    //NSLog(@"%@",notification);
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    CGFloat scale = 1.0;
    // 放大
    if (offsetY < 0) {
        // 允许下拉放大的最大距离为300
        // 1.5是放大的最大倍数，当达到最大时，大小为：1.5 * 70 = 105
        // 这个值可以自由调整
        scale = MIN(1.5, 1 - offsetY / 100);
    } else if (offsetY > 0) { // 缩小
        // 允许向上超过导航条缩小的最大距离为300
        // 为了防止缩小过度，给一个最小值为0.45，其中0.45 = 31.5 / 70.0，表示
        // 头像最小是31.5像素
        scale = MAX(0.45, 1 - offsetY / 100);
    }
    
    self.titleImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // 保证缩放后y坐标不变
    CGRect frame = self.titleImageView.frame;
    frame.origin.y = -self.titleImageView.layer.cornerRadius / 2;
    self.titleImageView.frame = frame;
    
    /** 
     上下滑动手势相关
     */
    CGFloat tabOffsetY = [self.tableView rectForSection:0].origin.y-kTopBarHeight;
    CGFloat offsetY2 = scrollView.contentOffset.y;
    _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
    if (offsetY2>=tabOffsetY) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        _isTopIsCanNotMoveTabView = YES;
    }else{
        _isTopIsCanNotMoveTabView = NO;
    }
    if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
        if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
            //NSLog(@"滑动到顶端");
            [[NSNotificationCenter defaultCenter] postNotificationName:kGoTopNotificationName object:nil userInfo:@{@"canScroll":@"1"}];
            _canScroll = NO;
        }
        if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){
            //NSLog(@"离开顶端");
            if (!_canScroll) {
                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            }
        }
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return firstHeaderViewHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return _headerToolbarView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell
    static NSString *reuseIdentifier = @"cellID";
    //显示数据，暂时不获取；
    _pageScrollViewCell = [[UserInforTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier size:CGSizeMake(self.view.frame.size.width, self.tableView.rowHeight)];
    _pageScrollViewCell.pageScrollView.mydelegate = self;
    
    return _pageScrollViewCell;
    
}


#pragma mark -FQPageScrollViewDelegate
-(void)scrollViewDidEndDraggingWithIndex:(NSInteger)index {
    [_headerToolbarView setTapAtIndex: index];
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
