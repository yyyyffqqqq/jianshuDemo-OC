//
//  UserInforTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/22.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "UserInforTableViewCell.h"


@implementation UserInforTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    //测试自定义的分页scrollView;
    _pageScrollView = [[FQPageScrollView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    _pageScrollView.showsHorizontalScrollIndicator = NO;
    FQPageFirstView *firstView = [[FQPageFirstView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    UIView *secondView = [[FQPageSecondView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    UIView *thirdView = [[FQPageThirdView alloc]init];
    
    NSArray *views = @[firstView, secondView, thirdView];
    
    [_pageScrollView addCustomSubviews:views]; //添加子视图
    
    [_pageScrollView setCurrentSelectedIndex:2]; //默认显示第三个视图
    
    [self.contentView addSubview:_pageScrollView];
    
    
    return self;
}


@end
