//
//  FQPageFirstView.m
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPageFirstView.h"
#import "Masonry.h"

@implementation StatusAuthorView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
        
    }
    
    return self;
}

- (void)createView {
    _attentionBtWidth = 60;
    
    _headerImageView = [[UIImageView alloc]init];
    _authorNameLabel = [[UILabel alloc]init];
    
    _detailLabel = [[UILabel alloc]init];
    
    _attentionBt = [[UIButton alloc]init];
    _attentionBt.center = CGPointMake(_attentionBt.center.x, _headerImageView.center.y);
    
    [self addSubview:_headerImageView];
    [self addSubview:_authorNameLabel];
    [self addSubview:_detailLabel];
    [self addSubview:_attentionBt];
    
    _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    _authorNameLabel.text = @"yyyyyyyyyy";
    _detailLabel.text = @"fdvhkcaadddcsvdvsdvs";
    [_attentionBt setTitle:@"已关注" forState:UIControlStateNormal];
    
//    _headerImageView.backgroundColor = [UIColor greenColor];
//
//    _authorNameLabel.backgroundColor = [UIColor blueColor];
//
//    _detailLabel.backgroundColor = [UIColor yellowColor];
//    _attentionBt.backgroundColor = [UIColor brownColor];
    
    [self createViewWithMasonryLayout];
}

- (void)createViewWithMasonryLayout {
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(20);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(10);
        make.size.mas_equalTo(40);
    }];
    [_authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_authorNameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_attentionBt.mas_left).offset(-20);
        make.bottom.mas_equalTo(_detailLabel.superview.mas_bottom).offset(-20);
    }];
    [_attentionBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(_attentionBtWidth);
        make.centerY.mas_equalTo(_headerImageView);
        make.right.mas_equalTo(_headerImageView.superview.mas_right).offset(-15);
    }];
    
    
}

@end

@interface StatusArticleView ()


@end

@implementation StatusArticleView

- (instancetype)initWithHasContentImage:(BOOL)hasContentImage {
    self = [super init];
    if (self) {
        _hasContentImage = hasContentImage;
        [self createViews];
        
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame hasContentImage:(BOOL)hasContentImage{
    self = [super initWithFrame:frame];
    if (self) {
        _hasContentImage = hasContentImage;
        [self createViews];
        
    }
    
    return self;
}

- (void)createViews {
    _titleTextLabel = [[UILabel alloc]init];
    
    _contentImageView = [[UIImageView alloc]init];
    
    
    _contentLabel = [[UILabel alloc]init];
    
    _authorNameLabel = [[UILabel alloc]init];
    
    _readedCommentLoveLabel = [[UILabel alloc]init];
    
    
    [self addSubview:_titleTextLabel];
    [self addSubview:_contentImageView];
    [self addSubview:_contentLabel];
    [self addSubview:_authorNameLabel];
    [self addSubview:_readedCommentLoveLabel];
    
    
    _titleTextLabel.text = @"ios fhksfsfvxnfkjmgsffwakkkygdgdgsfsfs";
    _contentLabel.text = @"vcdhhslllllll阅读lllladadsdsddsadsdadadfdsfssdgdagaasdjghhkghgjgjgjgjhgkjkvbvxvdfdsdvss";
    _contentLabel.numberOfLines = 3;
    _contentLabel.font = [UIFont systemFontOfSize:12];
    _authorNameLabel.text = @"yyyqqqq";
    _readedCommentLoveLabel.text = @"阅读 25 • 评论 15 • 喜欢 888";
    
    _authorNameLabel.font = [UIFont systemFontOfSize:12];
    _readedCommentLoveLabel.font = _authorNameLabel.font;
    
    //        _titleTextLabel.backgroundColor = [UIColor redColor];
    //        _contentImageView.backgroundColor = [UIColor grayColor];
    //        _contentLabel.backgroundColor = [UIColor blueColor];
    //        _authorNameLabel.backgroundColor = [UIColor greenColor];
    //        _readedCommentLoveLabel.backgroundColor = [UIColor yellowColor];
    
    //        [_contentImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew  context:nil];
    
    _contentImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    
    [self createViewWithMasonryLayout];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                    ofObject:(id)object
                    change:(NSDictionary *)change
                    context:(void *)context {
    if (object == _contentImageView) {
        
    }
    
}

- (void)createViewWithMasonryLayout {
    
    [_titleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(_titleTextLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_titleTextLabel.superview.mas_right).offset(-15);
    }];
    
    //如果有内容缩略图
    CGFloat contentImageWidth;
    CGFloat contentImageHeight = 60;
    CGFloat contentImageAndContentTextMargin;
    if (_hasContentImage) {
        contentImageWidth = 60;
        contentImageAndContentTextMargin = 5;
    } else {
        contentImageWidth = 0;
        contentImageAndContentTextMargin = 0;
    }
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleTextLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(_titleTextLabel.superview.mas_left).offset(15);
        make.height.mas_equalTo(contentImageHeight);
        make.width.mas_equalTo(contentImageWidth);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentImageView.mas_top);
        make.left.mas_equalTo(_contentImageView.mas_right).offset(contentImageAndContentTextMargin);
        make.height.mas_equalTo(_contentImageView.mas_height);
        make.right.mas_equalTo(_contentLabel.superview.mas_right).offset(-15);
    }];
    [_authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(_contentLabel.superview.mas_left).offset(15);
    }];
    [_readedCommentLoveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_authorNameLabel.mas_right).offset(5);
        make.height.mas_equalTo(_authorNameLabel.mas_height);
        make.top.mas_equalTo(_authorNameLabel.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
    }];
    
}


