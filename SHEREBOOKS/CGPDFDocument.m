//
//	CGPDFDocument.m
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#import "CGPDFDocument.h"


CGPDFDocumentRef CGPDFDocumentCreateX(CFURLRef theURL, NSString *password)
{
	CGPDFDocumentRef thePDFDocRef = NULL;

	if (theURL != NULL) 
	{
		thePDFDocRef = CGPDFDocumentCreateWithURL(theURL);

		if (thePDFDocRef != NULL)
		{
			if (CGPDFDocumentIsEncrypted(thePDFDocRef) == TRUE)
			{
				if (CGPDFDocumentUnlockWithPassword(thePDFDocRef, "") == FALSE)
				{
					if ((password != nil) && ([password length] > 0)) 
					{
						char text[128]; 

						[password getCString:text maxLength:126 encoding:NSUTF8StringEncoding];

						if (CGPDFDocumentUnlockWithPassword(thePDFDocRef, text) == FALSE) 
						{
							#ifdef DEBUG
								NSLog(@"CGPDFDocumentCreateX: Unable to unlock [%@] with [%@]", theURL, password);
							#endif
						}
					}
				}

				if (CGPDFDocumentIsUnlocked(thePDFDocRef) == FALSE) 
				{
					CGPDFDocumentRelease(thePDFDocRef), thePDFDocRef = NULL;
				}
			}
		}
	}
	else 
	{
		#ifdef DEBUG
			NSLog(@"CGPDFDocumentCreateX: theURL == NULL");
		#endif
	}

	return thePDFDocRef;
}


BOOL CGPDFDocumentNeedsPassword(CFURLRef theURL, NSString *password)
{
	BOOL needPassword = NO; // Default flag

	if (theURL != NULL) // Check for non-NULL CFURLRef
	{
		CGPDFDocumentRef thePDFDocRef = CGPDFDocumentCreateWithURL(theURL);

		if (thePDFDocRef != NULL) // Check for non-NULL CGPDFDocumentRef
		{
			if (CGPDFDocumentIsEncrypted(thePDFDocRef) == TRUE) // Encrypted
			{
				// Try a blank password first, per Apple's Quartz PDF example

				if (CGPDFDocumentUnlockWithPassword(thePDFDocRef, "") == FALSE)
				{
					// Nope, now let's try the provided password to unlock the PDF

					if ((password != nil) && ([password length] > 0)) // Not blank?
					{
						char text[128]; 

						[password getCString:text maxLength:126 encoding:NSUTF8StringEncoding];

						if (CGPDFDocumentUnlockWithPassword(thePDFDocRef, text) == FALSE)
						{
							needPassword = YES;
						}
					}
					else
					{
						needPassword = YES;
					}
				}
			}

			CGPDFDocumentRelease(thePDFDocRef);
		}
	}
	else 
	{
		#ifdef DEBUG
			NSLog(@"CGPDFDocumentNeedsPassword: theURL == NULL");
		#endif
	}

	return needPassword;
}


