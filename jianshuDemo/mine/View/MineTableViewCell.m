//
//  MineTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MineTableViewCell.h"
#import "PublicClass.h"




@implementation MineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _contentSize = frame.size;
    
    _headerImageView = [[UIImageView alloc]init];
    _jifenImageView = [[UIImageView alloc]init];
    _nameLabel = [[UILabel alloc]init];
    _jifenLabel = [[UILabel alloc]init];
    _jifenValueLabel = [[UILabel alloc]init];
    _jifenSuperView = [[UILabel alloc]init];
    _accessoryTypeValueLabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_jifenSuperView];
    [self.contentView addSubview:_jifenImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_jifenLabel];
    [self.contentView addSubview:_jifenValueLabel];
    [self.contentView addSubview:_accessoryTypeValueLabel];
    
    [_nameLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenValueLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_accessoryTypeValueLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_nameLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenValueLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_accessoryTypeValueLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [self layoutMyView];
    
    
    return self;
}


//监听代理方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context

{
    if(object ==_nameLabel){
        // 值变化后执行以下执行相关逻辑...
        CGSize size = CGSizeMake(_contentSize.width*0.6, _contentSize.height*0.5);
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_nameLabel.font.pointSize]};
        CGSize labelWidth = [PublicClass boolLabelLength:_nameLabel.text size:size option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.width.mas_equalTo(labelWidth.width+2);
        }];
        
    } else if (object ==_accessoryTypeValueLabel){
        CGSize accessoryTypeValueLabelSizeOfMax = CGSizeMake(_contentSize.width*0.2, _contentSize.height*0.3);
        NSDictionary *accessoryTypeValueLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_accessoryTypeValueLabel.font.pointSize]};
        CGSize accessoryTypeValueLabelSize = [PublicClass boolLabelLength:_accessoryTypeValueLabel.text size:accessoryTypeValueLabelSizeOfMax option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:accessoryTypeValueLabelDic];
        CGFloat accessoryTypeValueLabelWidth;
        if (accessoryTypeValueLabelSize.width+2 < _contentSize.height*0.3) {
            accessoryTypeValueLabelWidth = _contentSize.height*0.3;
        } else {
            accessoryTypeValueLabelWidth = accessoryTypeValueLabelSize.width+2;
        }
        
        //
        [self.topConstraint uninstall];
        [_accessoryTypeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_accessoryTypeValueLabel.superview.mas_right).offset(0);
            make.height.mas_equalTo(_accessoryTypeValueLabel.superview.mas_height).multipliedBy(0.3);
            self.topConstraint = make.width.mas_equalTo(accessoryTypeValueLabelWidth);
            make.centerY.mas_equalTo(_accessoryTypeValueLabel.superview);
            
        }];
        
        
        
    } else {
        CGSize jifenLabelSize = CGSizeMake(_contentSize.width*0.5, _contentSize.height*0.3);
        CGSize jifenValueLabelSize = CGSizeMake(_contentSize.width*0.5, _contentSize.height*0.3);
        NSDictionary *jifenLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_jifenLabel.font.pointSize]};
        CGSize jifenLabelWidth = [PublicClass boolLabelLength:_jifenLabel.text size:jifenLabelSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:jifenLabelDic];
        
        NSDictionary *jifenValueLabelDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_jifenValueLabel.font.pointSize]};
        CGSize jifenValueLabelWidth = [PublicClass boolLabelLength:_jifenValueLabel.text size:jifenValueLabelSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:jifenValueLabelDic];
        
        CGFloat jifenSuperViewWidth = jifenLabelWidth.width+jifenValueLabelWidth.width+5;
        [_jifenSuperView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLabel.mas_bottom).offset(0);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.15);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.right.mas_equalTo(_jifenImageView.mas_right).multipliedBy(1.1).offset(jifenSuperViewWidth);
            
        }];
    
        [_jifenLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_jifenImageView.mas_right).multipliedBy(1.1);
            make.height.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.6);
            make.centerY.mas_equalTo(_jifenSuperView);
            make.width.mas_equalTo(jifenLabelWidth.width+2);
        }];
        
        [_jifenValueLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_jifenLabel.mas_right).offset(0);
            make.height.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.6);
            make.width.mas_equalTo(jifenValueLabelWidth.width+2);
            make.centerY.mas_equalTo(_jifenSuperView);
        }];
        
    }
    
}

