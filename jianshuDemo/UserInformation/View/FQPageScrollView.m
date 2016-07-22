//
//  FQPageScrollView.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPageScrollView.h"

@implementation FQPageScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _pageWidth = frame.size.width;
    _pageHeight = frame.size.height;
    _scrollDirection = isHorizontalScroll;
    _pageCounts = 1;
    
    self.pagingEnabled = YES;
    self.directionalLockEnabled = YES;
    self.alwaysBounceHorizontal = YES;
    self.contentSize = CGSizeMake(_pageWidth*_pageCounts, 0); //
    
    self.delegate = self;
    
    return self;
}

-(void)setScrollDirection:(FQPageScrollDirection)scrollDirection {
    _scrollDirection = scrollDirection;
    if (_scrollDirection == isHorizontalScroll) {
        self.alwaysBounceHorizontal = YES;
        self.contentSize = CGSizeMake(_pageWidth*_pageCounts, 0); //
    } else {
        self.alwaysBounceVertical = YES;
        self.contentSize = CGSizeMake(0, _pageHeight*_pageCounts); //
    }
}

-(void)setPageCounts:(CGFloat)pageCounts {
    _pageCounts = pageCounts;
    
    if (_scrollDirection == isHorizontalScroll) {
        self.contentSize = CGSizeMake(_pageWidth*_pageCounts, 0); //
    } else {
        self.contentSize = CGSizeMake(0, _pageHeight*_pageCounts); //
    }
}

-(void)setPageHeight:(CGFloat)pageHeight {
    _pageHeight = pageHeight;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _pageWidth, _pageHeight);
    if (_scrollDirection == isHorizontalScroll) {
        self.contentSize = CGSizeMake(_pageWidth*_pageCounts, 0); //
    } else {
        self.contentSize = CGSizeMake(0, _pageHeight*_pageCounts); //
    }
}

-(void)setPageWidth:(CGFloat)pageWidth {
    _pageWidth = pageWidth;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _pageWidth, _pageHeight);
    if (_scrollDirection == isHorizontalScroll) {
        self.contentSize = CGSizeMake(_pageWidth*_pageCounts, 0); //
    } else {
        self.contentSize = CGSizeMake(0, _pageHeight*_pageCounts); //
    }
}

//插入单个子视图
-(void)addCustomSubview:(UIView *)view atIndex:(NSInteger)index{
    if (index<_pageCounts) {
        if (_scrollDirection == isHorizontalScroll) {
            view.frame = CGRectMake(index*_pageWidth, 0, _pageWidth, _pageHeight);
            [self addSubview:view];
        } else {
            view.frame = CGRectMake(0, index*_pageHeight, _pageWidth, _pageHeight);
            [self addSubview:view];
        }
    }
    
}

//同时插入多个子视图
-(void)addCustomSubview:(NSArray<UIView *> *)subViews{
    
    if (subViews.count>_pageCounts) {
        [self setPageCounts:subViews.count];
    }
    for (int i = 0; i < subViews.count; i++) {
        if (_scrollDirection == isHorizontalScroll) {
            subViews[i].frame = CGRectMake(i*_pageWidth, 0, _pageWidth, _pageHeight);
            [self addSubview:subViews[i]];
        } else {
            subViews[i].frame = CGRectMake(0, i*_pageHeight, _pageWidth, _pageHeight);
            [self addSubview:subViews[i]];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%f",(NSInteger)scrollView.contentOffset.x/self.pageWidth);
    if (self.mydelegate && [self.mydelegate respondsToSelector:@selector(scrollViewDidEndDraggingWithIndex:)]) {
        [self.mydelegate scrollViewDidEndDraggingWithIndex:(NSInteger)scrollView.contentOffset.x/self.pageWidth];
    }
}

@end
