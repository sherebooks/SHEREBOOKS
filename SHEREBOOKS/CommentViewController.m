//
//  CommentViewController.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "CommentViewController.h"
#import "AddCommentViewController.h"
//
//@interface CommentViewController()
//
//- (void) fetchComments;
//- (void) showReloadAnimationAnimated:(BOOL)animated;
//- (void) reloadTableViewDataSource;
//- (void)dataSourceDidFinishLoadingNewData;
//
//
//@end

//@implementation CommentViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    self.comments = [[NSArray alloc] init];
//    
//    self.clearsSelectionOnViewWillAppear = NO;
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(clickDone:)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(clickWrite:)];
//    
//    refreshHeaderView = [[RefreshTableHeaderView alloc] initWithFrame:
//                         CGRectMake(0.0f, 0.0f - self.view.bounds.size.height,
//                                    320.0f, self.view.bounds.size.height)];
//	[self.tableView addSubview:refreshHeaderView];
//    
//    [self showReloadAnimationAnimated:YES];
//    [self reloadTableViewDataSource];
//    
//}
//
//
//#pragma mark - Table view data source
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.comments count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    static NSString *CellIdentifier = @"Cell";
////    
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    if (cell == nil) {
////        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
////    }
////    
////    NSString* comment = [self.comments objectAtIndex:indexPath.row];
////    cell.textLabel.text = comment;
////    return cell;
//}
//
//#pragma mark -
//#pragma mark private method
//
////- (void) fetchComments
////
////    GDataQueryGooglePhotos *query;
////    NSURL *feedURL = [GDataServiceGooglePhotos photoFeedURLForUserID:self.photo.album.account.userid
////                                                             albumID:self.photo.album.albumid
////                                                           albumName:nil
////                                                             photoID:self.photo.photoid
////                                                                kind:@"comment"
////                                                              access:nil];
////    
////    query = [GDataQueryGooglePhotos photoQueryWithFeedURL:feedURL];
////    
////    GDataServiceTicket *ticket;
////    ticket = [self.googlePhotoService fetchEntryWithURL:[query URL]
////                                               delegate:self
////                                      didFinishSelector:@selector(fetchEntryTicket:finishedWithEntry:error:)];
////    
////}
////
////- (void)fetchEntryTicket:(GDataServiceTicket *)ticket
////       finishedWithEntry:(GDataFeedPhoto *)photoEntry
////                   error:(NSError *)error
////{
////    if (error == nil && [[photoEntry commentCount] intValue] > 0) {
////        
////        NSInteger countOfComment = [[photoEntry commentCount] intValue];
////        NSMutableArray *commentStrings = [[NSMutableArray alloc] initWithCapacity:countOfComment];
////        NSArray *comments = [photoEntry entries];
////        
////        for (GDataEntryPhotoComment *comment in comments)
////        {
////            NSLog(@"comment = %@",[[comment content] stringValue]);
////            [commentStrings addObject:[[comment content] stringValue]];
////        }
////        self.comments = commentStrings;
////        
////       
////        [self.tableView reloadData];
////        
////    } else {
////        NSLog(@"error raised");
////    }
////    
////    [self dataSourceDidFinishLoadingNewData];
////}
//
//#pragma mark -
//#pragma mark event handler
////
////- (void) clickDone:(id)sender
////{
////    [self dismissModalViewControllerAnimated:YES];
////}
////
////- (void) clickWrite:(id)sender
////{
////    AddCommentViewController *viewController = [[AddCommentViewController alloc] initWithNibName:@"AddCommentViewController" bundle:nil];
////    viewController.googlePhotoService = self.googlePhotoService;
////    viewController.photo = self.photo;
////    viewController.delegate = self;
////    
////    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
////    
////    [self presentModalViewController:nav animated:YES];
////}
////
////- (void) addCommentViewControllerDidUpdated:(AddCommentViewController*)commentView
////{
////    [self showReloadAnimationAnimated:YES];
////    [self reloadTableViewDataSource];
////}
//
//
//
//#pragma mark State Changes
//
//- (void) showReloadAnimationAnimated:(BOOL)animated
//{
//	reloading = YES;
//	[refreshHeaderView toggleActivityView:YES];
//    
//	if (animated)
//	{
//		[UIView beginAnimations:nil context:NULL];
//		[UIView setAnimationDuration:0.2];
//		self.tableView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f,
//                                                       0.0f);
//		[UIView commitAnimations];
//	}
//	else
//	{
//		self.tableView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f,
//                                                       0.0f);
//	}
//}
//
//- (void) reloadTableViewDataSource
//{
//	[self fetchComments];
//}
//
//- (void)dataSourceDidFinishLoadingNewData
//{
//	reloading = NO;
//	[refreshHeaderView flipImageAnimated:NO];
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDuration:.3];
//	[self.tableView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
//	[refreshHeaderView setStatus:kPullToReloadStatus];
//	[refreshHeaderView toggleActivityView:NO];
//	[UIView commitAnimations];
//}
//
//#pragma mark Scrolling Overrides
//// Load images for all onscreen rows when scrolling is finished
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    // pull-to-refresh
//    
//    if (reloading) return;
//    
//	if (scrollView.contentOffset.y <= - 65.0f) {
//		if([self.tableView.dataSource respondsToSelector:
//            @selector(reloadTableViewDataSource)]){
//			[self showReloadAnimationAnimated:YES];
//			[self reloadTableViewDataSource];
//		}
//	}
//	checkForRefresh = NO;
//}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//	if (!reloading)
//	{
//		checkForRefresh = YES;  //  only check offset when dragging
//	}
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//	if (reloading) return;
//    
//	if (checkForRefresh) {
//		if (refreshHeaderView.isFlipped
//            && scrollView.contentOffset.y > -65.0f
//            && scrollView.contentOffset.y < 0.0f
//            && !reloading) {
//			[refreshHeaderView flipImageAnimated:YES];
//			[refreshHeaderView setStatus:kPullToReloadStatus];
//            
//		} else if (!refreshHeaderView.isFlipped
//                   && scrollView.contentOffset.y < -65.0f) {
//			[refreshHeaderView flipImageAnimated:YES];
//			[refreshHeaderView setStatus:kReleaseToReloadStatus];
//		}
//	}
//}

