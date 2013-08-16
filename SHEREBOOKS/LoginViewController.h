//
//  LoginViewController.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "LoadingView.h"

@interface LoginViewController : UIViewController{
    
    NSManagedObjectContext *_managedContext;
    UITextField *_username;
    UITextField *_password;
    LoadingView *_loadingView;
    
}


@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *labelFirstName;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;
@property(nonatomic, retain) LoadingView *loadingView;
@property(nonatomic,retain) NSManagedObjectContext *managedContext;
@property(nonatomic,retain) IBOutlet UITextField *username;
@property(nonatomic,retain) IBOutlet UITextField *password;

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error;

@end
