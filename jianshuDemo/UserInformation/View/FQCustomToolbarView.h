//
//  FQCustomToolbarView.h
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQCustomToolbarView : UIView

@property (assign, nonatomic) CGFloat tapAtIndex;

@property (strong, nonatomic) void (^responseTapEvent)(int index);

-(instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray<NSString*>*)titles andImages:(NSArray<UIImage*>*)images;

@end
