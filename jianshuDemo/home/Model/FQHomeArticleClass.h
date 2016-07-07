//
//  FQHomeClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQHomeArticleClass : NSObject

@property (strong, nonatomic) NSString *contentImageUrl;
@property (strong, nonatomic) NSString *headerImageUrl;

@property (strong, nonatomic) NSString *nameString;
@property (strong, nonatomic) NSString *publishDateString;
@property (strong, nonatomic) NSString *contentString;
@property (strong, nonatomic) NSString *specialTopicString;
@property (strong, nonatomic) NSString *readedCommentLoveString;

-(instancetype)initWith:(NSDictionary*)dic;

@end
