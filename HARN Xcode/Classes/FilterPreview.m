//
//  FilterPreview.m
//  HARN
//
//  Created by Casey Feldman on 2/14/13.
//
//

#import "FilterPreview.h"

@implementation FilterPreview

@synthesize name, filter;

-(id) initWithNameAndFilter:(NSString *)theNameOfTheFilter filter:(CIFilter *)theFilter
{
    self = [super init];

    self.name = theNameOfTheFilter;
    if([theNameOfTheFilter isEqualToString:@"Camera"] || [theNameOfTheFilter isEqualToString:@"Original"])
    {
        self.filter = nil;
    }else{
        self.filter = theFilter;  
    }
    return self;
}

@end
