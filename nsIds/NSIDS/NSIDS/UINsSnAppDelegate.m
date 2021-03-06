//
//  UINsSnAppDelegate.m
//  NSIDS
//
//  Created by adelskott on 26/08/13.
//  Copyright (c) 2013 Adelskott. All rights reserved.
//

#import "UINsSnAppDelegate.h"
#import "UIMasterApplication.h"

#import "UINsSnViewController.h"

@implementation UINsSnAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.viewController = [[UINsSnViewController alloc] initWithNibName:@"UINsSnViewController_iPhone" bundle:nil];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [[UIMasterApplication getInstance] askForRegisterApns:^(BOOL ok) {
	}];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	[[UIMasterApplication getInstance] registerToken:[deviceToken description]];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
	[[UIMasterApplication getInstance] registerToken:nil];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[UIMasterApplication getInstance] setDataPushCallback:userInfo];
	return;
}

@end
