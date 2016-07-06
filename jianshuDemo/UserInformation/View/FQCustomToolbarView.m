//
//  FQCustomToolbarView.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQCustomToolbarView.h"

@interface FQCustomToolbarView ()

@property CGFloat itemCounts;
@property CGFloat itemsWidth;
@property CGFloat itemsHeight;



@property (strong, nonatomic) NSMutableArray<NSString*> *titles;

@property (strong, nonatomic) NSMutableArray<UILabel*> *itemBts;

@property (strong, nonatomic) NSMutableArray<UIImageView*> *imageViews;

@property (strong, nonatomic) UIView *bottomView;

@end

@implementation FQCustomToolbarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray<NSString*>*)titles andImages:(NSArray<UIImage*>*)images {
    self = [super initWithFrame:frame];
    
    _itemCounts = titles.count;
    
    _titles = [[NSMutableArray alloc]initWithArray:titles];
    
    _tapAtIndex = _itemCounts-1;
    
    [self createBtsWithCounts:_itemCounts andImages:images];
    
    
    return self;
}

//建议不超过四个
-(void)createBtsWithCounts:(CGFloat)counts andImages:(NSArray<UIImage*>*)images{
    
    _itemsWidth = self.frame.size.width / counts;
    
    _itemBts = [[NSMutableArray alloc]init];
    
    if (images.count != counts) {
        _bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, _itemsWidth*0.5, 1)];
        _bottomView.backgroundColor = [UIColor brownColor];
        
        for (int i = 0; i<counts; i++) {
            _itemsHeight = self.frame.size.height*0.5;
            CGFloat itemsY = self.frame.size.height*0.25;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*_itemsWidth, itemsY, _itemsWidth, _itemsHeight)];
            label.text = _titles[i];
            label.textColor = [UIColor brownColor];
            label.textAlignment = NSTextAlignmentCenter;
            [_itemBts addObject:label];
            
            [self addSubview:label];
            
            if (i==counts-1) {
                _bottomView.center = CGPointMake(label.center.x, _bottomView.center.y);
            }
        }
        
        [self addSubview:_bottomView];
    } else {
        _imageViews = [[NSMutableArray alloc]init];
        for (int i = 0; i<counts; i++) {
            _itemsHeight = self.frame.size.height*0.25;
            CGFloat btItemsY = self.frame.size.height*0.25;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*_itemsWidth, btItemsY, _itemsWidth, _itemsHeight)];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = _titles[i];
            [_itemBts addObject:label];
            
            [self addSubview:label];
            
            UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake((i+0.5)*_itemsWidth-_itemsHeight*0.5, label.frame.origin.y+_itemsHeight, _itemsHeight, _itemsHeight)];
            imageview.image  = images[i];
            [_imageViews addObject:imageview];
            [self addSubview:imageview];
        }
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint originalLocation = [touch locationInView:self];
    int tapindex = ((int)originalLocation.x) / _itemsWidth;
    if (tapindex ==_itemCounts) {
        tapindex = _itemCounts-1;
    }
    UILabel *view = (UILabel*)_itemBts[tapindex];
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.center = CGPointMake(view.center.x, _bottomView.center.y);
    } completion:^(BOOL finished) {
        _tapAtIndex = tapindex;
        _tapAtIndex = 1;
    }];
    if (self.responseTapEvent) {
        self.responseTapEvent(tapindex);
    }
    
}

-(void)setTapAtIndex:(CGFloat)tapAtIndex {
    UILabel *view = (UILabel*)_itemBts[(int)tapAtIndex];
    _bottomView.center = CGPointMake(view.center.x, _bottomView.center.y);
}

@end
