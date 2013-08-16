//
//  LoadingView.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "LoadingView.h"
#import <QuartzCore/QuartzCore.h>


CGPathRef NewPathWithRoundRect(CGRect rect, CGFloat cornerRadius)
{
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL,
					  rect.origin.x,
					  rect.origin.y + rect.size.height - cornerRadius);
	
	CGPathAddArcToPoint(path, NULL,
						rect.origin.x,
						rect.origin.y,
						rect.origin.x + rect.size.width,
						rect.origin.y,
						cornerRadius);
	
	CGPathAddArcToPoint(path, NULL,
						rect.origin.x + rect.size.width,
						rect.origin.y,
						rect.origin.x + rect.size.width,
						rect.origin.y + rect.size.height,
						cornerRadius);
	
	CGPathAddArcToPoint(path, NULL,
						rect.origin.x + rect.size.width,
						rect.origin.y + rect.size.height,
						rect.origin.x,
						rect.origin.y + rect.size.height,
						cornerRadius);
	
	CGPathAddArcToPoint(path, NULL,
						rect.origin.x,
						rect.origin.y + rect.size.height,
						rect.origin.x,
						rect.origin.y,
						cornerRadius);
	
	CGPathCloseSubpath(path);
	
	return path;
}


CGPathRef NewPathWithRect(CGRect rect)
{

	CGMutablePathRef path = CGPathCreateMutable();
	
	CGPathMoveToPoint (path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
	
	CGPathAddLineToPoint (path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect));
	
	CGPathAddLineToPoint (path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
	
	CGPathAddLineToPoint (path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect));
	
	CGPathCloseSubpath (path);
	
	return path;
}

@implementation LoadingView


+ (CGFloat) defaultStrokeOpacity
{
	return 0.65;
}

+ (CGFloat) defaultBackgroundOpacity
{
	return 0.9;
}

+ (CGFloat) defaultBoxLength
{
	return 150.0;
}

+ (UIColor*) defaultStrokeColor
{
	return [UIColor whiteColor];
}

+ (NSString*) defaultLabelText
{
	return  NSLocalizedString(@"Loading…", nil);
}

+ (id)loadingViewInView:(UIView *)aSuperview strokeOpacity:(CGFloat)strokeOpacity backgroundOpacity:(CGFloat)backgroundOpacity
			strokeColor:(UIColor*)strokeColor fullScreen:(BOOL)fullScreen labelText:(NSString*)labelText
		bounceAnimation:(BOOL)bounceAnimation boxLength:(CGFloat)boxLength
{
	LoadingView *loadingView = [[LoadingView alloc] initWithFrame:[aSuperview bounds]];
	if (!loadingView)
	{
		return nil;
	}
	
	loadingView.boxLength = boxLength;
	loadingView.strokeOpacity = strokeOpacity;
	loadingView.backgroundOpacity = backgroundOpacity;
	loadingView.strokeColor = strokeColor;
	loadingView.fullScreen = fullScreen;
	loadingView.bounceAnimation = bounceAnimation;
	
	loadingView.opaque = NO;
	loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[aSuperview addSubview:loadingView];
	
	const CGFloat DEFAULT_LABEL_WIDTH = 280.0;
	const CGFloat DEFAULT_LABEL_HEIGHT = 50.0;
	CGRect labelFrame = CGRectMake(0, 0, DEFAULT_LABEL_WIDTH, DEFAULT_LABEL_HEIGHT);
	loadingView.textLabel = [[UILabel alloc] initWithFrame:labelFrame];
	loadingView.textLabel.text = labelText;
	loadingView.textLabel.textColor = strokeColor;
	loadingView.textLabel.backgroundColor = [UIColor clearColor];
	loadingView.textLabel.textAlignment = UITextAlignmentCenter;
	loadingView.textLabel.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
	loadingView.textLabel.autoresizingMask =
	UIViewAutoresizingFlexibleLeftMargin |
	UIViewAutoresizingFlexibleRightMargin |
	UIViewAutoresizingFlexibleTopMargin |
	UIViewAutoresizingFlexibleBottomMargin;
	
	[loadingView addSubview:loadingView.textLabel];
	UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[loadingView addSubview:activityIndicatorView];
	activityIndicatorView.autoresizingMask =
	UIViewAutoresizingFlexibleLeftMargin |
	UIViewAutoresizingFlexibleRightMargin |
	UIViewAutoresizingFlexibleTopMargin |
	UIViewAutoresizingFlexibleBottomMargin;
	[activityIndicatorView startAnimating];
	
	CGFloat totalHeight = loadingView.textLabel.frame.size.height + activityIndicatorView.frame.size.height;
	labelFrame.origin.x = floor(0.5 * (loadingView.frame.size.width - DEFAULT_LABEL_WIDTH));
	labelFrame.origin.y = floor(0.5 * (loadingView.frame.size.height - totalHeight));
	loadingView.textLabel.frame = labelFrame;
	
	CGRect activityIndicatorRect = activityIndicatorView.frame;
	activityIndicatorRect.origin.x = 0.5 * (loadingView.frame.size.width - activityIndicatorRect.size.width);
	activityIndicatorRect.origin.y = loadingView.textLabel.frame.origin.y + loadingView.textLabel.frame.size.height;
	activityIndicatorView.frame = activityIndicatorRect;
	
	
	if (!loadingView.bounceAnimation)
	{
		CATransition *animation = [CATransition animation];
		[animation setType:kCATransitionFade];
		[[aSuperview layer] addAnimation:animation forKey:@"layerAnimation"];
	}
	else
	{
		CALayer *viewLayer = [loadingView layer];
		CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
		
		animation.duration = 0.5;
		animation.values = [NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0.6],
							[NSNumber numberWithFloat:.7],
							[NSNumber numberWithFloat:1.1],
							[NSNumber numberWithFloat:.9],
							[NSNumber numberWithFloat:1],
							nil];
		
		animation.keyTimes = [NSArray arrayWithObjects:
							  [NSNumber numberWithFloat:0.0],
							  [NSNumber numberWithFloat:0.4],
							  [NSNumber numberWithFloat:0.5],
							  [NSNumber numberWithFloat:0.7],
							  [NSNumber numberWithFloat:1.0],
							  nil];
		
		[viewLayer addAnimation:animation forKey:@"transform.scale"];
	}
	
	loadingView.timestamp = [NSDate date];
	return loadingView;
}

