//
//  FQPageFirstView.h
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQTabItemBaseView.h"

typedef enum : NSUInteger {
    TimeLineCellStyleNotShowOtherViews, //不显示statusAuthorView、statusArticleView、statusSpecialTopicView
    TimeLineCellStyleShowStatusAuthorView, //只显示statusAuthorView
    TimeLineCellStyleShowStatusArticleView, //只显示statusArticleView
    TimeLineCellStyleshowStatusSpecialTopicView, //只显示statusSpecialTopicView
    
} TimeLineCellStyle;

@interface StatusAuthorView : UIButton

@property (strong, nonatomic) UIImageView *headerImageView;

@property (strong, nonatomic) UILabel *authorNameLabel;

@property (strong, nonatomic) UILabel *detailLabel;

@property (strong, nonatomic) UIButton *attentionBt;

@property CGFloat attentionBtWidth;

@end

@interface StatusArticleView : UIButton

@property (strong, nonatomic) UIImageView *contentImageView;

@property (strong, nonatomic) UILabel *titleTextLabel;

@property (strong, nonatomic) UILabel *contentLabel;

@property (strong, nonatomic) UILabel *authorNameLabel;

@property (strong, nonatomic) UILabel *readedCommentLoveLabel;

@property (nonatomic) BOOL hasContentImage;

@end


@interface StatusSpecialTopicView : UIButton

@property (strong, nonatomic) StatusAuthorView *statusSpecialTopicView;

@property (strong, nonatomic) UIView *separatorLineView;

@property (strong, nonatomic) UILabel *summaryLabel;

@end


@interface FirstTableViewCell : UITableViewCell


@property (strong, nonatomic) UIImageView *headerImageView;

@property (strong, nonatomic) UILabel *userNameLabel;

@property (strong, nonatomic) UILabel *dateLabel;

@property (strong, nonatomic) UILabel *targetLabel;

@property (strong, nonatomic) StatusAuthorView *statusAuthorView;

@property (strong, nonatomic) StatusArticleView *statusArticleView;

@property (strong, nonatomic) StatusSpecialTopicView *statusSpecialTopicView;

@property (nonatomic) BOOL statusArticleViewHasContentImage;

@property (strong, nonatomic) NSMutableArray *datas;
/**
 *初始化方法
 *timeLineCellStyle - 视图类型
 *hasContentImage -  视图类型为TimeLineCellStyleShowStatusArticleView时是否有缩略图，根据该值做相应布局约束
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
             timeLineCellStyle:(TimeLineCellStyle)timeLineCellStyle
             hasContentImage:(BOOL)hasContentImage;


@end


@interface FQPageFirstView : FQTabItemBaseView

@property (strong, nonatomic) NSMutableArray *datas;

@end
