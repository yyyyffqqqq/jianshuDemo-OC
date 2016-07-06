//
//  MineViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MineUserInformationClass.h"
#import "MyInformationViewController.h"

#define firstRowHeight 80.0f
#define otherRowHeightOfMe 50.0f

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    
//    _dataTitles = [[NSMutableArray alloc]initWithObjects:@"公开文章", @"秘密文章", @"收藏的文章", @"喜欢的文章", @"我的专题", @"我的文集", nil];
//    _dataTitles_2 = [[NSMutableArray alloc]initWithObjects:@"黑夜模式", @"浏览历史", @"通用设置", @"分享简书", @"意见反馈", @"给简书评分", nil];
    
    _imageDatas = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"icon_mine_article_public"],[UIImage imageNamed:@"icon_mine_article_secret"], [UIImage imageNamed:@"icon_mine_article_mark"], [UIImage imageNamed:@"icon_mine_article_like"], [UIImage imageNamed:@"icon_mine_topic_gray"], [UIImage imageNamed:@"icon_mine_book_gray"], [UIImage imageNamed:@"icon_mine_night"], [UIImage imageNamed:@"icon_mine_history"], [UIImage imageNamed:@"icon_settings"], [UIImage imageNamed:@"icon_share_app"], [UIImage imageNamed:@"icon_mine_feedback"],[UIImage imageNamed:@"icon_mine_rate"], nil];
    _imageDatas_2 = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"icon_mine_night"], [UIImage imageNamed:@"icon_mine_history"], [UIImage imageNamed:@"icon_settings"], [UIImage imageNamed:@"icon_share_app"], [UIImage imageNamed:@"icon_mine_feedback"],[UIImage imageNamed:@"icon_mine_rate"], nil];
    
    //模拟请求数据
    [MineUserInformationClass requestMineUserDataWithBlock:^(NSArray *mineUserInformarionArrays, NSArray *mineTitleArrays_one_section, NSArray *mineTitleArrays_two_section, NSError *error) {
        _mineUserInfDatas = mineUserInformarionArrays;
        _mintTitleDatas_section_one = mineTitleArrays_one_section;
        _mintTitleDatas_section_two = mineTitleArrays_two_section;
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==1) {
        return _mintTitleDatas_section_one.count;
    } else if (section==2) {
        return _mintTitleDatas_section_two.count;
    }
    return _mineUserInfDatas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    //显示数据，暂时不获取；
    MineTableViewCell *cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (indexPath.section==1) {
        
        cell.imageView.image = _imageDatas[indexPath.row];
        
        cell.mineTitle = _mintTitleDatas_section_one[indexPath.row];
        
    } else if (indexPath.section==2) {
        cell.imageView.image = _imageDatas_2[indexPath.row];
        cell.mineTitle = _mintTitleDatas_section_two[indexPath.row];
        
    } else if (indexPath.section == 0) {
        cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier withFrame:CGRectMake(0, 0, self.view.frame.size.width, firstRowHeight)];
        
        ((MineTableViewCell*)cell).headerImageView.layer.cornerRadius = firstRowHeight*0.6*0.5; //0.6是图片大小占行高的比率
        ((MineTableViewCell*)cell).headerImageView.layer.masksToBounds = YES;
        ((MineTableViewCell*)cell).nameLabel.font = [UIFont systemFontOfSize:16];
        
        ((MineTableViewCell*)cell).jifenLabel.font = [UIFont systemFontOfSize:13];
        ((MineTableViewCell*)cell).jifenLabel.textColor = jifenColor;
        
        ((MineTableViewCell*)cell).jifenValueLabel.font = [UIFont systemFontOfSize:12.5];
        ((MineTableViewCell*)cell).jifenValueLabel.textColor = jifenColor;
        ((MineTableViewCell*)cell).accessoryTypeValueLabel.font = [UIFont systemFontOfSize:13];
        ((MineTableViewCell*)cell).accessoryTypeValueLabel.textColor = [UIColor whiteColor];

        ((MineTableViewCell*)cell).jifenSuperView.layer.borderColor = jifenColor.CGColor;
        ((MineTableViewCell*)cell).jifenSuperView.layer.borderWidth=1;
        
        cell.mineUserInf = _mineUserInfDatas[indexPath.row];
    }
    
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.height*0.5;
    cell.imageView.layer.masksToBounds = YES;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    if (indexPath.section != 0) {
        return otherRowHeightOfMe;
    }
    return firstRowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section!=2) {
        return 20;
    }
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        MyInformationViewController *myInformationVC = [[MyInformationViewController alloc]init];
        [self showViewController:myInformationVC sender:self];
    }
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