-(void)dealloc {
//    [_contentImageView removeObserver:self forKeyPath:@"image"];
}


@end

@implementation StatusSpecialTopicView

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self createView];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createView];
        
    }
    
    return self;
}

- (void)createView {
    _statusSpecialTopicView = [[StatusAuthorView alloc]init];
    
    
    _separatorLineView = [[UIView alloc]init];
    
    _summaryLabel = [[UILabel alloc]init];
    
    [self addSubview:_statusSpecialTopicView];
    [self addSubview:_separatorLineView];
    [self addSubview:_summaryLabel];
    _summaryLabel.numberOfLines = 2;
    _summaryLabel.text = @"一起讨论iOS 开发 kfsfsfdfddddhghfhfghfgffsfsfsdfsdfsfsfsfafjhkkihmbmggd";
    
    _separatorLineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    
    //_statusSpecialTopicView.backgroundColor = [UIColor redColor];
    //
    //_summaryLabel.backgroundColor = [UIColor yellowColor];
    
    [self createViewWithMasonryLayout];
}

- (void)createViewWithMasonryLayout {
    
    [_statusSpecialTopicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_statusSpecialTopicView.superview.mas_top).offset(0);
        make.left.mas_equalTo(_statusSpecialTopicView.superview.mas_left).offset(0);
        make.right.mas_equalTo(_statusSpecialTopicView.superview.mas_right);
    }];
    [_separatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_statusSpecialTopicView.mas_bottom).offset(0);
        make.left.mas_equalTo(_separatorLineView.superview.mas_left).offset(15);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(_separatorLineView.superview.mas_right).offset(-15);
    }];
    [_summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_separatorLineView.mas_bottom).offset(20);
        make.left.mas_equalTo(_summaryLabel.superview.mas_left).offset(15);
        make.right.mas_lessThanOrEqualTo(_summaryLabel.superview.mas_right).offset(-15);
        make.bottom.mas_equalTo(_summaryLabel.superview.mas_bottom).offset(-20);
    }];
    
}

@end

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
              timeLineCellStyle:(TimeLineCellStyle)timeLineCellStyle
              hasContentImage:(BOOL)hasContentImage
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        if (TimeLineCellStyleShowStatusArticleView == timeLineCellStyle) {
            _statusArticleViewHasContentImage = hasContentImage;
        }
        
        _headerImageView = [[UIImageView alloc]init];
        _userNameLabel = [[UILabel alloc]init];
        
        _dateLabel = [[UILabel alloc]init];

        _targetLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:_headerImageView];
        [self.contentView addSubview:_userNameLabel];
        [self.contentView addSubview:_dateLabel];
        [self.contentView addSubview:_targetLabel];
        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        
//        _headerImageView.backgroundColor = [UIColor grayColor];
//        _userNameLabel.backgroundColor = [UIColor purpleColor];
//        _dateLabel.backgroundColor = [UIColor brownColor];
//        _targetLabel.backgroundColor = [UIColor greenColor];
        
        _userNameLabel.text = @"name";
        _dateLabel.text = @"06.12 12:24";
        _targetLabel.text = @"关注了。。。";
        
//        _dateLabel.numberOfLines = 1;
        
        switch (timeLineCellStyle) {
            case TimeLineCellStyleNotShowOtherViews:
                [self createWithNotShowOtherViews];
                break;
            case TimeLineCellStyleShowStatusAuthorView:
                [self createWithStatusAuthorView];
                break;
            case TimeLineCellStyleShowStatusArticleView:
                [self createWithStatusArticleView];
                break;
            case TimeLineCellStyleshowStatusSpecialTopicView:
                [self createWithStatusSpecialTopicView];
                break;
                
            default:
                break;
        }
    }
    
    return self;
}

