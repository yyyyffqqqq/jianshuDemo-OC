//
//  JianShuTableViewCell.h
//  CustomTableViewCell
//
//  Created by quan on 16/8/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JianShuCellStyleHasNoneView,          //没有内容缩略图和专题button
    JianShuCellStyleHasSpecialTopicView,  //只有专题button
    JianShuCellStyleHasContentImageView,  //只有内容缩略图
    JianShuCellStyleHasAllView,           //有内容缩略图和专题button
} JianShuCellStyle;

@interface JianShuTableViewCell : UITableViewCell

@property (nonatomic, assign) CGFloat contentImageViewSize; //缩略图大小

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
