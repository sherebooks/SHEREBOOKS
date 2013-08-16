//
//  LoginViewController.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginAppDelegate.h"

@interface LoginViewController ()

//- ServiceWithId:(NSString*)username password:(NSString*)password;
//- (void)ticket:(GDataServiceTicket *)ticket authenticatedWithError:(NSError *)error;
//- (BOOL)isAlreadyLoginedUser:(NSString*) username;

- (void) onClickCancel:(id)sender;
- (void) onClickLogin:(id)sender;
- (void) enableUserInteraction:(BOOL)flag;

@end
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SHEREBOOKS";
    
    UIBarButtonItem *buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onClickCancel:)];
    UIBarButtonItem *buttonLogin = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleBordered target:self action:@selector(onClickLogin:)];
    
    self.navigationItem.rightBarButtonItem = buttonLogin;
    self.navigationItem.leftBarButtonItem = buttonCancel;
    
    FBLoginView *loginview = [[FBLoginView alloc] init];
    
    loginview.frame = CGRectOffset(loginview.frame, 5, 5);
    loginview.delegate = self;
    
    [self.view addSubview:loginview];
    
    [loginview sizeToFit];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
//}
//
//
//- (IBAction) clickCreateAccount:(id)sender
//{
//    NSURL *urlOfCreatingAccount = [NSURL URLWithString:@"https://www.google.com/accounts/NewAccount"];
//    [[UIApplication sharedApplication] openURL:urlOfCreatingAccount];
//}
//
//- (BOOL)isAlreadyLoginedUser:(NSString*) username
//{
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *ent = [NSEntityDescription entityForName:@"AccountInfo" inManagedObjectContext:self.managedContext];
//    fetchRequest.entity = ent;
//    [fetchRequest setFetchLimit:1];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userid = %@", username];
//    [fetchRequest setPredicate:predicate];
//    
//    
//    NSError *error = nil;
//    NSArray *fetchedItems = [self.managedContext executeFetchRequest:fetchRequest error:&error];
//    
//    [fetchRequest release];
//    return fetchedItems.count != 0;
//}
//
//#pragma mark -
//#pragma mark private method
//
//- (GDataServiceGooglePhotos *)googlePhotosServiceWithId:(NSString*)username password:(NSString*)password
//{
//    
//    static GDataServiceGooglePhotos* service = nil;
//    
//    if (!service) {
//        service = [[GDataServiceGooglePhotos alloc] init];
//        
//        [service setShouldCacheResponseData:YES];
//        [service setServiceShouldFollowNextLinks:YES];
//    }
//    
//    if ([username length] && [password length]) {
//        [service setUserCredentialsWithUsername:username
//                                       password:password];
//    } else {
//        [service setUserCredentialsWithUsername:nil
//                                       password:nil];
//    }
//    
//    return service;
//}
//
//- (void)ticket:(GDataServiceTicket *)ticket authenticatedWithError:(NSError *)error
//{
//    if (error == nil) {
//        
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"AccountInfo" inManagedObjectContext:self.managedContext];
//        AccountInfo *accountInfo = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:self.managedContext];
//        
//        accountInfo.userid = self.username.text;
//        accountInfo.passwd = self.password.text;
//        
//        NSError *err = nil;
//        if (![self.managedContext save:&error])
//        {
//            NSLog(@"Unresolved error %@, %@", err, [error userInfo]);
//        }
//        
//        [self dismissModalViewControllerAnimated:YES];
//    }
//    [self enableUserInteraction:YES];
//    [self.loadingView removeView];
//}
//
//- (void) onClickCancel:(id)sender
//{
//    [self dismissModalViewControllerAnimated:YES];
//}
//
//- (void) onClickLogin:(id)sender
//{
//    if([self.username.text length] == 0) return;
//    if([self.password.text length] == 0) return;
//    
//    if ([self.username.text rangeOfString:@"@"].location == NSNotFound) {
//        self.username.text = [NSString stringWithFormat:@"%@@gmail.com",self.username.text];
//    }
//    
//    if([self isAlreadyLoginedUser:self.username.text])
//    {
//       
//        [self dismissModalViewControllerAnimated:YES];
//        return;
//    }
//    
//    
//    [self.username resignFirstResponder];
//    [self.password resignFirstResponder];
//    
//    self.loadingView = [LoadingView loadingViewInView:self.view];
//    self.loadingView.textLabel.text = @"계정 확인";
//    
//    [self enableUserInteraction:NO];
//    
//    *service = [self ServiceWithId:self.username.text password:self.password.text];
//    
//    [service authenticateWithDelegate:self
//              didAuthenticateSelector:@selector(ticket:authenticatedWithError:)];
//}
//
//- (void) enableUserInteraction:(BOOL)flag
//{
//    self.username.enabled = flag;
//    self.password.enabled = flag;
//    
//    self.navigationItem.leftBarButtonItem.enabled = flag;
//    self.navigationItem.rightBarButtonItem.enabled = flag;
//}
//
#pragma mark - FBLoginViewDelegate

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    }

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    self.labelFirstName.text = [NSString stringWithFormat:@"Hello %@!", user.first_name];
    
    self.profilePic.profileID = user.id;
    self.loggedInUser = user;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    
    FBShareDialogParams *p = [[FBShareDialogParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    
#ifdef DEBUG
    [FBSettings enableBetaFeatures:FBBetaFeaturesShareDialog];
    
#endif
    BOOL canShareFB = [FBDialogs canPresentShareDialogWithParams:p];
    BOOL canShareiOS6 = [FBDialogs canPresentOSIntegratedShareDialogWithSession:nil];
    
    self.profilePic.profileID = nil;
    self.labelFirstName.text = nil;
    self.loggedInUser = nil;
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
    // our policy here is to let the login view handle errors, but to log the results
    NSLog(@"FBLoginView encountered an error=%@", error);
}

#pragma mark -

// Convenience method to perform some action that requires the "publish_actions" permissions.
- (void) performPublishAction:(void (^)(void)) action {
    // we defer request for permission to post to the moment of post, then we check for the permission
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        // if we don't already have the permission, then we request it now
        [FBSession.activeSession requestNewPublishPermissions:@[@"publish_actions"]
                                              defaultAudience:FBSessionDefaultAudienceFriends
                                            completionHandler:^(FBSession *session, NSError *error) {
                                                if (!error) {
                                                    action();
                                                } else if (error.fberrorCategory != FBErrorCategoryUserCancelled){
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Permission denied"
                                                                                                        message:@"Unable to get permission to post"
                                                                                                       delegate:nil
                                                                                              cancelButtonTitle:@"OK"
                                                                                              otherButtonTitles:nil];
                                                    [alertView show];
                                                }
                                            }];
    } else {
        action();
    }
    
}



@end
