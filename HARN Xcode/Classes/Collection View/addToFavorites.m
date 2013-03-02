//
//  addToFavorites.m
//  HARN
//
//  Created by Casey Feldman on 3/1/13.
//
//

#import "addToFavorites.h"

@interface addToFavorites ()

@property (copy, nonatomic) NSArray *activityItems;
@property (strong, nonatomic) UIViewController *viewController;

@property (assign, nonatomic, getter = isSilent) BOOL silent;

@end

@implementation addToFavorites

#pragma mark - Hierarchy
#pragma mark - UIActivity

-(NSString *) activityType {
    
    NSString *bundleIdentifier =
    [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *activityClassName =
    [[self class] description];
    
    NSString *activityType =
    [NSString stringWithFormat:@"%@.%@",
     bundleIdentifier,
     activityClassName];
    
    return activityType;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    self.activityItems = activityItems;
}

- (UIViewController *)activityViewController {
    
    if (self.isSilent == NO &&
        self.viewController == nil) {
        
        self.viewController =
        [self performWithActivityItems:self.activityItems];
        
        self.silent =
        self.viewController == nil;
    }
    
    return self.viewController;
}

#pragma mark - Self
#pragma mark addToFavorites
- (UIViewController *)performWithActivityItems:(NSArray *)activityItems {
    
    return nil;
}

@end
