//
//  AppDelegate.m
//  RSPagesinTabs
//
//  Created by shen on 15/8/9.
//  Copyright (c) 2015年 shen. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate.h"
#import "THSegmentedPager.h"
#import "SamplePagedViewController.h"
#import "GGTabBarController.h"
#import "TestViewController1.h"
#import "TestViewController2.h"
#import "TestViewController3.h"
#import "TestViewController4.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    //创建GGTabbar
    GGTabBarController *tabBar = [[GGTabBarController alloc] init];
    
    //创建第一个Tab：pager 内部的pages
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:[NSBundle mainBundle]];
    THSegmentedPager *pager = [storyboard instantiateViewControllerWithIdentifier:@"THSegmentedPager"];
    NSMutableArray *pages = [NSMutableArray new];
    for (int i = 1; i < 4; i++) {
        // Create a new view controller and pass suitable data.
        SamplePagedViewController *pagedViewController = [pager.storyboard instantiateViewControllerWithIdentifier:@"SamplePagedViewController"];
        [pagedViewController setViewTitle:[NSString stringWithFormat:@"Page %d",i]];
        [pagedViewController.view setBackgroundColor:[UIColor clearColor]];
        [pages addObject:pagedViewController];
    }
    [pager setPages:pages];
    
    //创建第二个Tab：pager2 内部的pages
    THSegmentedPager *pager2 = [storyboard instantiateViewControllerWithIdentifier:@"THSegmentedPager"];
    NSMutableArray *pages2 = [NSMutableArray new];
    for (int i = 1; i < 4; i++) {
        // Create a new view controller and pass suitable data.
        SamplePagedViewController *pagedViewController = [pager.storyboard instantiateViewControllerWithIdentifier:@"SamplePagedViewController"];
        [pagedViewController setViewTitle:[NSString stringWithFormat:@"Page %d",i]];
        [pagedViewController.view setBackgroundColor:[UIColor clearColor]];
        [pages2 addObject:pagedViewController];
    }
    [pager2 setPages:pages2];
    
    //创建其他Tab内的ViewController，并部分带navi
    TestViewController1 *vc1 = [[TestViewController1 alloc] init];
    TestViewController2 *vc2 = [[TestViewController2 alloc] init];
    TestViewController3 *vc3 = [[TestViewController3 alloc] init];
    TestViewController4 *vc4 = [[TestViewController4 alloc] init];
    UINavigationController *navi2=[[UINavigationController alloc]initWithRootViewController:pager2];
    UINavigationController *navi3=[[UINavigationController alloc]initWithRootViewController:vc3];
    UINavigationController *navi4=[[UINavigationController alloc]initWithRootViewController:vc4];
    //配置title，设置icon
    pager2.title=@"VC2";
    vc3.title=@"VC3";
    vc4.title=@"VC4";
    pager.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                     image:[UIImage imageNamed:@"user_normal"]
                                             selectedImage:[UIImage imageNamed:@"user_pressed"]];
    pager2.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                      image:[UIImage imageNamed:@"global_normal"]
                                              selectedImage:[UIImage imageNamed:@"global_pressed"]];
    
    //组建tabbar
    tabBar.viewControllers = @[pager, navi2, navi3, navi4];
    self.window.rootViewController = tabBar;
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
