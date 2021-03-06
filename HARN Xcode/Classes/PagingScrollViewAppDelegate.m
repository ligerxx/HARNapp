//
//  PagingScrollViewAppDelegate.m
//  PagingScrollView
//
//  Created by Matt Gallagher on 24/01/09.
//  Copyright Matt Gallagher 2009. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "PagingScrollViewAppDelegate.h"
#import "PagingScrollViewController.h"

@implementation PagingScrollViewAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    
	[window addSubview:pagingScrollViewController.view];
	
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        UIStoryboard *storyBoard;
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        CGFloat scale = [UIScreen mainScreen].scale;
        result = CGSizeMake(result.width * scale, result.height * scale);
        
        //If for some reason it is required to use a different storyboard file (iPad, etc.) the check would go here
        if(result.height <= 1136){
            storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            UIViewController *initViewController = [storyBoard instantiateInitialViewController];
            [self.window setRootViewController:initViewController];
        }
    }
    
    [window makeKeyAndVisible];
}



@end
