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
    
    //测试自定义的分页scrollView；
    _pageScrollView = [[FQPageScrollView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    UIView *view1 = [[UIView alloc]init];
    UIView *view2 = [[UIView alloc]init];
    UIView *view3 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor greenColor];
    view3.backgroundColor = [UIColor yellowColor];
    
    NSArray *views = @[view1, view2, view3];
    
    [_pageScrollView addCustomSubview:views];
    
    [self.contentView addSubview:_pageScrollView];
    
    
    return self;
}


@end
