//
//  CollectionViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *pictureListData;

@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;

@property (nonatomic, retain, readonly) NSArray *sections;

- (void)readDataForTable;

@end