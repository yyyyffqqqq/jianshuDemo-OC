//
//  HomeArticleListTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "HomeArticleListTableViewCell.h"
#import "PublicClass.h"
#import "UIImageView+WebCache.h"

@implementation HomeArticleListTableViewCell

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
    _contentImageView = [[UIImageView alloc]init];
    _nameBt = [[UIButton alloc]init];
    _publishDateLabel = [[UILabel alloc]init];
    _contentLabel = [[UILabel alloc]init];
    _specialTopicBt = [[UIButton alloc]init];
    _readedCommentLoveLabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_contentImageView];
    [self.contentView addSubview:_publishDateLabel];
    [self.contentView addSubview:_nameBt];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_specialTopicBt];
    [self.contentView addSubview:_readedCommentLoveLabel];
    
    
    [_nameBt.titleLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_publishDateLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_contentLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_readedCommentLoveLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_specialTopicBt.titleLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    
    [_nameBt.titleLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_publishDateLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_contentLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_readedCommentLoveLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_specialTopicBt.titleLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_contentImageView addObserver:self forKeyPath:@"image" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    _contentLabel.numberOfLines = 2;
    
    [_specialTopicBt setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];

    _nameBt.titleLabel.font = [UIFont systemFontOfSize:15];
    [_nameBt setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    _publishDateLabel.font = [UIFont systemFontOfSize:13];
    
    _readedCommentLoveLabel.font = [UIFont systemFontOfSize:12];
    _readedCommentLoveLabel.textColor = [UIColor colorWithWhite:0.7 alpha:0.9];
    
    [self layoutMyView];
    
    return self;
}

-(void)setHomeArticle:(FQHomeArticleClass *)homeArticle {
//    self.contentImageView.image = [UIImage imageNamed:homeArticle.contentImageUrl];
//    [UIImage imageNamed:@"img_default"]
    dispatch_async(dispatch_queue_create("queue", nil), ^{
        if (homeArticle.contentImageUrl == nil || ![homeArticle.contentImageUrl isEqualToString:@""]) {
            [self.contentImageView sd_setImageWithURL:[NSURL URLWithString: homeArticle.contentImageUrl] placeholderImage:[UIImage imageNamed:@"img_default"] options:SDWebImageProgressiveDownload | SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
        }
        
    });
    
    self.headerImageView.image = [UIImage imageNamed:homeArticle.headerImageUrl];
    [self.nameBt setTitle:homeArticle.nameString forState:UIControlStateNormal];
    self.publishDateLabel.text = homeArticle.publishDateString;
    self.contentLabel.text = homeArticle.contentString;
    [self.specialTopicBt setTitle:homeArticle.specialTopicString forState:UIControlStateNormal];
    self.readedCommentLoveLabel.text = homeArticle.readedCommentLoveString;
    
}


//监听代理方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context

{
    if(object ==_contentLabel){
        CGSize maxSize;
        if (_contentImageView.image) {
            maxSize = CGSizeMake(_contentSize.width - 15 - 15 - _contentSize.height*0.55, _contentSize.height*0.4);
        } else {
            maxSize = CGSizeMake(_contentSize.width*0.9, _contentSize.height*0.4);
        }
        
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_contentLabel.font.pointSize]};
        CGSize labelSize = [PublicClass boolLabelLength:_contentLabel.text size:maxSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
            make.width.mas_equalTo(labelSize.width+2);
            make.height.mas_equalTo(labelSize.height+2);
            make.centerY.mas_equalTo(_contentLabel.superview);
        }];
        
        
    } else if(object ==_nameBt){
        // 值变化后执行以下执行相关逻辑...
        CGSize size = CGSizeMake(_contentSize.width*0.35, _contentSize.height*0.2);
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_nameBt.titleLabel.font.pointSize]};
        CGSize labelWidth = [PublicClass boolLabelLength:_nameBt.titleLabel.text size:size option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        [_nameBt mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.05);
            make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
            make.width.mas_equalTo(labelWidth.width+2);
            make.centerY.mas_equalTo(_headerImageView);
        }];
        
        
        
    } else if (object ==_publishDateLabel){
        CGSize publishDateSizeOfMax = CGSizeMake(_contentSize.width*0.35, _contentSize.height*0.2);
        NSDictionary *publishDateDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_publishDateLabel.font.pointSize]};
        CGSize publishDateSize = [PublicClass boolLabelLength:_publishDateLabel.text size:publishDateSizeOfMax option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:publishDateDic];
        
        [_publishDateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameBt.mas_right).multipliedBy(1.05);
            make.height.mas_equalTo(_nameBt.mas_height);
            make.width.mas_equalTo(publishDateSize.width+2);
            make.centerY.mas_equalTo(_nameBt);
        }];
        
        
        
    } else if (object == _contentImageView) {
        
        CGSize specialTopicBtSize = CGSizeMake(_contentSize.width*0.5, _contentSize.height*0.3);
        
        NSDictionary *specialTopicBtDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_specialTopicBt.titleLabel.font.pointSize]};
        CGSize specialTopicBtWidth = [PublicClass boolLabelLength:_specialTopicBt.titleLabel.text size:specialTopicBtSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:specialTopicBtDic];
        
        [_specialTopicBt mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLabel.mas_left);
            make.height.mas_equalTo(_specialTopicBt.superview.mas_height).multipliedBy(0.2);
            make.width.mas_equalTo(specialTopicBtWidth.width+2);
            make.top.mas_equalTo(_contentLabel.mas_bottom).offset(_contentSize.height*0.06);
        }];
        
        [_readedCommentLoveLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
            make.height.mas_equalTo(_specialTopicBt);
            make.right.mas_equalTo(_contentImageView.mas_left);
            make.centerY.mas_equalTo(_specialTopicBt);
        }];
        
        CGSize maxSize;
        if (_contentImageView.image) {
            maxSize = CGSizeMake(_contentSize.width - 15 - 15 - _contentSize.height*0.55, _contentSize.height*0.4);
        } else {
            maxSize = CGSizeMake(_contentSize.width*0.9, _contentSize.height*0.4);
        }
        
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:_contentLabel.font.pointSize]};
        CGSize labelSize = [PublicClass boolLabelLength:_contentLabel.text size:maxSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
            make.width.mas_equalTo(labelSize.width+2);
            make.height.mas_equalTo(labelSize.height+2);
            make.centerY.mas_equalTo(_contentLabel.superview);
        }];
        
    } else {
        CGSize specialTopicBtSize = CGSizeMake(_contentSize.width*0.8, _contentSize.height*0.3);
        
        NSDictionary *specialTopicBtDic = @{NSFontAttributeName : [UIFont systemFontOfSize:_specialTopicBt.titleLabel.font.pointSize]};
        CGSize specialTopicBtWidth = [PublicClass boolLabelLength:_specialTopicBt.titleLabel.text size:specialTopicBtSize option: NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:specialTopicBtDic];
        
        [_specialTopicBt mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLabel.mas_left);
            make.height.mas_equalTo(_specialTopicBt.superview.mas_height).multipliedBy(0.2);
            make.width.mas_equalTo(specialTopicBtWidth.width+2);
            make.top.mas_equalTo(_contentLabel.mas_bottom).offset(_contentSize.height*0.06);
        }];
        
        if (_contentImageView.image) {
            [_readedCommentLoveLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
                make.height.mas_equalTo(_specialTopicBt);
                make.right.mas_equalTo(_contentImageView.mas_left);
                make.centerY.mas_equalTo(_specialTopicBt);
            }];
        } else {
            [_readedCommentLoveLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
                make.height.mas_equalTo(_specialTopicBt);
                make.right.mas_equalTo(_readedCommentLoveLabel.superview.mas_right);
                make.centerY.mas_equalTo(_specialTopicBt);
            }];
        }
        
    }
    
}


