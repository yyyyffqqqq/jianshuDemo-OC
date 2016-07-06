//
//  FQPageScrollView.h
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    isHorizontalScroll = 0,
    isVertical = 1,
} FQPageScrollDirection;

@interface FQPageScrollView : UIScrollView

@property (assign,nonatomic) CGFloat pageCounts;
@property (assign,nonatomic) FQPageScrollDirection scrollDirection ;//

@property (assign,nonatomic) CGFloat pageWidth;
@property (assign,nonatomic) CGFloat pageHeight;

//插入单个子视图
-(void)addCustomSubview:(UIView *)view atIndex:(NSInteger)index;

//同时插入多个子视图
-(void)addCustomSubview:(NSArray<UIView *> *)subViews ;

@end