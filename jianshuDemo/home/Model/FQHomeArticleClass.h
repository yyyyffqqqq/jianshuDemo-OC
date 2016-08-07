//
//  FQHomeClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQHomeArticleClass : NSObject

@property (copy, nonatomic) NSString *contentImageUrl;
@property (copy, nonatomic) NSString *headerImageUrl;

@property (copy, nonatomic) NSString *nameString;
@property (copy, nonatomic) NSString *publishDateString;
@property (copy, nonatomic) NSString *contentString;
@property (copy, nonatomic) NSString *specialTopicString;
@property (copy, nonatomic) NSString *readedCommentLoveString;

-(instancetype)initWith:(NSDictionary*)dic;

@end
