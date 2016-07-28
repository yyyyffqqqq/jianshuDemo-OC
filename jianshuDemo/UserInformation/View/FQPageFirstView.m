//
//  FQPageFirstView.m
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPageFirstView.h"

@implementation StatusAuthorView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        //小数数值部分是占比
        
//        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, frame.size.height*0.5*0.5, frame.size.height*0.5, frame.size.height*0.5)];
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, frame.size.height*0.5*0.5, notShowOtherViewsRowHeight*0.5, notShowOtherViewsRowHeight*0.5)];
        _authorNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMinY(_headerImageView.frame), frame.size.width*0.5, _headerImageView.frame.size.height*0.5)];
        
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMaxY(_authorNameLabel.frame), frame.size.width*0.5, _headerImageView.frame.size.height*0.5)];
        
        _attentionBt = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(frame)-100, CGRectGetMidY(self.frame)-_headerImageView.frame.size.height*0.5*0.5, 80, frame.size.height*0.33)];
        _attentionBt.center = CGPointMake(_attentionBt.center.x, _headerImageView.center.y);
        
        [self addSubview:_headerImageView];
        [self addSubview:_authorNameLabel];
        [self addSubview:_detailLabel];
        [self addSubview:_attentionBt];
        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        _authorNameLabel.text = @"yyyyyyyyyy";
        _detailLabel.text = @"fdvhkcaadddcsvdvsdvs";
        [_attentionBt setTitle:@"已关注" forState:UIControlStateNormal];
        
//        _headerImageView.backgroundColor = [UIColor greenColor];
        
//        _authorNameLabel.backgroundColor = [UIColor blueColor];
    
//        _detailLabel.backgroundColor = [UIColor yellowColor];
//        _attentionBt.backgroundColor = [UIColor brownColor];
    }
    
    return self;
}


@end

@implementation StatusArticleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, frame.size.height*0.05, frame.size.width-30, frame.size.height*0.2)];
        
        _contentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleTextLabel.frame)+frame.size.height*0.05, 0, frame.size.height*0.4)];
        
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_contentImageView.frame)+15, CGRectGetMaxY(_titleTextLabel.frame)+frame.size.height*0.05, frame.size.width-CGRectGetWidth(_contentImageView.frame)-45, frame.size.height*0.4)];
        
        _authorNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_contentLabel.frame)+frame.size.height*0.05, frame.size.width*0.3, frame.size.height*0.1)];
        
        _readedCommentLoveLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_authorNameLabel.frame)+10, CGRectGetMaxY(_contentLabel.frame)+frame.size.height*0.05, frame.size.width*0.6, frame.size.height*0.1)];
        
        
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
        
        [_contentImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew  context:nil];
        
    }
    
    
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                    ofObject:(id)object
                    change:(NSDictionary *)change
                    context:(void *)context {
    if (object == _contentImageView) {
        NSLog(@"dsfs");
        _contentImageView.frame = CGRectMake(15, CGRectGetMaxY(_titleTextLabel.frame)+self.frame.size.height*0.05, self.frame.size.height*0.4, self.frame.size.height*0.4);
        
        _contentLabel.frame = CGRectMake(CGRectGetMaxX(_contentImageView.frame)+15, CGRectGetMaxY(_titleTextLabel.frame)+self.frame.size.height*0.05, self.frame.size.width-CGRectGetWidth(_contentImageView.frame)-45, self.frame.size.height*0.4);
        
        _authorNameLabel.frame = CGRectMake(15, CGRectGetMaxY(_contentLabel.frame)+self.frame.size.height*0.05, self.frame.size.width*0.3, self.frame.size.height*0.2);
        
        _readedCommentLoveLabel.frame = CGRectMake(CGRectGetMaxX(_authorNameLabel.frame)+10, CGRectGetMaxY(_contentLabel.frame)+self.frame.size.height*0.05, self.frame.size.width*0.6, self.frame.size.height*0.2);
    }
    
}

-(void)dealloc {
    [_contentImageView removeObserver:self forKeyPath:@"image"];
}


@end

@implementation StatusSpecialTopicView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _statusSpecialTopicView = [[StatusAuthorView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height*0.5)];
        
        
        _separatorLineView = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_statusSpecialTopicView.frame), frame.size.width-30, 1)];
        
        _summaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_separatorLineView.frame)+frame.size.height*0.07, CGRectGetWidth(_separatorLineView.frame), frame.size.height*0.35)];
        
        [self addSubview:_statusSpecialTopicView];
        [self addSubview:_separatorLineView];
        [self addSubview:_summaryLabel];
        _summaryLabel.numberOfLines = 2;
        _summaryLabel.text = @"一起讨论iOS 开发 kfsfsfdfddddhghfhfghfgffsfsfsdfsdfsfsfsfafjhkkihmbmggd";
        
        _separatorLineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
//        _statusSpecialTopicView.backgroundColor = [UIColor redColor];
        
//        _summaryLabel.backgroundColor = [UIColor yellowColor];
        
    }
    
    return self;
}

@end

@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _cellWidth = size.width;
    _cellHeight = size.height;
    
    return self;
}

-(void)createViewWithHeight:(CGFloat)height {
    _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, height*0.5, height*0.5)];
    
    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMinY(_headerImageView.frame), _cellWidth*0.3, _headerImageView.frame.size.height*0.5)];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMaxY(_userNameLabel.frame), _cellWidth*0.6, _headerImageView.frame.size.height*0.5)];
    
    _targetLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userNameLabel.frame), CGRectGetMinY(_headerImageView.frame), 100, _headerImageView.frame.size.height*0.5)];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_userNameLabel];
    [self.contentView addSubview:_dateLabel];
    [self.contentView addSubview:_targetLabel];
}


