//
//  FilterPreview.h
//  HARN
//
//  Created by Casey Feldman on 2/14/13.
//
//

#import <Foundation/Foundation.h>

@interface FilterPreview : NSObject
{
    
}
-(id) initWithNameAndFilter:(NSString *) theNameOfTheFilter filter:(CIFilter *) theFilter;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) CIFilter *filter;

@end
