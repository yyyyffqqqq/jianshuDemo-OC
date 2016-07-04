//
//  MineArticleClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MineTitleClass.h"

@implementation MineTitleClass

-(instancetype)initMineTitleWithDictionary: (NSDictionary*)dataDictionary {
    self = [super init];
    
    self.titleName = [dataDictionary objectForKey:@"titleName"];
    
    self.articleCounts = [dataDictionary objectForKey:@"counts"];
    
    return self;
}

@end
