//
//  ArtworkInformation.h
//  HARN
//
//  Created by Casey Feldman on 4/11/13.
//
//

#import <Foundation/Foundation.h>

@interface ArtworkInformation : NSObject

@property (nonatomic) NSString *chosenCollection;

@property (nonatomic, retain) NSString *collectionDescription;
@property (nonatomic, readonly) NSArray *imageThumbnails;
@property (nonatomic, readonly) NSArray *largeImages;
@property (nonatomic, retain) NSArray *titles;
@property (nonatomic, retain) NSArray *smallDescription;
@property (nonatomic, retain) NSArray *extendedDescription;


-(void) generateInfo:(NSString *) collectionPicked;

-(void) setImageThumbnails:(NSArray *)thumbnails;
-(void) setLargeImages:(NSArray *)images;
-(void) setTitles:(NSArray *)newtitles;
-(void) setSmallDescription:(NSArray *)newSmallDescription;
-(void) setExtendedDescription:(NSArray *)newExtendedDescription;

@end
