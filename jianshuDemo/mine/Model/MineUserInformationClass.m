//
//  MineDataClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "MineUserInformationClass.h"

@implementation MineUserInformationClass

-(instancetype)initWithDictionary: (NSDictionary*)dataDictionary {
    self = [super init];
    
    self.userName = [dataDictionary objectForKey:@"userName"];
    self.headerImageUrl = [dataDictionary objectForKey:@"headerImageUrl"];
    self.userPoint = [dataDictionary objectForKey:@"userPoint"];
    self.userPointValue = [dataDictionary objectForKey:@"userPointValue"];
    
    return self;
}

+ (void)requestMineUserDataWithBlock:(void (^)(NSArray *mineUserDataArrays, NSArray *mineTitleArrays_one_section, NSArray *mineTitleArrays_two_section, NSError *error))block {
    
    //模拟请求得到的数据;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"myName", @"userName", @"http://www.baidu.com", @"headerImageUrl", @"积分:", @"userPoint", @"78", @"userPointValue", nil];
    
    NSDictionary *articleDic_1 = [NSDictionary dictionaryWithObjectsAndKeys:@"公开文章", @"titleName", @"4", @"counts", nil];
    NSDictionary *articleDic_2 = [NSDictionary dictionaryWithObjectsAndKeys:@"私密文章", @"titleName", @"2", @"counts", nil];
    NSDictionary *articleDic_3 = [NSDictionary dictionaryWithObjectsAndKeys:@"收藏的文章", @"titleName", @"5", @"counts", nil];
    NSDictionary *articleDic_4 = [NSDictionary dictionaryWithObjectsAndKeys:@"喜欢的文章", @"titleName", @"4", @"counts", nil];
    NSDictionary *articleDic_5 = [NSDictionary dictionaryWithObjectsAndKeys:@"我的专题", @"titleName", @"5", @"counts", nil];
    NSDictionary *articleDic_6 = [NSDictionary dictionaryWithObjectsAndKeys:@"我的文集", @"titleName", @"4", @"counts", nil];
    NSDictionary *articleDic_7 = [NSDictionary dictionaryWithObjectsAndKeys:@"夜间模式", @"titleName", @"1", @"switch", nil];
    NSDictionary *articleDic_8 = [NSDictionary dictionaryWithObjectsAndKeys:@"浏览记录", @"titleName", nil];
    NSDictionary *articleDic_9 = [NSDictionary dictionaryWithObjectsAndKeys:@"通用设置", @"titleName", nil];
    NSDictionary *articleDic_10 = [NSDictionary dictionaryWithObjectsAndKeys:@"分享简书app", @"titleName", nil];
    NSDictionary *articleDic_11 = [NSDictionary dictionaryWithObjectsAndKeys:@"意见反馈", @"titleName", nil];
    NSDictionary *articleDic_12 = [NSDictionary dictionaryWithObjectsAndKeys:@"给简书评分", @"titleName", nil];
    
//    数据中应该还有一个跳转地址
    
    //初始化模型数据
    NSMutableArray *mineUserDataArrays = [[NSMutableArray alloc]init];
    MineUserInformationClass *mineUserInf = [[MineUserInformationClass alloc] initWithDictionary:dic];
    [mineUserDataArrays addObject:mineUserInf];
    
    NSArray *mineTitleArrays_temp = [[NSArray alloc]initWithObjects:articleDic_1, articleDic_2, articleDic_3, articleDic_4, articleDic_5, articleDic_6, articleDic_7, articleDic_8, articleDic_9, articleDic_10, articleDic_11, articleDic_12, nil];
    
    NSMutableArray *mineTitleArrays_1 = [[NSMutableArray alloc]init];
    NSMutableArray *mineTitleArrays_2 = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<mineTitleArrays_temp.count; i++) {
        if (i<6) { //暂时用序号分uitableview的两个section
            MineTitleClass *mineTitle = [[MineTitleClass alloc] initMineTitleWithDictionary:mineTitleArrays_temp[i]];
            [mineTitleArrays_1 addObject:mineTitle];
        } else {
            MineTitleClass *mineTitle = [[MineTitleClass alloc] initMineTitleWithDictionary:mineTitleArrays_temp[i]];
            [mineTitleArrays_2 addObject:mineTitle];
        }
        
    }
    
    //if请求成功，传递数据给block
    
    block(mineUserDataArrays, mineTitleArrays_1, mineTitleArrays_2, nil);
    
}

@end
