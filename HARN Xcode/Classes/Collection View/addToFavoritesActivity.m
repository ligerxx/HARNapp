//
//  addToFavoritesActivity.m
//  HARN
//
//  Created by Casey Feldman on 3/1/13.
//
//

#import "addToFavoritesActivity.h"

@implementation addToFavoritesActivity

#pragma mark - Hierarchy
#pragma mark UIActivity
- (NSString *)activityTitle {
    
    return NSLocalizedString(@"Add to Favorites", @"");
}

- (UIImage *)activityImage {
    
    UIImage *activityImage =
    UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ?
    [UIImage imageNamed:@"favorites-activity"] :
    [UIImage imageNamed:@"favorites-activity"]; //change this last one for iPad
    
    return activityImage;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    return YES;
}

#pragma mark addToFavorites
- (UIViewController *)performWithActivityItems:(NSArray *)activityItems {
    
    NSOperationQueue *backgroundQueue =
    [[NSOperationQueue alloc] init];
    
    //FIGURE OUT HOW TO SAVE INFO HERE
    [backgroundQueue addOperationWithBlock:^{
        
        NSLog(@"This work has been added to your favorites!", nil);
        
        sleep(3);
        
        NSLog(@"JK idk how to do that...I just sleeped for a few cycles. Somebody make me work!", nil);
        
        [self activityDidFinish:YES];
    }];
    
    return nil;
}

@end
