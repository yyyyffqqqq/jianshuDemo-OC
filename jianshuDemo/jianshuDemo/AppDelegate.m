//
//  AppDelegate.m
//  jianshuDemo
//
//  Created by quan on 16/7/1.
//  Copyright © 2016年 quan. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabbarController.h"

#import "FindViewController.h"
#import "AttensionViewController.h"
#import "MeViewController.h"
#import "NotificationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //1.创建标签控制器
    MyTabbarController *tab = [[MyTabbarController alloc]init];
    
    //2.创建相应的子控制器（viewcontroller）
    FindViewController *firstVC = [[FindViewController alloc]init];
    firstVC.tabBarItem.title = @"发现";
    firstVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_home_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstVC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *firstNC = [[UINavigationController alloc]initWithRootViewController:firstVC];
    
    
    AttensionViewController *secondVC = [[AttensionViewController alloc]initWithStyle:UITableViewStyleGrouped];
    //设置标签名称
    secondVC.tabBarItem.title = @"关注";
    //可以根据需求设置标签的的图标
    secondVC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_subscription"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_subscription_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:secondVC];
    
    NotificationViewController *threeVC = [[NotificationViewController alloc]initWithStyle:UITableViewStylePlain];
    //设置标签名称
    threeVC.tabBarItem.title = @"消息";
    //可以根据需求设置标签的的图标
    threeVC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_notification"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_notification_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *threeNC = [[UINavigationController alloc]initWithRootViewController:threeVC];
    
    MeViewController *fourVC = [[MeViewController alloc]initWithStyle:UITableViewStylePlain];
    //设置标签名称
    fourVC.tabBarItem.title = @"我的";
    //可以根据需求设置标签的的图标
    fourVC.tabBarItem.image = [[UIImage imageNamed:@"icon_tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_me_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *fourNC = [[UINavigationController alloc]initWithRootViewController:fourVC];
    
    
    //3.添加到控制器
    //特别注意：管理一组的控制器(最多显示五个,多余五个的话,包括第五个全部在更多模块里面,并且可以通过拖拽方式进行顺序编辑);
    NSArray *array = @[firstNC, secondNC, threeNC, fourNC];
    tab.viewControllers = array;
    
    //这里加载第一个页面；
//    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:tab];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tab;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
