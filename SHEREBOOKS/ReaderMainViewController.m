//
//  ReaderMainViewController.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "ReaderMainViewController.h"
#import "ReaderViewController.h"

@interface ReaderMainViewController () <ReaderViewControllerDelegate>

@end

@implementation ReaderMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
        
        self.view.backgroundColor = [UIColor clearColor]; 
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        NSString *name = [infoDictionary objectForKey:@"CFBundleName"];
        
        NSString *version = [infoDictionary objectForKey:@"CFBundleVersion"];
        
        self.title = [NSString stringWithFormat:@"%@ v%@", name, version];
        
        CGSize viewSize = self.view.bounds.size;
        
        CGRect labelRect = CGRectMake(0.0f, 0.0f, 80.0f, 32.0f);
        
        UILabel *tapLabel = [[UILabel alloc] initWithFrame:labelRect];
        
        tapLabel.text = @"Tap";
        tapLabel.textColor = [UIColor whiteColor];
        tapLabel.textAlignment = UITextAlignmentCenter;
        tapLabel.backgroundColor = [UIColor clearColor];
        tapLabel.font = [UIFont systemFontOfSize:24.0f];
        tapLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        tapLabel.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        tapLabel.center = CGPointMake(viewSize.width / 2.0f, viewSize.height / 2.0f);
        
        [self.view addSubview:tapLabel];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        //singleTap.numberOfTouchesRequired = 1; singleTap.numberOfTapsRequired = 1; //singleTap.delegate = self;
        [self.view addGestureRecognizer:singleTap]; 
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIGestureRecognizer methods

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
	NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
    
	NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    
	NSString *filePath = [pdfs lastObject]; assert(filePath != nil); // Path to last PDF file
    
	ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    
	if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
	{
		ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        
		readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
        
		[self.navigationController pushViewController:readerViewController animated:YES];
        
#else // present in a modal view controller
        
		readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
		[self presentModalViewController:readerViewController animated:YES];
        
#endif // DEMO_VIEW_CONTROLLER_PUSH
	}
}

#pragma mark ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
	[self.navigationController popViewControllerAnimated:YES];
    
#else // dismiss the modal view controller
    
	[self dismissModalViewControllerAnimated:YES];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}

@end
