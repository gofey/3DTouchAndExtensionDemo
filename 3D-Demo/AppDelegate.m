//
//  AppDelegate.m
//  3D-Demo
//
//  Created by gofeyLee on 2018/5/15.
//  Copyright © 2018年 gofeyLee. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SencondViewController.h"
#import "ChildViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    FirstViewController *first = [[FirstViewController alloc] init];
    [first setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"firstVC" image:[[UIImage imageNamed:@"content_icon_comment1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"content_icon_comment1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    
    
    SencondViewController *sencond = [[SencondViewController alloc] init];
    [sencond setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"sencondVC" image:[[UIImage imageNamed:@"content_icon_comment1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"content_icon_comment1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:sencond];
    
    tab.viewControllers = @[nav1,nav2];
    [tab setSelectedIndex:0];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
    if (shortcutItem) {
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if ([shortcutItem.type isEqualToString:@"com.zz.search"]) {
            //进入搜索界面
            
            [tab setSelectedIndex:1];
            sencond.str = @"新启动APP-- 搜索";
            
            
        } else if ([shortcutItem.type isEqualToString:@"com.zz.location"]) {
            //定位
            NSLog(@"新启动APP-- 定位");
        }else if ([shortcutItem.type isEqualToString:@"com.zz.share"]) {
            //进入分享页面
            NSLog(@"新启动APP-- 分享");
            [tab setSelectedIndex:1];
            sencond.str = @"P-- 分享";
            ChildViewController *child = [[ChildViewController alloc] init];
            child.title = @"3D from second";
            [sencond.navigationController pushViewController:child animated:YES];
            
        }
        
        return NO;
    }
    NSURL *url = (NSURL *)[launchOptions valueForKey:UIApplicationLaunchOptionsURLKey];
    return YES;
}
    
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    
    //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
    if ([shortcutItem.type isEqualToString:@"com.zz.search"]) {
        //进入搜索界面
        UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
        [tab setSelectedIndex:1];
        for (UINavigationController *vc in tab.childViewControllers) {
            if ([vc.topViewController isKindOfClass:[SencondViewController class]]) {
                
                SencondViewController *sencond = (SencondViewController *)vc.topViewController;
                sencond.str = @"新启动APP-- 搜索 -- 2";
                
                return;
            }
        }
        
    } else if ([shortcutItem.type isEqualToString:@"com.zz.location"]) {
        
        NSLog(@"新启动APP-- 定位 -- 2");
    }else if ([shortcutItem.type isEqualToString:@"com.zz.share"]) {
        //进入分享页面
        NSLog(@"新启动APP-- 分享 -- 2");
        UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
        [tab setSelectedIndex:1];
        for (UINavigationController *vc in tab.childViewControllers) {
            if ([vc.topViewController isKindOfClass:[SencondViewController class]]) {
                
                SencondViewController *sencond = (SencondViewController *)vc.topViewController;
                sencond.str = @"- 分享 -- 2";
                ChildViewController *child = [[ChildViewController alloc] init];
                child.title = @"3D from second";
                [sencond.navigationController pushViewController:child animated:YES];
                return;
            }
        }
    }
    
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    if ([[url absoluteString] hasPrefix:@"WidgetUrlScheme"])
    {
        
        NSString *valueStr = [NSString stringWithFormat:@"传值内容:%@",[[url absoluteString] substringFromIndex:18]];
        UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
        [tab setSelectedIndex:1];
        for (UINavigationController *vc in tab.childViewControllers) {
            if ([vc.topViewController isKindOfClass:[SencondViewController class]]) {
                
                SencondViewController *sencond = (SencondViewController *)vc.topViewController;
                sencond.str = valueStr;
//                ChildViewController *child = [[ChildViewController alloc] init];
//                child.title = @"Widget open ";
//                [sencond.navigationController pushViewController:child animated:YES];
            }
        }
    }
     return  YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    //创建快捷选项
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.yang.share" localizedTitle:@"分享" localizedSubtitle:@"分享副标题" icon:icon userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item];
}
@end
