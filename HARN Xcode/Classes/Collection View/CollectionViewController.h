//
//  CollectionViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;

@property (nonatomic, retain, readonly) NSArray *sections;

-(IBAction)swipedRight:(UIGestureRecognizer *)sender;
-(IBAction)closeView:(id)sender;

@end