//
//  AttenssionTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

#define accessoryTypeValueLabelHeight 0.3 //accessoryTypeValueLabel占self高度的百分比；
#define headerImageViewHeight 0.6 //accessoryTypeValueLabel占self高度的百分比；

@interface AttenssionTableViewCell : UITableViewCell


@property (nonatomic, strong) MASConstraint *topConstraint;

@property (nonatomic, strong) MASConstraint *topConstraint_2;

@property (nonatomic, assign) CGSize contentSize; //cell大小

@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UILabel *accessoryTypeValueLabel;

@property (strong, nonatomic) UILabel *titleLabel; //没有详细内容时，使用这个而不用nameLabel；

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame;

@end
