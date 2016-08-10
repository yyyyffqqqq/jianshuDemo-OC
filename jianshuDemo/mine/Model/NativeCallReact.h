//
//  NativeCallReact.h
//  jianshuDemo
//
//  Created by quan on 16/8/10.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RCTBridgeModule.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@interface NativeCallReact: NSObject <RCTBridgeModule>

+ (NativeCallReact *)shareInstance;

- (void)handleNativeCallReact:(NSNotification *)notification;

@end
