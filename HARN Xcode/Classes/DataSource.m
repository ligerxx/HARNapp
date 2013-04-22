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
				@"Ongoing\n\nThis exhibition presents highlights from the museum’s holdings of modern American, European and Latin American art spanning the mid-19th century through the first half of the 20th century.", @"pageText", @"modern-main.png", @"pageImage",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Contemporary Art from the Harn Collection", @"pageName",
				@"September 03, 2012 - August 04, 2013\n\nThis exhibition features seven areas showcasing a remarkable group of international artists who work in multiple mediums from painting and photography to installation and film engaging a wide range of aesthetic and cultural concerns.", @"pageText", @"contemporary-main.png", @"pageImage",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Bird Mothers and Feathered Serpents: Mythical Beings of Oceania and Ancient America", @"pageName",
				@"February 26, 2013 - January 01, 2014\n\nThis exhibition focuses on mythological beings in art from Oceania and Ancient America, using objects from the Harn Museum’s collection. Each object represents a fascinating character–a culture hero, a divinity, or a spirit being.", @"pageText", @"ancientamerican-main.png", @"pageImage",
				nil],
            [NSDictionary dictionaryWithObjectsAndKeys:
                @"All the World's a Frame", @"pageName",
                @"April 05, 2013 - November 10, 2013\n\nExamine photographs from the Harn and other local collections in terms of their formal characteristics, motives, repeated tropes and expectations embedded in their making.", @"pageText", @"worldframe_main.png", @"pageImage",
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