//-(void)updateLayoutView:(UIView*)view {
//    view.backgroundColor = [UIColor yellowColor];
//
//}

-(void)layoutMyView {
//    _headerImageView.backgroundColor = [UIColor redColor];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.height.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(0.6);
        make.width.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(0.6);
        make.centerY.mas_equalTo(_headerImageView.superview);
    }];
    
//    _nameLabel.backgroundColor = [UIColor brownColor];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
        make.width.mas_greaterThanOrEqualTo(_nameLabel.superview.mas_width).multipliedBy(0.2);
    }];

//    _jifenSuperView.backgroundColor = [UIColor grayColor];
    [_jifenSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.15);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
        make.width.mas_greaterThanOrEqualTo(_nameLabel.superview.mas_width).multipliedBy(0.2);
    }];
    
//    _jifenImageView.backgroundColor = [UIColor redColor];
    [_jifenImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_jifenSuperView.mas_left).multipliedBy(1.1);
        make.height.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.6);
        make.width.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.5);
        make.centerY.mas_equalTo(_jifenSuperView);
    }];

//    _jifenLabel.backgroundColor = [UIColor blueColor];
    [_jifenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_jifenImageView.mas_right).multipliedBy(1.1);
        make.width.mas_equalTo(_jifenSuperView.mas_width).multipliedBy(0.25);
        make.height.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.6);
        make.centerY.mas_equalTo(_jifenSuperView);
    }];
    
//    _jifenValueLabel.backgroundColor = [UIColor yellowColor];
    [_jifenValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_jifenLabel.mas_right).offset(0);
        make.height.mas_equalTo(_jifenSuperView.mas_height).multipliedBy(0.6);
        make.width.mas_equalTo(_jifenSuperView.mas_width).multipliedBy(0.45);
        make.centerY.mas_equalTo(_jifenSuperView);
    }];
    
//     _accessoryTypeValueLabel.backgroundColor = [UIColor yellowColor];
    [_accessoryTypeValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_accessoryTypeValueLabel.superview.mas_right).offset(0);
        make.height.mas_equalTo(_accessoryTypeValueLabel.superview.mas_height).multipliedBy(0.3);
        self.topConstraint = make.width.mas_equalTo(_accessoryTypeValueLabel.superview.mas_width).multipliedBy(0.1);
        make.centerY.mas_equalTo(_accessoryTypeValueLabel.superview);
    }];
}

-(void)setMineTitle:(MineTitleClass *)mineTitle {
    self.textLabel.text = mineTitle.titleName;
    self.detailTextLabel.text = mineTitle.articleCounts;
    
    //如果是从网络获取图片数据，则在这里请求网络获取图片；
    
    
}

-(void)setMineUserInf:(MineUserInformationClass *)mineUserInf {
    self.nameLabel.text = mineUserInf.userName;
    self.jifenLabel.text = mineUserInf.userPoint;
    self.jifenValueLabel.text = mineUserInf.userPointValue;
    self.headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    self.jifenImageView.image = [UIImage imageNamed:@"icon_mine_pts"];
}

-(void)dealloc {
    
    [_nameLabel removeObserver:self forKeyPath:@"text"];
    [_jifenLabel removeObserver:self forKeyPath:@"text"];
    [_accessoryTypeValueLabel removeObserver:self forKeyPath:@"text"];
    [_jifenValueLabel removeObserver:self forKeyPath:@"text"];
    
    [_nameLabel removeObserver:self forKeyPath:@"font"];
    [_jifenLabel removeObserver:self forKeyPath:@"font"];
    [_accessoryTypeValueLabel removeObserver:self forKeyPath:@"font"];
    [_jifenValueLabel removeObserver:self forKeyPath:@"font"];
}

@end
