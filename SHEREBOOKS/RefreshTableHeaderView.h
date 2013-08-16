//
//  RefreshTableHeaderView.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kReleaseToReloadStatus 0
#define kPullToReloadStatus 1
#define kLoadingStatus 2

@interface RefreshTableHeaderView : UIView

{
    
	UILabel *lastUpdatedLabel;
	UILabel *statusLabel;
	UIImageView *arrowImage;
	UIActivityIndicatorView *activityView;
    
	BOOL isFlipped;
    
	NSDate *lastUpdatedDate;
}

@property BOOL isFlipped;

@property (nonatomic, retain) NSDate *lastUpdatedDate;

- (void)flipImageAnimated:(BOOL)animated;
- (void)toggleActivityView:(BOOL)isON;
- (void)setStatus:(int)status;

@end