-(void)setNotShowOtherViews:(BOOL)notShowOtherViews {
    if (notShowOtherViews) {
        
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, _cellHeight*0.25, _cellHeight*0.5, _cellHeight*0.5)];
        
        _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMinY(_headerImageView.frame), _cellWidth*0.3, _headerImageView.frame.size.height*0.5)];
        
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headerImageView.frame)+10, CGRectGetMaxY(_userNameLabel.frame), _cellWidth*0.6, _headerImageView.frame.size.height*0.5)];
        
        _targetLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userNameLabel.frame), CGRectGetMinY(_headerImageView.frame), 100, _headerImageView.frame.size.height*0.5)];
        
        [self.contentView addSubview:_headerImageView];
        [self.contentView addSubview:_userNameLabel];
        [self.contentView addSubview:_dateLabel];
        [self.contentView addSubview:_targetLabel];
        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        _userNameLabel.text = @"yyyffffqqqq";
        _dateLabel.text = @"06.16 15:22";
        _targetLabel.text = @"加入了简书";
        
//        _headerImageView.backgroundColor = [UIColor grayColor];
//        _userNameLabel.backgroundColor = [UIColor purpleColor];
//        _dateLabel.backgroundColor = [UIColor brownColor];
//        _targetLabel.backgroundColor = [UIColor greenColor];
    }
    
}

-(void)setShowStatusAuthorView:(BOOL)showStatusAuthorView {
    if (showStatusAuthorView) {
        
        [self createViewWithHeight:notShowOtherViewsRowHeight];
        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        _userNameLabel.text = @"yyyffffqqqq";
        _dateLabel.text = @"07.16 10:27";
        _targetLabel.text = @"关注了作者";
        
        _statusAuthorView = [[StatusAuthorView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width*0.05, 60, _cellWidth*0.9, _cellHeight*0.45)];
        [self.contentView addSubview:_statusAuthorView];
        
//        _headerImageView.backgroundColor = [UIColor grayColor];
//        _userNameLabel.backgroundColor = [UIColor purpleColor];
//        _dateLabel.backgroundColor = [UIColor brownColor];
//        _targetLabel.backgroundColor = [UIColor greenColor];
        
        _statusAuthorView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.4];
    }
}

-(void)setShowStatusArticleView:(BOOL)showStatusArticleView {
    if (showStatusArticleView) {
        
        [self createViewWithHeight:notShowOtherViewsRowHeight];
        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        _userNameLabel.text = @"yyyffffqqqq";
        _dateLabel.text = @"07.05 10:57";
        _targetLabel.text = @"喜欢了文章";
        
        _statusArticleView = [[StatusArticleView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width*0.05, CGRectGetMaxY(_headerImageView.frame)+15, _cellWidth*0.9, _cellHeight*0.6)];
        [self.contentView addSubview:_statusArticleView];
        
//        _headerImageView.backgroundColor = [UIColor grayColor];
//        _userNameLabel.backgroundColor = [UIColor purpleColor];
//        _dateLabel.backgroundColor = [UIColor brownColor];
//        _targetLabel.backgroundColor = [UIColor greenColor];
        _statusArticleView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.4];
    }
}

-(void)setShowStatusSpecialTopicView:(BOOL)showStatusSpecialTopicView {
    if (showStatusSpecialTopicView) {
        
        [self createViewWithHeight:notShowOtherViewsRowHeight];

        
        _headerImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        _userNameLabel.text = @"yyyffffqqqq";
        _dateLabel.text = @"07.05 16:57";
        _targetLabel.text = @"关注了专题";
        
        _statusSpecialTopicView = [[StatusSpecialTopicView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width*0.05, CGRectGetMaxY(_headerImageView.frame)+15, _cellWidth*0.9, _cellHeight*0.6)];
        [self.contentView addSubview:_statusSpecialTopicView];
        
//        _headerImageView.backgroundColor = [UIColor grayColor];
//        _userNameLabel.backgroundColor = [UIColor purpleColor];
//        _dateLabel.backgroundColor = [UIColor brownColor];
//        _targetLabel.backgroundColor = [UIColor greenColor];
        _statusSpecialTopicView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.4];
    }
}


@end

@implementation FQPageFirstView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [super renderUI];
        
    }
    
    
    return self;
}


-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        return showStatusAuthorViewRowHeight;
    }
    if (indexPath.row == 3) {
        return showStatusArticleViewRowHeight;
    }
    if (indexPath.row == 14) {
        return notShowOtherViewsRowHeight;
    }
    return showStatusSpecialTopicViewRowHeight;
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
    CGFloat height = showStatusSpecialTopicViewRowHeight;
    if (indexPath.row == 1) {
        height = showStatusAuthorViewRowHeight;
    }
    
    if (indexPath.row == 3) {
        height = showStatusArticleViewRowHeight;
    }
    
    if (indexPath.row == 14) {
        height = notShowOtherViewsRowHeight;
    }
    
    static NSString *reuseIdentifier = @"cellID2";
    //显示数据，暂时不获取；
    FirstTableViewCell *cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier size:CGSizeMake(self.frame.size.width, height)];
    
    if (indexPath.row == 1) {
        cell.showStatusAuthorView = YES;
    } else if (indexPath.row == 3) {
        cell.showStatusArticleView = YES;
        cell.statusArticleView.contentImageView.image = [UIImage imageNamed:@"icon_personal_qq"];
    } else if (indexPath.row == 14) {
        cell.notShowOtherViews = YES;
    } else {
        cell.showStatusSpecialTopicView = YES;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


-(void)dealloc {

}

@end