+ (id)loadingViewInView:(UIView *)aSuperview
{
	return [self loadingViewInView:aSuperview
					 strokeOpacity:[LoadingView defaultStrokeOpacity]
				 backgroundOpacity:[LoadingView defaultBackgroundOpacity]
					   strokeColor:[LoadingView defaultStrokeColor] fullScreen:NO
						 labelText:[LoadingView defaultLabelText] bounceAnimation:NO
						 boxLength:[LoadingView defaultBoxLength]];
}


- (void)removeView
{
	if (!self.bounceAnimation)
	{
		UIView *aSuperview = [self superview];
		[super removeFromSuperview];
		
		// Set up the animation
		CATransition *animation = [CATransition animation];
		[animation setType:kCATransitionFade];
		
		[[aSuperview layer] addAnimation:animation forKey:@"layerAnimation"];
	}
	else
	{
		CALayer *viewLayer = [self layer];
		CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
		
		animation.duration = 0.5;
		animation.values = [NSArray arrayWithObjects:
							[NSNumber numberWithFloat:1],
							[NSNumber numberWithFloat:.7],
							[NSNumber numberWithFloat:.5],
							[NSNumber numberWithFloat:.3],
							[NSNumber numberWithFloat:.1],
							[NSNumber numberWithFloat:0],
							nil];
		animation.keyTimes = [NSArray arrayWithObjects:
							  [NSNumber numberWithFloat:0.0],
							  [NSNumber numberWithFloat:0.4],
							  [NSNumber numberWithFloat:0.5],
							  [NSNumber numberWithFloat:0.7],
							  [NSNumber numberWithFloat:0.8],
							  [NSNumber numberWithFloat:1.0],
							  nil];
		
		[viewLayer addAnimation:animation forKey:@"transform.scale"];
	}
	
	[super performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.2];
}

- (void)drawRect:(CGRect)rect
{
	if (fullScreen) {
		CGPathRef roundRectPath = NewPathWithRect(rect);
		
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGContextSetRGBFillColor(context, 0, 0, 0, backgroundOpacity);
		CGContextAddPath(context, roundRectPath);
		CGContextFillPath(context);
		
		CGContextSetRGBStrokeColor(context, 1, 1, 1, strokeOpacity);
		CGContextAddPath(context, roundRectPath);
		CGContextStrokePath(context);
		
		CGPathRelease(roundRectPath);
		
	} else {
		
		const CGFloat RECT_PADDING = 8.0;
		rect = CGRectInset(rect, RECT_PADDING, RECT_PADDING);
		
		const CGFloat ROUND_RECT_CORNER_RADIUS = 5.0;
		
		rect.size.width = self.boxLength;
		rect.size.height = self.boxLength;
		rect.origin.x = (0.5 * self.frame.size.width) - (rect.size.width / 2);
		rect.origin.y = (0.5 * self.frame.size.height) - (rect.size.height / 2);
		
		CGPathRef roundRectPath = NewPathWithRoundRect(rect, ROUND_RECT_CORNER_RADIUS);
		CGContextRef context = UIGraphicsGetCurrentContext();
		
		CGContextSetRGBFillColor(context, 0, 0, 0, backgroundOpacity);
		CGContextAddPath(context, roundRectPath);
		CGContextFillPath(context);
		
		CGContextSetRGBStrokeColor(context, 1, 1, 1, strokeOpacity);
		CGContextAddPath(context, roundRectPath);
		CGContextStrokePath(context);
		
		CGPathRelease(roundRectPath);
	}
}

- (void)dealloc
{
	self.timestamp = nil;
	self.strokeColor = nil;
	self.textLabel = nil;
}

@end
