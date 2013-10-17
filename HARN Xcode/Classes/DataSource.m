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
             @"Cosmopolitan: Envisioning Global Communities", @"pageName",
                      @"August 27, 2013 - July 27, 2014\n\nThis exhibition highlights multiple ways of fostering community through art by linking radically different expressions of contemporary art & culture in novel ways. Artists from around the world work at the intersection of ethics and aesthetics affirming notions of individual difference & communal coexistence.", @"pageText", @"cosmo-main.png", @"pageImage",
                      nil],
            [NSDictionary dictionaryWithObjectsAndKeys:
				@"Highlights from the Asian Collection", @"pageName",
				@"Ongoing\n\nThe Cofrin Asian Art Wing contains four main galleries and two focus galleries with more than 680 works showcasing the Harn Museum’s collections in Chinese, Indian, Japanese, Korean, and South and Southeast Asian art.", @"pageText", @"asian-main.png", @"pageImage",
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
