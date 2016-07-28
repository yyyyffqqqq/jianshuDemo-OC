//
//  FQPageFirstView.h
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQTabItemBaseView.h"

static CGFloat notShowOtherViewsRowHeight = 80;
static CGFloat showStatusAuthorViewRowHeight = 150;
static CGFloat showStatusArticleViewRowHeight = 240;
static CGFloat showStatusSpecialTopicViewRowHeight = 240;
static CGFloat FQPageFirstViewEstimatedRowHeight = 200;

@interface StatusAuthorView : UIButton

@property (strong, nonatomic) UIImageView *headerImageView;

@property (strong, nonatomic) UILabel *authorNameLabel;

@property (strong, nonatomic) UILabel *detailLabel;

@property (strong, nonatomic) UIButton *attentionBt;

@end

@interface StatusArticleView : UIButton

@property (strong, nonatomic) UIImageView *contentImageView;

@property (strong, nonatomic) UILabel *titleTextLabel;

@property (strong, nonatomic) UILabel *contentLabel;

@property (strong, nonatomic) UILabel *authorNameLabel;

@property (strong, nonatomic) UILabel *readedCommentLoveLabel;

@end


@interface StatusSpecialTopicView : UIButton

@property (strong, nonatomic) StatusAuthorView *statusSpecialTopicView;

@property (strong, nonatomic) UIView *separatorLineView;

@property (strong, nonatomic) UILabel *summaryLabel;

@end


@interface FirstTableViewCell : UITableViewCell

@property CGFloat cellWidth;
@property CGFloat cellHeight;

@property (nonatomic) BOOL notShowOtherViews; //不显示statusAuthorView、statusArticleView、statusSpecialTopicView

@property (nonatomic) BOOL showStatusAuthorView; //只显示statusAuthorView

@property (nonatomic) BOOL showStatusArticleView; //只显示statusArticleView

@property (nonatomic) BOOL showStatusSpecialTopicView; //只显示statusSpecialTopicView

@property (strong, nonatomic) UIImageView *headerImageView;

@property (strong, nonatomic) UILabel *userNameLabel;

@property (strong, nonatomic) UILabel *dateLabel;

@property (strong, nonatomic) UILabel *targetLabel;

@property (strong, nonatomic) StatusAuthorView *statusAuthorView;

@property (strong, nonatomic) StatusArticleView *statusArticleView;

@property (strong, nonatomic) StatusSpecialTopicView *statusSpecialTopicView;

@property (strong, nonatomic) NSMutableArray *datas;
/**
 初始化方法
 size - 视图大小
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;

@end


@interface FQPageFirstView : FQTabItemBaseView

@property (strong, nonatomic) NSMutableArray *datas;

@end
