//
//  FirstViewController.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 13..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIImage *selectedImage0 = [UIImage imageNamed:@"Menu-BookshelfSB.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"Menu-BookshelfB.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"Menu-TimelineSB.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"Menu-TimelineB.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"Menu-ProfileSB.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"Menu-profileB.png"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"Menu-SearchSB.png"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"Menu-SearchB.png"];
    
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
