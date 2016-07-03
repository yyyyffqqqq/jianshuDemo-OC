//
//  MineTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/4.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MineTableViewCell.h"
#import "PublicClass.h"

#define jifenColor [UIColor brownColor]


@implementation MineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _headerImageView = [[UIImageView alloc]init];
    _jifenImageView = [[UIImageView alloc]init];
    _nameLabel = [[UILabel alloc]init];
    _jifenLabel = [[UILabel alloc]init];
    _jifenValueLabel = [[UILabel alloc]init];
    _jifenSuperView = [[UILabel alloc]init];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_jifenSuperView];
    [self.contentView addSubview:_jifenImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_jifenLabel];
    [self.contentView addSubview:_jifenValueLabel];
    
    [_nameLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenValueLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_nameLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_jifenValueLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [self layoutMyView];
    
    _nameLabel.text = @"mary";
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    
    _jifenLabel.text = @"积分: ";
    _jifenLabel.font = [UIFont systemFontOfSize:13];
    _jifenLabel.adjustsFontSizeToFitWidth= YES;
    _jifenLabel.textColor = jifenColor;
    
    _jifenValueLabel.text = @"22222222224444446656562";
    _jifenValueLabel.font = [UIFont systemFontOfSize:12.5];
    _jifenValueLabel.adjustsFontSizeToFitWidth = YES;
    _jifenValueLabel.textColor = jifenColor;
    
    _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    _jifenImageView.image = [UIImage imageNamed:@"icon_mine_pts"];
    
    _jifenSuperView.layer.borderColor = jifenColor.CGColor;
    _jifenSuperView.layer.borderWidth=1;
    
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context

{
    if(object==_nameLabel){
//        if (![_nameLabel.text isEqualToString:@""]) {
//            
//        }
        // 值变化后执行以下执行相关逻辑...
        CGSize size = CGSizeMake(self.contentView.frame.size.width*0.5, self.contentView.frame.size.height*0.5);
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_nameLabel.font.pointSize]};
        CGSize labelWidth = [PublicClass boolLabelLength:_nameLabel.text size:size option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.1);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
            make.width.mas_equalTo(labelWidth.width+2);
        }];
        
    } else {
//        if ((![_jifenLabel.text isEqualToString:@""]) || (![_jifenValueLabel.text isEqualToString:@""])) {
//            
//            _jifenValueLabel.hidden = NO;
//            _jifenLabel.hidden = NO;
//            
//            
//        }
        CGSize jifenLabelSize = CGSizeMake(self.contentView.frame.size.width*0.5, self.contentView.frame.size.height);
        CGSize jifenValueLabelSize = CGSizeMake(self.contentView.frame.size.width*0.65, self.contentView.frame.size.height);
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
            make.width.mas_equalTo(jifenValueLabelWidth.width);
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
}

@end
