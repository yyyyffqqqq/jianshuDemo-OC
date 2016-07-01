//
//  PublicClass.m
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "PublicClass.h"


@implementation PublicClass

//返回字符串占用空间的大小
+(CGSize)boolLabelLength:(NSString*)text size:(CGSize)size option:(NSStringDrawingOptions)options attributes:(NSDictionary*)dic {
    
    return [text boundingRectWithSize:size options:options attributes:dic context:nil].size;
}

@end
