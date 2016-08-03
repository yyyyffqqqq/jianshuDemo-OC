//
//  JianShuTableViewCell.m
//  CustomTableViewCell
//
//  Created by quan on 16/8/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "JianShuTableViewCell.h"
#import "Masonry.h"

@implementation JianShuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
            jianShuCellStyle:(JianShuCellStyle)jianShuCellStyle
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _jianShuCellStyle = jianShuCellStyle;
        _contentImageViewSize = 80;
        
        [self createView ];
        
    }
    
    return self;
}

- (void)createView{
    _headerImageView = [UIImageView new];
    _nameBt = [UIButton new];
    _publishDateLabel = [UILabel new];
    _contentLabel = [UILabel new];
    _readedCommentLoveLabel = [UILabel new];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_nameBt];
    [self.contentView addSubview:_publishDateLabel];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_readedCommentLoveLabel];
    
    //默认preferredMaxLayoutWidth长度，如果有缩略图就修改
    _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width*0.9;
    
    switch (_jianShuCellStyle) {
        case JianShuCellStyleHasNoneView:
            [self layoutMySubViewsOfStatus1];
            break;
        case JianShuCellStyleHasSpecialTopicView:
            _specialTopicBt = [UIButton new];
            [self.contentView addSubview:_specialTopicBt];
            [self layoutMySubViewsOfStatus2];
            break;
        case JianShuCellStyleHasContentImageView:
            _contentImageView = [UIImageView new];
            [self.contentView addSubview:_contentImageView];
            _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width*0.7;
            [self layoutMySubViewsOfStatus3];
            break;
        case JianShuCellStyleHasAllView:
            _specialTopicBt = [UIButton new];
            _contentImageView = [UIImageView new];
            [self.contentView addSubview:_contentImageView];
            [self.contentView addSubview:_specialTopicBt];
            _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width*0.7;
            [self layoutMySubViewsOfStatus4];
            break;
        default:
            break;
    }
    
//    _headerImageView.backgroundColor = [UIColor redColor];
//    _nameBt.backgroundColor = [UIColor greenColor];
    [_nameBt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _nameBt.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
//    _publishDateLabel.backgroundColor = [UIColor grayColor];
    _publishDateLabel.text = @"07.08";
//    _contentLabel.backgroundColor = [UIColor yellowColor];
    _contentLabel.text = @"dsafsgdasdjfdjhklutyfsdfdggfhghjhgjhkjhkhjkhkhkfhgjhvbchfghgfhgfhfghgfhhdfgdfgdgdfgdfgdgdmmfskfsfdsfdfdfdsfdfdfsgjgftfwcxvcxvzczc";
    _contentLabel.numberOfLines = 2;
    
//    _readedCommentLoveLabel.backgroundColor = [UIColor blueColor];
    _readedCommentLoveLabel.text = @"gdfggdgdgfdfhgfhgfhgjhgjhjjkkjlfsddwererxvfcbddggfdfb";
    
    _specialTopicBt.layer.borderColor = [UIColor yellowColor].CGColor;
    _specialTopicBt.layer.borderWidth = 1;
    _specialTopicBt.layer.cornerRadius = 10;
    _specialTopicBt.layer.masksToBounds = YES;
    [_specialTopicBt setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _specialTopicBt.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [_specialTopicBt setTitle:@"ios Developer" forState:UIControlStateNormal];
//    _contentImageView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
    _contentImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    [_contentImageView setContentMode:UIViewContentModeScaleToFill];
}

/*
 *没有内容缩略图和专题button
 */
- (void)layoutMySubViewsOfStatus1 {
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(30);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(20);
        
    }];
    
    [_nameBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        
    }];
    
    [_publishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_nameBt.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        make.right.mas_lessThanOrEqualTo(_publishDateLabel.superview.mas_right).offset(15);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_contentLabel.superview.mas_right).offset(-20);
    }];
    
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_readedCommentLoveLabel.superview.mas_right).offset(-15);
        make.bottom.mas_lessThanOrEqualTo(self.contentView.mas_bottom).offset(-30);
    }];

}
/*
 *只有专题button
 */
- (void)layoutMySubViewsOfStatus2 {
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(30);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(20);
        
    }];
    
    [_nameBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        
    }];
    
    [_publishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_nameBt.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        make.right.mas_lessThanOrEqualTo(_publishDateLabel.superview.mas_right).offset(15);
        
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_contentLabel.superview.mas_right).offset(-20);
    }];
    
    [_specialTopicBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.height.mas_equalTo(30);
        make.bottom.mas_lessThanOrEqualTo(self.contentView.mas_bottom).offset(-30);
        
    }];
    
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
        make.right.mas_lessThanOrEqualTo(_readedCommentLoveLabel.superview.mas_right).offset(-15);
        make.centerY.mas_equalTo(_specialTopicBt);
    }];
}
/*
 *只有内容缩略图
 */
- (void)layoutMySubViewsOfStatus3 {
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(30);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(20);
        
    }];
    
    [_nameBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        
    }];
    
    [_publishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_nameBt.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        make.right.mas_lessThanOrEqualTo(_contentImageView.mas_left).offset(15);
    }];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_contentImageView.superview);
//        make.size.mas_equalTo(_contentImageView.superview.mas_height).multipliedBy(0.6);
        make.size.mas_equalTo(_contentImageViewSize);
        make.right.equalTo(_contentImageView.superview.mas_right).offset(-15);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
    }];
    
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_contentImageView.mas_left).offset(-20);
        make.bottom.mas_lessThanOrEqualTo(self.contentView.mas_bottom).offset(-30);
    }];
}
/*
 *有内容缩略图和专题button
 */
- (void)layoutMySubViewsOfStatus4 {
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(30);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(20);
        
    }];
    
    [_nameBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        
    }];
    
    [_publishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headerImageView).offset(0);
        make.left.mas_equalTo(_nameBt.mas_right).offset(5);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        make.right.mas_lessThanOrEqualTo(_contentImageView.mas_left).offset(-15);
    }];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_contentImageView.superview);
        make.size.mas_equalTo(_contentImageViewSize);
        make.right.equalTo(_contentImageView.superview.mas_right).offset(-15);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
    }];
    
    [_specialTopicBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.height.mas_equalTo(30);
        make.bottom.mas_lessThanOrEqualTo(self.contentView.mas_bottom).offset(-30);
        
    }];
    
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_specialTopicBt);
        make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
        make.right.mas_lessThanOrEqualTo(_contentImageView.mas_left).offset(-20);
    }];
    
}

@end
