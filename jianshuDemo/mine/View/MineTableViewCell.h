//
//  MineTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"

@interface MineTableViewCell : UITableViewCell

@property (nonatomic, strong) MASConstraint *topConstraint;

@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIImageView *jifenImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *jifenLabel;
@property (strong, nonatomic) UILabel *jifenValueLabel;
@property (strong, nonatomic) UILabel *jifenSuperView;

@end
