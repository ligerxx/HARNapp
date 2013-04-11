//
//  ArtworkInformation.m
//  HARN
//
//  Created by Casey Feldman on 4/11/13.
//
//

#import "ArtworkInformation.h"

@implementation ArtworkInformation

@synthesize imageThumbnails, largeImages, titles, extendedDescription, smallDescription, chosenCollection;

-(void) generateInfo:(NSString *) collectionPicked
{
   if(collectionPicked != nil)
   {
       chosenCollection = collectionPicked;
   }else{
       return;
   }
   
    if([chosenCollection isEqualToString:@"African"])
    {

    }else if([chosenCollection isEqualToString:@"Asian"] )
    {
        [self setImageThumbnails:@[[UIImage imageNamed:@"Seated Bodhisattva-tb.jpg"], [UIImage imageNamed:@"Vajravarahi.jpg"]]];
        [self setLargeImages:@[[UIImage imageNamed:@"Seated Bodhisattva.jpg"], [UIImage imageNamed:@"Vajravarahi.jpg"]]];
        [self setTitles:@[@"Seated Bodhisattva", @"Vajravarahi"]];
        [self setSmallDescription:@[@"Korea, Joseon Dynasty (1392-1910), 17th century",
                                    @"Tibet, 13th Century"
         ]];
        [self setExtendedDescription:@[@"Dimensions: 25 1/2 x 17 1/4 x 13 1/2 in. (64.8 x 43.8 x 34.3 cm) Sutra Pages: 11 5/8 x 7 3/8 in. (29.5 x 18.7 cm) Sutra Pages: 16 3/4 x 12 1/8 in. (42.5 x 30.8 cm)\nMedium: wood with gilt, plus original sutra pages found within body cavity of sculpture\nCredit Line: Museum Purchase, Gift of Michael and Donna Singer\nMade/manufactured: Asia, Korea\nDescription: Gilt wood seated Bodhisattva accompanied by original sutra pages printed in red and black inks of the Lotus Sutra. Red ink sutra is written in Siddham language",
         @"Dimensions: 13 1/8 x 7 1/4 x 2 1/2 in. (33.3 x 18.4 x 6.4 cm)\n                            Medium: Bronze with gemstones and polychrome\nCredit Line: Museum purchase, gift of Michael and Donna Singer\nMade/manufactured: Tibet\nDescription: Dancing female figure holding a skull-capped staff"
         ]];
        
    }else if([chosenCollection isEqualToString:@"Contemporary"])
    {
        
    }else if([chosenCollection isEqualToString:@"Modern"])
    {
        
    }else if([chosenCollection isEqualToString:@"Ancient American"])
    {
        
    }else if([chosenCollection isEqualToString:@"Oceanic"])
    {
        
    }else if([chosenCollection isEqualToString:@"Photography"])
    {
        
    }else if([chosenCollection isEqualToString:@"Prints and Drawings Bef..."])
    {
        
    }else
    {
        NSLog(@"BIG ERROR");
        return;
    }
}

-(void) setImageThumbnails:(NSArray *)thumbnails
{
    imageThumbnails = thumbnails;
    return;
}

-(void) setLargeImages:(NSArray *)images
{
    largeImages = images;
    return;
}

-(void) setTitles:(NSArray *)newtitles
{
    titles = newtitles;
    return;
}

-(void) setSmallDescription:(NSArray *)newSmallDescription
{
    smallDescription = newSmallDescription;
    return;
}

-(void) setExtendedDescription:(NSArray *)newExtendedDescription
{
    extendedDescription = newExtendedDescription;
    return;
}

@end
