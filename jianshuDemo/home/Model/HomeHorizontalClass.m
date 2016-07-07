//
//  HomeHorizontalClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/7.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "HomeHorizontalClass.h"

@implementation HomeHorizontalClass

-(instancetype)initWithDicationary:(NSDictionary*)dic {
    self = [super init];
    
    _titleString = [dic objectForKey:@"titleName"];
    _imageUrl = [dic objectForKey:@"imageUrl"];
    _backgroundImageUrl = [dic objectForKey:@"backgroundImageUrl"];
    
    return self;
}

@end