- (void)createWithNotShowOtherViews {
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(20);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(40);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_targetLabel.mas_left);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_targetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_userNameLabel.mas_right);
        make.centerY.mas_equalTo(_userNameLabel);
        make.right.mas_lessThanOrEqualTo(_targetLabel.superview.mas_right).offset(-15);
        make.height.mas_equalTo(_userNameLabel.mas_height);
    }];
    
    
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_dateLabel.superview.mas_right).offset(-20);
        make.bottom.mas_equalTo(_dateLabel.superview.mas_bottom).offset(-20);
    }];
    
}

- (void)createWithStatusAuthorView {
    _statusAuthorView = [[StatusAuthorView alloc]init];
    
    [self.contentView addSubview:_statusAuthorView];
    
    _statusAuthorView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(20);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(40);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_targetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_userNameLabel.mas_right);
        make.centerY.mas_equalTo(_userNameLabel);
        make.right.mas_lessThanOrEqualTo(_headerImageView.superview.mas_right).offset(-15);
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_dateLabel.superview.mas_right).offset(-15);
        
    }];
    [_statusAuthorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dateLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(_headerImageView.mas_left);
        make.right.mas_equalTo(_statusAuthorView.superview.mas_right).offset(-15);
        make.bottom.mas_equalTo(_statusAuthorView.superview.mas_bottom).offset(-20);
    }];
}

- (void)createWithStatusArticleView {
    //初始化为有缩略图的文章视图；
    _statusArticleView = [[StatusArticleView alloc]initWithHasContentImage:_statusArticleViewHasContentImage];
    [self.contentView addSubview:_statusArticleView];
    _statusArticleView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(20);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(40);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_targetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_userNameLabel.mas_right);
        make.centerY.mas_equalTo(_userNameLabel);
        make.right.mas_lessThanOrEqualTo(_headerImageView.superview.mas_right).offset(-15);
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_dateLabel.superview.mas_right).offset(-20);
    }];
    [_statusArticleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dateLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(_headerImageView.mas_left);
        make.right.mas_lessThanOrEqualTo(_statusArticleView.superview.mas_right).offset(-15);
        make.bottom.mas_equalTo(_statusArticleView.superview.mas_bottom).offset(-20);
    }];
}

- (void)createWithStatusSpecialTopicView {
    _statusSpecialTopicView = [[StatusSpecialTopicView alloc]init];
    [self.contentView addSubview:_statusSpecialTopicView];
    _statusSpecialTopicView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.superview.mas_top).offset(20);
        make.left.mas_equalTo(_headerImageView.superview.mas_left).offset(15);
        make.size.mas_equalTo(40);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerImageView.mas_top).offset(0);
        make.left.mas_lessThanOrEqualTo(_headerImageView.mas_right).offset(10);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_targetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_userNameLabel.mas_right);
        make.centerY.mas_equalTo(_userNameLabel);
        make.right.mas_lessThanOrEqualTo(_headerImageView.superview.mas_right).offset(-15);
        make.height.mas_equalTo(_headerImageView.mas_height).multipliedBy(0.5);
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_headerImageView.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(_dateLabel.superview.mas_right).offset(-20);
    }];
    [_statusSpecialTopicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dateLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(_headerImageView.mas_left);
        make.right.mas_lessThanOrEqualTo(_statusSpecialTopicView.superview.mas_right).offset(-15);
        make.bottom.mas_equalTo(_statusSpecialTopicView.superview.mas_bottom).offset(-20);
    }];
}


@end

@implementation FQPageFirstView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [super renderUI];
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
    }
    
    
    return self;
}


-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //因为是demo，所这块暂时不做优化
    TimeLineCellStyle style = TimeLineCellStyleShowStatusArticleView;
    if (indexPath.row == 1) {
        style = TimeLineCellStyleShowStatusAuthorView;
    }
    
    if (indexPath.row == 3) {
        style = TimeLineCellStyleshowStatusSpecialTopicView;
    }
    
    if (indexPath.row == 14) {
        style = TimeLineCellStyleNotShowOtherViews;
    }
    
    BOOL hasContentImage = NO;
    
    if (indexPath.row == 5 || indexPath.row == 7) {
        hasContentImage = YES;
    }
    
    static NSString *reuseIdentifier = @"cellID2";
    //显示数据，暂时不获取；
    FirstTableViewCell *cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier timeLineCellStyle:style hasContentImage:hasContentImage];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


-(void)dealloc {

}

@end
