//
//  HomeArticleListTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Masonry.h"
#import "FQHomeArticleClass.h"

@interface HomeArticleListTableViewCell : UITableViewCell

@property CGSize contentSize; //cell大小

//@property (nonatomic, strong) MineTitleClass *mineTitle;
//@property (nonatomic, strong) MineUserInformationClass *mineUserInf;

@property (strong, nonatomic) FQHomeArticleClass *homeArticle;

@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UIImageView *contentImageView;
@property (strong, nonatomic) UIButton *nameBt;
@property (strong, nonatomic) UILabel *publishDateLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UIButton *specialTopicBt;
@property (strong, nonatomic) UILabel *readedCommentLoveLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withFrame:(CGRect)frame;

@end
