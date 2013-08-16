//
//  ReaderConstants.h
//  SHEREBOOKS
//
//  Created by MUSE on 13. 8. 16..
//  Copyright (c) 2013년 MUSE. All rights reserved.
//

#if !__has_feature(objc_arc)
	#error ARC (-fobjc-arc) is required to build this code.
#endif

#import <Foundation/Foundation.h>

#define READER_BOOKMARKS TRUE
#define READER_ENABLE_THUMBS TRUE
#define READER_ENABLE_PREVIEW TRUE
#define READER_DISABLE_RETINA FALSE
#define READER_DISABLE_IDLE FALSE
#define READER_SHOW_SHADOWS TRUE
#define READER_STANDALONE FALSE

extern NSString *const kReaderCopyrightNotice;
