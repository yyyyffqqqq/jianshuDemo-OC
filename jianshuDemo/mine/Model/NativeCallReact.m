//
//  NativeCallReact.m
//  jianshuDemo
//
//  Created by quan on 16/8/10.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "NativeCallReact.h"

@implementation NativeCallReact

@synthesize bridge = _bridge;

static NativeCallReact *nativeCallReact = nil;

RCT_EXPORT_MODULE()

+ (id)allocWithZone:(struct _NSZone *)zone
{
    if (nativeCallReact == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            nativeCallReact = [super allocWithZone:zone];
        });
    }
    return nativeCallReact;
}

- (id)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nativeCallReact = [super init];
    });
    return nativeCallReact;
}

+(instancetype)sharedInstance
{
    return [[self alloc] init];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return nativeCallReact;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return nativeCallReact;
}

+ (NativeCallReact *)shareInstance {
    static NativeCallReact *nativeCallReact = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nativeCallReact = [[NativeCallReact alloc] init];
    });
    return nativeCallReact;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

//+ (id)allocWithZone:(NSZone *)zone {
//    static NativeCallReact *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [super allocWithZone:zone];
//    });
//    return sharedInstance;
//}

-(NSArray<NSString *> *)supportedEvents {
    return @[@"EventReminder"];
}

- (void)handleNativeCallReact:(NSNotification *)notification
{
    NSString *eventName = notification.userInfo[@"name"];
    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder"
                                                 body:@{@"name": eventName}];
}


@end
