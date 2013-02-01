//
//  AppDelegate.m
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [navController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.navController=[[[UINavigationController alloc]initWithRootViewController:self.viewController]autorelease];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
