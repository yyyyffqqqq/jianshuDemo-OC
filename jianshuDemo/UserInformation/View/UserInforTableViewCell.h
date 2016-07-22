//
//  UserInforTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/22.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQPageScrollView.h"

@interface UserInforTableViewCell : UITableViewCell

@property (strong, nonatomic) FQPageScrollView *pageScrollView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;

@end
