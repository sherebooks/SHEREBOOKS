//
//  ReaderBookDelegate.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "ReaderBookDelegate.h"
#import "ReaderMainViewController.h"

@interface ReaderBookDelegate () <UIPageViewControllerDelegate>

@end

@implementation ReaderBookDelegate

{
	UIWindow *mainWindow; // Main App Window
	ReaderMainViewController *readerViewController;

}

#pragma mark UIApplicationDelegate methods

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	mainWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]; 
    
	mainWindow.backgroundColor = [UIColor scrollViewTexturedBackgroundColor]; 
    
	NSString *phrase = nil; 
    
	NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    
	NSString *filePath = [pdfs lastObject]; assert(filePath != nil); 
    
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    
	if (document != nil) // Must have a valid ReaderDocument object in order to proceed
	{
		readerViewController = [[ReaderMainViewController alloc] initWithReaderDocument:document];
        
		readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        
		mainWindow.rootViewController = readerViewController; 
	}
    
	[mainWindow makeKeyAndVisible];
    
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of
	// temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application
	// and it begins the transition to the background state. Use this method to pause ongoing tasks, disable timers,
	// and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough
	// application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of transition from the background to the inactive state: here you can undo many
	// of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive.
	// If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate.
	// See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	// Free up as much memory as possible by purging cached data objects that can be recreated
	// (or reloaded from disk) later.
}

#pragma mark ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderMainViewController *)viewController
{
    
}

@end

