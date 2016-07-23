//
//  UserInforTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/22.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQPageScrollView.h"
#import "FQPageFirstView.h"
#import "FQPageSecondView.h"
#import "FQPageThirdView.h"

@interface UserInforTableViewCell : UITableViewCell

/** 
 横向滑动视图
 */
@property (strong, nonatomic) FQPageScrollView *pageScrollView;

/**
 初始化方法
 size - 视图大小
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;

@end
