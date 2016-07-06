//
//  AttenssionTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "AttenssionTableViewCell.h"
#import "PublicClass.h"

@implementation AttenssionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _contentSize = frame.size;
    
    _headerImageView = [[UIImageView alloc]init];
    _nameLabel = [[UILabel alloc]init];
    _contentLabel = [[UILabel alloc]init];
    _accessoryTypeValueLabel = [[UILabel alloc]init];
    
    _titleLabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_accessoryTypeValueLabel];
    
    
    [_nameLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_contentLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_accessoryTypeValueLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_titleLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_nameLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_contentLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_accessoryTypeValueLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_titleLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    _accessoryTypeValueLabel.textAlignment = NSTextAlignmentCenter;

    
    [self layoutMyView];
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(object ==_nameLabel){
        // 值变化后执行以下执行相关逻辑...
        CGSize size = CGSizeMake(_contentSize.width*0.6, _contentSize.height*0.3);
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_nameLabel.font.pointSize]};
        CGSize labelWidth = [PublicClass boolLabelLength:_nameLabel.text size:size option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.width.mas_equalTo(labelWidth.width+2);
        }];
        
    } else if (object ==_accessoryTypeValueLabel){
        CGSize accessoryTypeValueLabelSizeOfMax = CGSizeMake(_contentSize.width*0.2, _contentSize.height*accessoryTypeValueLabelHeight);
        NSDictionary *accessoryTypeValueLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_accessoryTypeValueLabel.font.pointSize]};
        CGSize accessoryTypeValueLabelSize = [PublicClass boolLabelLength:_accessoryTypeValueLabel.text size:accessoryTypeValueLabelSizeOfMax option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:accessoryTypeValueLabelDic];
        CGFloat accessoryTypeValueLabelWidth;
        if (accessoryTypeValueLabelSize.width+2 < _contentSize.height*accessoryTypeValueLabelHeight) {
            accessoryTypeValueLabelWidth = _contentSize.height*accessoryTypeValueLabelHeight;
        } else {
            accessoryTypeValueLabelWidth = accessoryTypeValueLabelSize.width+2;
        }
        //
        [self.topConstraint uninstall];
        [_accessoryTypeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_accessoryTypeValueLabel.superview.mas_right).offset(0);
            make.height.mas_equalTo(_accessoryTypeValueLabel.superview.mas_height).multipliedBy(accessoryTypeValueLabelHeight);
            self.topConstraint = make.width.mas_equalTo(accessoryTypeValueLabelWidth);
            make.centerY.mas_equalTo(_accessoryTypeValueLabel.superview);
            
        }];
        
        
        
    } else if (object == _contentLabel ) {
        CGSize _contentLabelSize = CGSizeMake(_contentSize.width*0.5, _contentSize.height*0.3);
        NSDictionary *_contentLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_contentLabel.font.pointSize]};
        CGSize _contentLabelWidth = [PublicClass boolLabelLength:_contentLabel.text size:_contentLabelSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:_contentLabelDic];
        
        
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLabel.mas_bottom).offset(0);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.15);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.width.mas_equalTo(_contentLabelWidth.width+2);
        }];
        
        
    } else { //_titleLabel
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGSize titleLabelSize = CGSizeMake(_contentSize.width*0.7, _contentSize.height*0.3);
            NSDictionary *titleLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_contentLabel.font.pointSize]};
            CGSize titleLabelWidth = [PublicClass boolLabelLength:_titleLabel.text size:titleLabelSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:titleLabelDic];
            make.width.mas_equalTo(titleLabelWidth.width);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
            make.centerY.mas_equalTo(_titleLabel.superview);
            
        }];
    }
    
}

-(void)layoutMyView {
//    _headerImageView.backgroundColor = [UIColor redColor];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.height.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(headerImageViewHeight);
        make.width.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(headerImageViewHeight);
        make.centerY.mas_equalTo(_headerImageView.superview);
    }];
    
//    _nameLabel.backgroundColor = [UIColor brownColor];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
        make.width.mas_greaterThanOrEqualTo(_nameLabel.superview.mas_width).multipliedBy(0.2);
    }];
    
//    _contentLabel.backgroundColor = [UIColor grayColor];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.15);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
        make.width.mas_greaterThanOrEqualTo(_nameLabel.superview.mas_width).multipliedBy(0.2);
    }];
    
//     _accessoryTypeValueLabel.backgroundColor = [UIColor yellowColor];
    [_accessoryTypeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_accessoryTypeValueLabel.superview.mas_right).offset(0);
        make.height.mas_equalTo(_accessoryTypeValueLabel.superview.mas_height).multipliedBy(accessoryTypeValueLabelHeight);
        self.topConstraint = make.width.mas_equalTo(_accessoryTypeValueLabel.superview.mas_width).multipliedBy(0.1);
        make.centerY.mas_equalTo(_accessoryTypeValueLabel.superview);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_titleLabel.superview.mas_width).multipliedBy(0.2);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
        make.centerY.mas_equalTo(_titleLabel.superview);
    }];
    
}

-(void)dealloc {
    
    [_nameLabel removeObserver:self forKeyPath:@"text"];
    [_contentLabel removeObserver:self forKeyPath:@"text"];
    [_accessoryTypeValueLabel removeObserver:self forKeyPath:@"text"];
    [_titleLabel removeObserver:self forKeyPath:@"text"];
    
    [_nameLabel removeObserver:self forKeyPath:@"font"];
    [_contentLabel removeObserver:self forKeyPath:@"font"];
    [_accessoryTypeValueLabel removeObserver:self forKeyPath:@"font"];
    [_titleLabel removeObserver:self forKeyPath:@"font"];
}


@end
