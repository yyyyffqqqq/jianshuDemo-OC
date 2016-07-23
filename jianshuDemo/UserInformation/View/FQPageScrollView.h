//
//  FQPageScrollView.h
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FQPageScrollViewDelegate <NSObject>

-(void)scrollViewDidEndDraggingWithIndex:(NSInteger)index;

@end

typedef enum : NSInteger {
    isHorizontalScroll = 0,
    isVertical = 1,
} FQPageScrollDirection;

@interface FQPageScrollView : UIScrollView<UIScrollViewDelegate>

@property (assign,nonatomic) CGFloat pageCounts;
@property (assign,nonatomic) FQPageScrollDirection scrollDirection ;//

@property (assign,nonatomic) CGFloat pageWidth;
@property (assign,nonatomic) CGFloat pageHeight;

@property (assign,nonatomic) CGFloat currentSelectedIndex;

@property (strong, nonatomic) NSMutableArray<UIView*> *subViews;

@property (weak, nonatomic) id<FQPageScrollViewDelegate> mydelegate;

//插入单个子视图
-(void)addCustomSubview:(UIView *)view atIndex:(NSInteger)index;

//同时插入多个子视图
-(void)addCustomSubviews:(NSArray<UIView *> *)subViews ;


@end
