//
//  AppDelegate.m
//  LmMobSDK-Demo
//
//  Created by media on 2018/4/23.
//  Copyright © 2018年 Blueberry. All rights reserved.
//

#import "AppDelegate.h"
#import "LmMobSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     * 测试appkey eac6500c-33a6-4d8d-afa4-def79935f9c1
     * 时光录音本  9302013f-7348-4938-995c-1e27a49ce500
     * 银河掠夺者  6cf187f7-8996-4714-8e3e-6b23773c95be
     */
    // 开发者向SDK方申请获取的key
    NSString * appkey = @"9302013f-7348-4938-995c-1e27a49ce500";//请填写实际获取的appkey
    
    //
    [LmMobSDK initialize:appkey callback:^(BOOL success, NSDictionary * _Nullable result) {

       

    }];
    
    [LmMobSDK setDebugMode:YES];
    
    
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
