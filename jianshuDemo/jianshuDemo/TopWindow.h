//
//  TopWindow.h
//  jianshuDemo
//
//  Created by quan on 16/8/3.
//  Copyright © 2016年 quan. All rights reserved.
//

/*
 *用于在一个控制器中有多个uitableview、uiscrollview同时显示时，点击状态栏时，uitableview没有滚动到顶部的问题；
 *
 */

#import <Foundation/Foundation.h>

@interface TopWindow : NSObject

+ (void)scrollViewScrollToTop;

@end
