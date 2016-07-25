//
//  YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView.h
//  jianshuDemo
//
//  Created by quan on 16/7/25.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView.h"

@implementation YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
