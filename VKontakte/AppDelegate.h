//
//  AppDelegate.h
//  VKontakte
//
//  Created by svp on 26.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
