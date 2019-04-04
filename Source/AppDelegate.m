//
//  AppDelegate.m
//  Countdown
//
//  Created by Nathan Ansel on 11/20/18.
//  Copyright © 2018 Nathan Ansel. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	[self.window makeKeyAndVisible];
	self.window.rootViewController = [[CountdownViewController alloc] init];
	return YES;
}
@end
