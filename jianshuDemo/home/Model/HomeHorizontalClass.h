//
//  HomeHorizontalClass.h
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHorizontalClass : NSObject

@property (strong, nonatomic) NSString *imageUrl;

@property (strong, nonatomic) NSString *titleString;

@property (strong, nonatomic) NSString *backgroundImageUrl;

-(instancetype)initWithDicationary:(NSDictionary*)dic;

@end
