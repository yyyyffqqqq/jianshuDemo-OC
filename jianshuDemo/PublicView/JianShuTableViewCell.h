//
//  JianShuTableViewCell.h
//  CustomTableViewCell
//
//  Created by quan on 16/8/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JianShuCellStyleHasNoneView,
    JianShuCellStyleHasSpecialTopicView,
    JianShuCellStyleHasContentImageView,
    JianShuCellStyleHasAllView,
} JianShuCellStyle;

@interface JianShuTableViewCell : UITableViewCell

@property CGFloat contentImageViewSize; //缩略图大小

@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIImageView *contentImageView;
@property (strong, nonatomic) UIButton *nameBt;
@property (strong, nonatomic) UILabel *publishDateLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UIButton *specialTopicBt;
@property (strong, nonatomic) UILabel *readedCommentLoveLabel;

@property (assign, nonatomic) JianShuCellStyle jianShuCellStyle;

- (instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
             jianShuCellStyle:(JianShuCellStyle)JianShuCellStyle;

@end
