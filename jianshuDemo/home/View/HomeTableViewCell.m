//
//  HomeTableViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/8/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier jianShuCellStyle:(JianShuCellStyle)JianShuCellStyle {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier jianShuCellStyle:JianShuCellStyle];
    if (self) {
        
    }
    return self;
}

- (void)setHomeArticle:(FQHomeArticleClass *)homeArticle {
    self.headerImageView.image = [UIImage imageNamed:homeArticle.headerImageUrl];
    [self.nameBt setTitle:homeArticle.nameString forState:UIControlStateNormal];
    self.publishDateLabel.text = homeArticle.publishDateString;
    self.contentLabel.text = homeArticle.contentString;
    [self.specialTopicBt setTitle:homeArticle.specialTopicString forState:UIControlStateNormal];
    self.readedCommentLoveLabel.text = homeArticle.readedCommentLoveString;
    
}

@end
