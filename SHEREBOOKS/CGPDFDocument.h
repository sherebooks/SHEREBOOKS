//
//	CGPDFDocument.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

CGPDFDocumentRef CGPDFDocumentCreateX(CFURLRef theURL, NSString *password);

BOOL CGPDFDocumentNeedsPassword(CFURLRef theURL, NSString *password);
