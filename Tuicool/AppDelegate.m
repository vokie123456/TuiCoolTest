//
//  AppDelegate.m
//  Tuicool
//
//  Created by zwenqiang on 15/10/27.
//  Copyright © 2015年 zwenqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "ArticleViewController.h"
#import "SiteViewController.h"
#import "ThemeViewController.h"
#import "SettingsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    //去掉返回按钮上的字
    [barItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                    forBarMetrics:UIBarMetricsDefault];
    //把按钮设置为白色
    barItem.tintColor = [UIColor whiteColor];
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置导航栏标题颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //设置导航栏背景色
    [navBar setBarTintColor:DefaultColor];
    navBar.tintColor = [UIColor whiteColor];//设置导航栏返回按钮颜色
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //添加tab导航
    UITabBarController *myTabBarViewController = [[UITabBarController alloc] init];
    //创建4个tab
    ArticleViewController *articleViewController = [[ArticleViewController alloc] init];
    UIImage *articleImage = [UIImage imageNamed:@"Home"];
    articleViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"文章" image:articleImage tag:0];
    
    //在TabBarController中使用UINavgationController
    SiteViewController *siteViewController = [[SiteViewController alloc] init];
    UIImage *siteImage = [UIImage imageNamed:@"University"];
    siteViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"站点" image:siteImage tag:1];
    UINavigationController *siteRoot = [[UINavigationController alloc] initWithRootViewController:siteViewController];
    
    ThemeViewController *themeViewController = [[ThemeViewController alloc] init];
    UIImage *theme = [UIImage imageNamed:@"Idea"];
    themeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主题" image:theme tag:2];
    UINavigationController *themeRoot = [[UINavigationController alloc] initWithRootViewController:themeViewController];
    
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    UIImage *userImage = [UIImage imageNamed:@"User"];
    settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:userImage tag:3];
    UINavigationController *settingRoot = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:articleViewController, siteRoot, themeRoot, settingRoot, nil];
    myTabBarViewController.viewControllers = controllers;
    [self.window setRootViewController:myTabBarViewController];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
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