-(void)layoutMyView {
    
//    _contentLabel.backgroundColor = [UIColor blueColor];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
        make.width.mas_equalTo(_contentLabel.superview.mas_width).multipliedBy(0.5).priorityLow();
        make.height.mas_equalTo(_contentLabel.superview.mas_height).multipliedBy(0.2).priorityLow();
        make.centerY.mas_equalTo(_contentLabel.superview);
    }];
    
//    _headerImageView.backgroundColor = [UIColor redColor];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_contentLabel.mas_left);
        make.height.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(0.15);
        make.width.mas_equalTo(_headerImageView.superview.mas_height).multipliedBy(0.15);
        make.bottom.mas_equalTo(_contentLabel.mas_top).offset(-_contentSize.height*0.06);
    }];
    
//    _nameLabel.backgroundColor = [UIColor brownColor];
    [_nameBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImageView.mas_right).multipliedBy(1.05);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.8);
        make.width.equalTo(_nameBt.superview.mas_width).multipliedBy(0.2).priorityLow();
        make.centerY.mas_equalTo(_headerImageView);
    }];
    
//    _publishDateLabel.backgroundColor = [UIColor redColor];
    [_publishDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameBt.mas_right).multipliedBy(1.05);
        make.height.mas_equalTo(_nameBt.mas_height);
        make.width.mas_equalTo(_nameBt.mas_width).priorityLow();
        make.centerY.mas_equalTo(_nameBt);
    }];
    
//    _contentImageView.backgroundColor = [UIColor grayColor];
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_contentImageView.superview.mas_right).offset(-15);
        make.height.mas_equalTo(_contentImageView.superview.mas_height).multipliedBy(0.55);
        make.width.mas_equalTo(_contentImageView.superview.mas_height).multipliedBy(0.55);
        make.centerY.mas_equalTo(_contentLabel.superview);
    }];
    
//    _specialTopicBt.backgroundColor = [UIColor yellowColor];
    [_specialTopicBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_contentLabel.mas_left);
        make.height.mas_equalTo(_specialTopicBt.superview.mas_height).multipliedBy(0.2);
        make.width.mas_equalTo(_specialTopicBt.superview.mas_width).multipliedBy(0.2).priorityLow();
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(_contentSize.height*0.06).priorityLow();
    }];
    
//     _readedCommentLoveLabel.backgroundColor = [UIColor yellowColor];
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_specialTopicBt.mas_right).offset(5);
        make.height.mas_equalTo(_specialTopicBt).priorityLow();
        make.width.mas_equalTo(_readedCommentLoveLabel.superview.mas_width).multipliedBy(0.2).priorityLow();
        make.centerY.mas_equalTo(_specialTopicBt).priorityLow();
    }];
}

-(void)dealloc {
    
    [_nameBt.titleLabel removeObserver:self forKeyPath:@"text"];
    [_publishDateLabel removeObserver:self forKeyPath:@"text"];
    [_contentLabel removeObserver:self forKeyPath:@"text"];
    [_readedCommentLoveLabel removeObserver:self forKeyPath:@"text"];
    [_specialTopicBt.titleLabel removeObserver:self forKeyPath:@"text"];
    
    [_nameBt.titleLabel removeObserver:self forKeyPath:@"font"];
    [_publishDateLabel removeObserver:self forKeyPath:@"font"];
    [_contentLabel removeObserver:self forKeyPath:@"font"];
    [_readedCommentLoveLabel removeObserver:self forKeyPath:@"font"];
    [_specialTopicBt.titleLabel removeObserver:self forKeyPath:@"font"];
    
    [_contentImageView removeObserver:self forKeyPath:@"image"];
}

@end
