//
//  FQHomeClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQHomeArticleClass.h"

@implementation FQHomeArticleClass

-(instancetype)init {
    self = [super init];
    
    
    
    return self;
}

-(instancetype)initWith:(NSDictionary*)dic {
    self = [super init];
    
    _contentImageUrl = [dic objectForKey:@"contentImageUrl"];
    _headerImageUrl = [dic objectForKey:@"headerImageUrl"];
    _nameString = [dic objectForKey:@"nameString"];
    _publishDateString = [dic objectForKey:@"publishDateString"];
    _contentString = [dic objectForKey:@"contentString"];
    _specialTopicString = [dic objectForKey:@"specialTopicString"];
    _readedCommentLoveString = [dic objectForKey:@"readedCommentLoveString"];
    
    return self;
}

@end
