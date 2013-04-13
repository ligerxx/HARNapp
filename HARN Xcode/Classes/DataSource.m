//
//  DataSource.m
//  PagingScrollView
//
//  Created by Matt Gallagher on 24/01/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "DataSource.h"
#import "SynthesizeSingleton.h"

@implementation DataSource

SYNTHESIZE_SINGLETON_FOR_CLASS(DataSource);

//
// init
//
// Init method for the object.
//
- (id)init
{
	self = [super init];
	if (self != nil)
	{
		dataPages = [[NSArray alloc] initWithObjects:
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Highlights from the Modern Collection", @"pageName",
				@"", @"pageText", @"modern-main.png", @"pageImage",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Contemporary Art from the Harn Collection", @"pageName",
				@"", @"pageText", @"contemporary-main.png", @"pageImage",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Bird Mothers and Feathered Serpents: Mythical Beings of Oceania and Ancient America", @"pageName",
				@"", @"pageText", @"ancientamerican-main.png", @"pageImage",
				nil],
			nil];
	}
	return self;
}

- (NSInteger)numDataPages
{
	return [dataPages count];
}

- (NSDictionary *)dataForPage:(NSInteger)pageIndex
{
	return [dataPages objectAtIndex:pageIndex];
}

@end
