//
//  ReactNativeView.m
//  jianshuDemo
//
//  Created by quan on 16/8/8.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "ReactNativeView.h"
#import <RCTRootView.h>

@implementation ReactNativeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSString * strUrl = @"http://localhost:8081/index.ios.bundle?platform=ios&dev=true";
        NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
        
        RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                             moduleName:@"SimpleApp"
                                                      initialProperties:nil
                                                          launchOptions:nil];
        
        [self addSubview:rootView];
        
        rootView.frame = self.bounds;
    }
    return self;
}

@end
