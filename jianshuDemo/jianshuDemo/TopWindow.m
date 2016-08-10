//
//  TopWindow.m
//  jianshuDemo
//
//  Created by quan on 16/8/3.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "TopWindow.h"

#import <UIKit/UIKit.h>

@implementation TopWindow

+ (void)scrollViewScrollToTop {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [self searchScrollViewInView:window];
}

+ (BOOL)isShowingOnKeyWindow:(UIView *)view {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGRect newFrame = [keyWindow convertRect:view.frame fromView:view.superview];
    CGRect winBounds = keyWindow.bounds;
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    return !view.isHidden && view.alpha > 0.01 && view.window == keyWindow && intersects;
}

+ (void)searchScrollViewInView:(UIView *)supView {
    for (UIScrollView *subView in supView.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]] && [self isShowingOnKeyWindow:supView]) {
            CGPoint offset = subView.contentOffset;
            offset.y = -subView.contentInset.top;
            [subView setContentOffset:offset animated:YES];
        }
        
        [self searchScrollViewInView:subView];
    }
}

@end



