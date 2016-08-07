//
//  MineArticleClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineTitleClass : NSObject

//还有一个图片未放在属性里；
@property (copy, nonatomic) NSString *titleName;
@property (copy, nonatomic) NSString *articleCounts;

-(instancetype)initMineTitleWithDictionary: (NSDictionary*)dataDictionary;

@end
