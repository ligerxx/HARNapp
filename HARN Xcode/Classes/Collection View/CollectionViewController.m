//
//  CollectionViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "CollectionViewController.h"
#import "ArtCell.h"
#import "ArtworkInformation.h"
#import "DetailViewController.h"

@interface CollectionViewController ()

@property (nonatomic, retain) NSMutableArray *sections;
@property (nonatomic, retain) ArtworkInformation *collectionInfo;

@end

@implementation CollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if([self.navigationController.navigationBar.topItem.title isEqualToString:@"Asian"])
    {
        NSLog(@"CORRECT!");
        NSString *collectionPicked = self.navigationController.navigationBar.topItem.title;
        [_collectionInfo generateInfo:collectionPicked];
    }
    
    //self.title = @"Asian";
    self.sections = @[@"Title 1",@"Title 2",@"Title 3",@"Title 4",@"Title 5",@"Title 6"];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    if(_collectionInfo != nil)
    {
        NSLog(@"We have returned count");
        return _collectionInfo.titles.count;
    }
    
    return [self.sections count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    if(_collectionInfo != nil)
    {
        ArtCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.title.text = _collectionInfo.titles[indexPath.row];
        cell.previewImage.image = _collectionInfo.imageThumbnails[indexPath.row];
        
        return cell;
    }
    
    ArtCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.title.text = self.sections[indexPath.row];
    cell.previewImage.image = [UIImage imageNamed:@"monet.png"];
    
    return cell;
}

//Controls the transfer to the detail view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        //Used for title of the Detail View
        NSInteger indexPath = selectedIndexPath.row + 1;
        NSInteger lengthOfArray = [_sections count];
        
        //Creates the detailView that and begins adding everything for it to present to the users since this is templateted (sp?)
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.title =  [NSString stringWithFormat:@"%u of %u",  indexPath, lengthOfArray ];

        //This will have to be the image stored in the cell
        UIImage *imageToSend = [UIImage imageNamed:@"monet.png"];
    
        detailViewController.theImage = imageToSend;
        [detailViewController setArtTitle:self.sections[selectedIndexPath.row]];
        [detailViewController setArtDescription:@"The most famous work in all the land!"];
        
        //Sending the Array to Detail View for swipe navigation
        detailViewController.arrayOfArt = [[NSArray alloc]initWithArray:self.sections];
        detailViewController.currentViewIndex = selectedIndexPath.row;
        
    }
}

@end