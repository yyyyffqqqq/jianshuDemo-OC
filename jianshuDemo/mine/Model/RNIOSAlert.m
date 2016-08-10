//
//  RNIOSAlert.m
//  jianshuDemo
//
//  Created by quan on 16/8/10.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "RNIOSAlert.h"

@implementation RNIOSAlert

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(show:(NSString *)msg){
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView * alertView=[[UIAlertView alloc] initWithTitle:@"react-native" message:msg delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alertView show];
    });
    
}

@end
