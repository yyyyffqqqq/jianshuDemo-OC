//
//  FQPopViewController.m
//  jianshuDemo
//
//  Created by quan on 16/7/6.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "FQPopViewController.h"
#import "ArticleContentViewController.h"

@interface FQPopViewController ()

@end

@implementation FQPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.view.backgroundColor = [UIColor grayColor];
    
    UIView * popView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height /2.0)];
    
    popView.backgroundColor = [UIColor grayColor];
    
    //加个阴影
    popView.layer.shadowColor = [UIColor blackColor].CGColor;
    popView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    popView.layer.shadowOpacity = 0.8;
    popView.layer.shadowRadius = 5;
    
    //导航栏一定要加载ROOTVC上面
    ArticleContentViewController * root = [[ArticleContentViewController alloc]init];
    root.title = @"Pop";
    
    //关闭btn
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(15, 0, 50, 40);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [popView addSubview:closeBtn];
    
    //开启btn
    UIButton * openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    openBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 300, 100, 40);
    [openBtn setTitle:@"开启" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    //组件也要加在rootVC上面
    [root.view addSubview:openBtn];
    
    
    
    [self createPopVCWithRootVC:root andPopView:popView];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController && self.navigationController.navigationBar.superview == _rootVC.view) {
        [self.navigationController.view addSubview:self.navigationController.navigationBar];
    }
    
}



- (void)createPopVCWithRootVC:(UIViewController *)rootVC andPopView:(UIView *)popView
{
    _rootVC = rootVC;
    _popView = popView;
    [self createUI];
}

- (void)createUI
{
    
    if (self.navigationController) {
        self.navigationController.navigationBar.translucent = YES;
        [_rootVC.view addSubview:self.navigationController.navigationBar];
    }
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _rootVC.view.frame = self.view.bounds;
    _rootVC.view.backgroundColor = [UIColor whiteColor];
    _rootview = _rootVC.view;
    
    [self addChildViewController:_rootVC];
    [self.view addSubview:_rootview];
    
    //rootVC上的maskView
    _maskView = ({
        UIButton * maskView = [[UIButton alloc]initWithFrame:self.view.bounds];
        maskView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        maskView.alpha = 0;
        maskView;
    });
    [_rootview addSubview:_maskView];
}

- (void)close
{
    
    
    
    CGRect frame = _popView.frame;
    frame.origin.y += _popView.frame.size.height;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        //maskView隐藏
        [_maskView setAlpha:0.f];
        //popView下降
        _popView.frame = frame;
        
        //同时进行 感觉更丝滑
        [_rootview.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //变为初始值
            [_rootview.layer setTransform:CATransform3DIdentity];
            
            
        } completion:^(BOOL finished) {
            if (self.navigationController) {
                [self.navigationController.view addSubview:self.navigationController.navigationBar];
            }
            //移除
            [_popView removeFromSuperview];
        }];
        
    }];
    
    
    
}

- (void)show
{
    if (self.navigationController) {
        self.navigationController.navigationBar.translucent = YES;
        [_rootVC.view addSubview:self.navigationController.navigationBar];
        [_rootVC.view bringSubviewToFront:_maskView];
    }
    
    [[UIApplication sharedApplication].windows[0] addSubview:_popView];
    
    CGRect frame = _popView.frame;
    frame.origin.y = self.view.bounds.size.height - _popView.frame.size.height;
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [_rootview.layer setTransform:[self firstTransform]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [_rootview.layer setTransform:[self secondTransform]];
            //显示maskView
            [_maskView setAlpha:0.5f];
            //popView上升
            _popView.frame = frame;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}

- (CATransform3D)firstTransform{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (CATransform3D)secondTransform{
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
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
