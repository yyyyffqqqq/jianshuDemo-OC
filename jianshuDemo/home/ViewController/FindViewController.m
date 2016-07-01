//
//  FindViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController () <HorizontalScrollViewDelegate>

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"发现");
    self.navigationItem.title = @"发现";
    
    
    NSArray *itemNames = @[@"新上榜", @"日报", @"七日热门", @"三十日热门。。。。", @"市集", @"有奖活动",@"简书出版"];
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", @"button_write", nil];
    
    
    _horizontalScrollView = [[HorizontalScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    _horizontalScrollView.itemTitles = itemNames;
    _horizontalScrollView.images = imageNames;
    _horizontalScrollView.delegate = self;
    [_horizontalScrollView updateData];
    
    _horizontalScrollView.backgroundColor = [UIColor grayColor];
    
    self.tableView.tableHeaderView = _horizontalScrollView;
}

//HorizontalScrollViewDelegate
- (void)selectItemAtIndex:(NSInteger)index {
    NSLog(@"index is %ld", (long)index);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    return 10;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"cellID";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
