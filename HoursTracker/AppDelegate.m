//
//  AppDelegate.m
//  HoursTracker
//
//  Created by Nagendra on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "JobsViewController.h"
#import "EntriesViewController.h"
#import "ExportViewController.h"
#import "PayPeriodsViewController.h"
@implementation AppDelegate

@synthesize window = _window;
@synthesize array1,index;
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tab=[[UITabBarController alloc]init];
    [[UITabBar appearance] setTintColor:[UIColor purpleColor]];
    JobsViewController *job=[[JobsViewController alloc]initWithNibName:@"JobsViewController" bundle:nil];
    job.title=@"Jobs";
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:job];
    
    
    EntriesViewController *entry=[[EntriesViewController alloc]initWithNibName:@"EntriesViewController" bundle:nil];
    entry.title=@"Entries";
    PayPeriodsViewController *pay=[[PayPeriodsViewController alloc]initWithNibName:@"PayPeriodsViewController" bundle:nil];
    pay.title=@"PayPeriods";
    ExportViewController *export=[[ExportViewController alloc]initWithNibName:@"ExportViewController" bundle:nil];
    export.title=@"Export";
    array1=[[NSMutableArray alloc]init];
    
    NSArray *array=[NSArray arrayWithObjects:nav,entry,pay,export, nil];
    
    [tab setViewControllers:array];
    
    [self.window addSubview:tab.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
