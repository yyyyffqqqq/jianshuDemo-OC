//
//  UserInformationHeaderView.m
//  jianshuDemo
//
//  Created by quan on 16/7/8.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "UserInformationHeaderView.h"
#import "Masonry.h"
#import "PublicClass.h"

@interface UserInformationHeaderView ()
    
@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, assign) CGFloat editWidth;

@end

@implementation UserInformationHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _viewHeight = frame.size.height;
    
    _nameLabel = [[UILabel alloc]init];
    
    _deatailLabel = [[UILabel alloc]init];
    
    _editBt = [[UIButton alloc]init];
    
    [self addSubview:_nameLabel];
    [self addSubview:_deatailLabel];
    [self addSubview:_editBt];
    
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _deatailLabel.textAlignment = NSTextAlignmentCenter;
    
    [_nameLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_deatailLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_editBt.titleLabel addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [_nameLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_deatailLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_editBt.titleLabel addObserver:self forKeyPath:@"font" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    [self layoutMyView];
    
    return self;
}

//监听代理方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == _nameLabel) {
        [self updateConstraintsOfMyView:_nameLabel];
    } else if (object == _deatailLabel) {
        [self updateConstraintsOfMyView:_deatailLabel];
    } else {
        [self updateConstraintsOfMyView:_editBt];
    }
}

-(void)layoutMyView {
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.superview.mas_top).offset(_viewHeight*0.25);
        make.height.mas_equalTo(_nameLabel.superview.mas_height).multipliedBy(0.2);
        make.width.mas_equalTo(_nameLabel.superview.mas_width).priorityLow();
        make.centerX.mas_equalTo(_nameLabel.superview);
    }];
    
    [_deatailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(_viewHeight*0.08);
        make.height.mas_equalTo(_deatailLabel.superview.mas_height).multipliedBy(0.15);
        make.width.mas_equalTo(_deatailLabel.superview.mas_width).priorityLow();
        make.centerX.mas_equalTo(_deatailLabel.superview);
    }];
    
    [_editBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_deatailLabel.mas_bottom).offset(_viewHeight*0.05);
        make.height.mas_equalTo(_editBt.superview.mas_height).multipliedBy(0.2);
        make.width.mas_equalTo(_editBt.superview.mas_width).priorityLow();
        make.centerX.mas_equalTo(_editBt.superview);
    }];

}

-(void)updateConstraintsOfMyView:(UIView*)view {
    NSString *text;
    CGFloat fontSize ;
    if ([view isKindOfClass: [UILabel class]]) {
        text = ((UILabel*)view).text;
        fontSize = ((UILabel*)view).font.pointSize;
    } else if ([view isKindOfClass: [UIButton class]]) {
        text = ((UIButton*)view).titleLabel.text;
        fontSize = ((UIButton*)view).titleLabel.font.pointSize;
    }
    CGSize sizeOfMax = CGSizeMake(self.frame.size.width, self.frame.size.height*0.2);
    NSDictionary *Dic = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize Size = [PublicClass boolLabelLength:text size:sizeOfMax option: NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:Dic];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(Size.width+20).priorityHigh();
        make.centerX.mas_equalTo(_editBt.superview);
    }];
}

-(void)dealloc {
    [_nameLabel removeObserver:self forKeyPath:@"font"];
    [_deatailLabel removeObserver:self forKeyPath:@"font"];
    [_editBt.titleLabel removeObserver:self forKeyPath:@"font"];
    
    [_nameLabel removeObserver:self forKeyPath:@"text"];
    [_deatailLabel removeObserver:self forKeyPath:@"text"];
    [_editBt.titleLabel removeObserver:self forKeyPath:@"text"];
    
    
}

@end
