//
//  HomeTableViewCell.h
//  jianshuDemo
//
//  Created by quan on 16/8/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JianShuTableViewCell.h"
#import "FQHomeArticleClass.h"

@interface HomeTableViewCell : JianShuTableViewCell

@property (strong, nonatomic) FQHomeArticleClass *homeArticle;

@end
