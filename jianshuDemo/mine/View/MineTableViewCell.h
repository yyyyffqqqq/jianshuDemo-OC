//
//  MineTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineUserInformationClass.h"
#import "MineTitleClass.h"
#import "Masonry.h"

#define jifenColor [UIColor brownColor]

@interface MineTableViewCell : UITableViewCell

@property (nonatomic, strong) MASConstraint *topConstraint;

@property (nonatomic) CGSize contentSize; //cell大小

@property (nonatomic, strong) MineTitleClass *mineTitle;
@property (nonatomic, strong) MineUserInformationClass *mineUserInf;

@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIImageView *jifenImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *jifenLabel;
@property (strong, nonatomic) UILabel *jifenValueLabel;
@property (strong, nonatomic) UILabel *jifenSuperView;

@property (strong, nonatomic) UILabel *accessoryTypeValueLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame;

@end
