//
//  FQHomeClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FQHomeArticleClass.h"
//#import "FQHomeTableCycleClass.h"
#import "HomeHorizontalClass.h"

@interface FQHomeClass : NSObject

//@property (strong, nonatomic) FQHomeArticleClass *articleObject;
//@property (strong, nonatomic) FQHomeTabelHeaderClass *tableviewObject;
//@property (strong, nonatomic) HomeHorizontalClass *homeHorizontalObject;

@property (strong, nonatomic) NSString *hotArticleImageURL; //热门文章图标；
@property (strong, nonatomic) NSString *hotArticleLabelString; //热门文章标签；

@property (strong, nonatomic) NSString *homePageImageURL;  //首页投稿图标；
@property (strong, nonatomic) NSString *homePageLabelString;  //首页投稿标签；

@property (strong, nonatomic) NSArray<NSString*> *homeCycleImageUrl;

@property (strong, nonatomic) NSArray<NSString*> *horizontaltitleName;
@property (strong, nonatomic) NSArray<NSString*> *horizontalBackgroundImageUrl;
@property (strong, nonatomic) NSArray<NSString*> *horizontalImageUrl;

//@property (strong, nonatomic) NSMutableArray<NSString*> *cycleImageUrlOfTableHeader;
//
//@property (strong, nonatomic) NSMutableArray<NSDictionary*> *HorizontalDicOfTableHeader;

-(instancetype)initWith:(NSDictionary*)dic;

//需要加个获取数据是否成功的参数返回
+(void)requestHomeData:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass*> *homeHorizontalObjects))block ;

+(void)pullRequestData:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass*> *homeHorizontalObjects))block;

+(void)infiniteScrollingRequestDataWithCounts:(NSInteger)count complete:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects))block ;

@end
