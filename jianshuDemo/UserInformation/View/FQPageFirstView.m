//
//  FQPageFirstView.m
//  jianshuDemo
//
//  Created by quan on 16/7/23.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPageFirstView.h"

@interface FirstTableViewCell : UITableViewCell

/**
 初始化方法
 size - 视图大小
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;

@end

@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    return self;
}

@end

@implementation FQPageFirstView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
    [super renderUI];
    
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 150;
    
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
    if (indexPath.row % 2 == 0) {
        static NSString *reuseIdentifier = @"cellID";
        //显示数据，暂时不获取；
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.textLabel.text = @"hello one";
        cell.imageView.image = [UIImage imageNamed:@"icon_personal_qq"];
        cell.detailTextLabel.text = @"ghggh";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    static NSString *reuseIdentifier = @"cellID2";
    //显示数据，暂时不获取；
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    cell.textLabel.text = @"hello world";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(void)dealloc {

}

@end
