//
//  MineViewController.h
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : UITableViewController

@property (strong, nonatomic) NSArray *mintTitleDatas_section_one;
@property (strong, nonatomic) NSArray *mintTitleDatas_section_two;
@property (strong, nonatomic) NSArray *mineUserInfDatas;

@property (strong, nonatomic) NSMutableArray *dataTitles;
@property (strong, nonatomic) NSMutableArray *imageDatas;

@property (strong, nonatomic) NSMutableArray *dataTitles_2;
@property (strong, nonatomic) NSMutableArray *imageDatas_2;

@end
