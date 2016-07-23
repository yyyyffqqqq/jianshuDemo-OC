//
//  FQPageThirdView.m
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPageThirdView.h"

@interface ThirdTableViewCell : UITableViewCell

/**
 初始化方法
 size - 视图大小
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;

@end

@implementation ThirdTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    return self;
}

@end

@implementation FQPageThirdView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
    [super renderUI];
    
    self.tableView.rowHeight = 100;
    
    return self;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell
    static NSString *reuseIdentifier = @"cellID";
    //显示数据，暂时不获取；
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    return cell;
    
}

@end
