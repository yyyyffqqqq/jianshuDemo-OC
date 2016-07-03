//
//  CollectionViewCell.m
//  jianshuDemo
//
//  Created by quan on 16/7/2.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "CollectionCellImageView.h"


@implementation CollectionCellImageView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _imageView = [[UIImageView alloc]init];
    
    _nameLabel = [[UILabel alloc]init];
    
    _nameLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:_imageView];
    [self addSubview:_nameLabel];
        
    return self;
}

@end
