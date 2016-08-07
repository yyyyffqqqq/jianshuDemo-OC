//
//  MineDataClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/5.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MineTitleClass.h"

@interface MineUserInformationClass : NSObject

//还有一个图片未放在属性里；
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *headerImageUrl;
@property (copy, nonatomic) NSString *userPoint;
@property (copy, nonatomic) NSString *userPointValue;

-(instancetype)initWithDictionary: (NSDictionary*)dataDictionary;

+ (void)requestMineUserDataWithBlock:(void (^)(NSArray *mineUserInformarionArrays, NSArray *mineTitleArrays_one_section, NSArray *mineTitleArrays_two_section, NSError *error))block;

@end
