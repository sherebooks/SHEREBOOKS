//
//  LoginAppDelegate.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "LoginAppDelegate.h"
#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation LoginAppDelegate

@synthesize window = _window;
@synthesize rootViewController = _rootViewController;

- (BOOL)application:(UIApplication *)application

            openURL:(NSURL *)url

  sourceApplication:(NSString *)sourceApplication

         annotation:(id)annotation {
    
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                    fallbackHandler:^(FBAppCall *call) {
                        NSLog(@"In fallback handler");
                    }];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [FBSession.activeSession close];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.window.rootViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iPhone" bundle:nil];
    } else {
        self.window.rootViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iPad" bundle:nil];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application	{
    
    [FBAppEvents activateApp];
    [FBAppCall handleDidBecomeActive];
}

@end
