//
//  FQHomeClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQHomeClass.h"

@implementation FQHomeClass

-(instancetype)init {
    self = [super init];
    
    return self;
}

-(instancetype)initWith:(NSDictionary*)dic {
    self = [super init];
    
    _homeCycleImageUrl = [dic objectForKey:@"homeCycleImageUrl"];
    _homePageLabelString = [dic objectForKey:@"homePageLabelString"];
    _homePageImageURL = [dic objectForKey:@"homePageImageURL"];
    _hotArticleImageURL = [dic objectForKey:@"hotArticleImageURL"];
    _hotArticleLabelString = [dic objectForKey:@"hotArticleLabelString"];
    
    return self;
}

+(void)requestHomeData:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass*> *homeHorizontalObjects))block  {
    
    NSMutableArray  *horizontalObjects = [[NSMutableArray alloc]init];
    NSMutableArray  *articleObjects = [[NSMutableArray alloc]init];
    
    
    //模拟请求得到的数据
    //cycleImageOBJ
    NSArray *cyleImageURL = @[@"h1.jpg", @"h2.jpg", @"h3.jpg"];
    NSDictionary *homeObjectsDic = [NSDictionary dictionaryWithObjectsAndKeys:cyleImageURL,@"homeCycleImageUrl", @"首页投稿",@"homePageLabelString", @"button_submit_green",@"homePageImageURL", @"",@"hotArticleImageURL", @"热门文章",@"hotArticleLabelString", nil];
    FQHomeClass *homeObject = [[FQHomeClass alloc]initWith:homeObjectsDic];
    
    //articleObjects
    NSDictionary *articleObjectDic = [NSDictionary dictionaryWithObjectsAndKeys:@"http://www.valuewalk.com/wp-content/uploads/2016/06/Apple-against-iOS-Jailbreaking.jpg", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"name", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
    NSDictionary *articleObjectDic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"http://www.wuxianedu.com/uploads/allimg/160612/1-1606121433490-L.jpg", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"name", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
//    NSArray *articleObjectArray = [NSMutableArray arrayWithObjects: count:30];
//    for (int i = 0; i< articleObjectArray.count; i++) {
    for (int i = 0; i< 10; i++) {
        if (i % 2 == 0) {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic];
            [articleObjects addObject:homeHoritzontalObj];
        } else {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic2];
            [articleObjects addObject:homeHoritzontalObj];
        }
        
    }
    
    //horizontal
    NSDictionary *horizontalDic_1 = [NSDictionary dictionaryWithObjectsAndKeys:@"新上榜", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_2 = [NSDictionary dictionaryWithObjectsAndKeys:@"日报", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_3 = [NSDictionary dictionaryWithObjectsAndKeys:@"七日热门", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_4 = [NSDictionary dictionaryWithObjectsAndKeys:@"三十日热门", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_5 = [NSDictionary dictionaryWithObjectsAndKeys:@"市集", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_6 = [NSDictionary dictionaryWithObjectsAndKeys:@"有奖活动", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_7 = [NSDictionary dictionaryWithObjectsAndKeys:@"简书出版", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    
    NSArray *horizontalArray = [NSArray arrayWithObjects:horizontalDic_1, horizontalDic_2, horizontalDic_3, horizontalDic_4, horizontalDic_5, horizontalDic_6, horizontalDic_7, nil];
    
    for (int i = 0; i < horizontalArray.count; i++) {
        HomeHorizontalClass *homeHoritzontalObj = [[HomeHorizontalClass alloc]initWithDicationary:horizontalArray[i]];
        [horizontalObjects addObject:homeHoritzontalObj];
    }
    
    block(articleObjects, homeObject, horizontalObjects);
    
}

+(void)pullRequestData:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects, FQHomeClass *homeObjects, NSMutableArray<HomeHorizontalClass*> *homeHorizontalObjects))block {
    NSMutableArray  *horizontalObjects = [[NSMutableArray alloc]init];
    NSMutableArray  *articleObjects = [[NSMutableArray alloc]init];
    
    
    //模拟请求得到的数据
    //cycleImageOBJ
    NSArray *cyleImageURL = @[@"h1.jpg", @"h2.jpg", @"h3.jpg"];
    NSDictionary *homeObjectsDic = [NSDictionary dictionaryWithObjectsAndKeys:cyleImageURL,@"homeCycleImageUrl", @"首页投稿",@"homePageLabelString", @"button_submit_green",@"homePageImageURL", @"",@"hotArticleImageURL", @"热门文章",@"hotArticleLabelString", nil];
    FQHomeClass *homeObject = [[FQHomeClass alloc]initWith:homeObjectsDic];
    
    //articleObjects
    NSDictionary *articleObjectDic = [NSDictionary dictionaryWithObjectsAndKeys:@"http://cms.csdnimg.cn/article/201304/08/516270e774a16.jpg", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"namejhjgjgfgdfdfsfdsfdfdfdffsfdfsfs", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
    NSDictionary *articleObjectDic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"http://www.wuxianedu.com/uploads/allimg/160629/1F02CA7-0.jpg", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"name", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
    //    NSArray *articleObjectArray = [NSMutableArray arrayWithObjects: count:30];
    //    for (int i = 0; i< articleObjectArray.count; i++) {
    for (int i = 0; i< 10; i++) {
        if (i % 2 == 0) {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic];
            [articleObjects addObject:homeHoritzontalObj];
        } else {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic2];
            [articleObjects addObject:homeHoritzontalObj];
        }
        
    }
    
    //horizontal
    NSDictionary *horizontalDic_1 = [NSDictionary dictionaryWithObjectsAndKeys:@"新上榜", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_2 = [NSDictionary dictionaryWithObjectsAndKeys:@"日报", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_3 = [NSDictionary dictionaryWithObjectsAndKeys:@"七日热门", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_4 = [NSDictionary dictionaryWithObjectsAndKeys:@"三十日热门", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_5 = [NSDictionary dictionaryWithObjectsAndKeys:@"市集", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_6 = [NSDictionary dictionaryWithObjectsAndKeys:@"有奖活动", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    NSDictionary *horizontalDic_7 = [NSDictionary dictionaryWithObjectsAndKeys:@"简书出版", @"titleName", @"button_write", @"imageUrl", @"h1", @"backgroundImageUrl",nil];
    
    NSArray *horizontalArray = [NSArray arrayWithObjects:horizontalDic_1, horizontalDic_2, horizontalDic_3, horizontalDic_4, horizontalDic_5, horizontalDic_6, horizontalDic_7, nil];
    
    for (int i = 0; i < horizontalArray.count; i++) {
        HomeHorizontalClass *homeHoritzontalObj = [[HomeHorizontalClass alloc]initWithDicationary:horizontalArray[i]];
        [horizontalObjects addObject:homeHoritzontalObj];
    }
    
    block(articleObjects, homeObject, horizontalObjects);
}

#pragma mark - counts是从第几页请求数据的；该方法请求从第二页开始的数据
+(void)infiniteScrollingRequestDataWithCounts:(NSInteger)count complete:(void (^)(NSMutableArray<FQHomeArticleClass*> *articleObjects))block {
    NSMutableArray  *articleObjects = [[NSMutableArray alloc]init];
    
    //articleObjects
    NSDictionary *articleObjectDic = [NSDictionary dictionaryWithObjectsAndKeys:@"https://images-goldenfrog.netdna-ssl.com/vyprvpn/mac/banner_mac.png", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"name", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
    NSDictionary *articleObjectDic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"http://image.tianjimedia.com/uploadImages/2012/191/514YO71B9C70.jpg", @"contentImageUrl", @"icon_personal_qq", @"headerImageUrl", @"name", @"nameString", @"2016.07.07", @"publishDateString", @"kllfdsadaddfdfdfsfdsfsdsaddfdfdfsargfd", @"contentString", @"ios Developer", @"specialTopicString", @"阅读 621 • 评论 12 • 喜欢 66", @"readedCommentLoveString", nil];
    
    for (int i = 0; i< 10; i++) {
        if (i % 2 == 0) {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic];
            [articleObjects addObject:homeHoritzontalObj];
        } else {
            FQHomeArticleClass *homeHoritzontalObj = [[FQHomeArticleClass alloc]initWith:articleObjectDic2];
            [articleObjects addObject:homeHoritzontalObj];
        }
        
    }
    
    block(articleObjects);
}

@end
