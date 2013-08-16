//
//  LoadingView.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

{
	NSTimeInterval minDuration;
	NSDate* timestamp;
	CGFloat boxLength;
	CGFloat backgroundOpacity;
	CGFloat strokeOpacity;
	UIColor* strokeColor;
	BOOL fullScreen;
	UILabel* textLabel;
	BOOL bounceAnimation;
}

@property (nonatomic, assign) CGFloat boxLength;
@property (nonatomic, assign) CGFloat backgroundOpacity;
@property (nonatomic, assign) CGFloat strokeOpacity;
@property (nonatomic, retain) UIColor* strokeColor;
@property (nonatomic, assign) NSTimeInterval minDuration;
@property (nonatomic, retain) NSDate* timestamp;
@property (nonatomic, assign) BOOL fullScreen;
@property (nonatomic, retain) UILabel* textLabel;
@property (nonatomic, assign) BOOL bounceAnimation;

+ (id)loadingViewInView:(UIView *)aSuperview;
+ (id)loadingViewInView:(UIView *)aSuperview strokeOpacity:(CGFloat)strokeOpacity backgroundOpacity:(CGFloat)backgroundOpacity
			strokeColor:(UIColor*)strokeColor fullScreen:(BOOL)fullScreen labelText:(NSString*)labelText
		bounceAnimation:(BOOL)bounceAnimation
			  boxLength:(CGFloat)length;

+ (CGFloat) defaultStrokeOpacity;
+ (CGFloat) defaultBackgroundOpacity;
+ (UIColor*) defaultStrokeColor;
+ (NSString*) defaultLabelText;
+ (CGFloat) defaultBoxLength;

- (void)removeView;

@end
