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
#import "filterView.h"
#import "CollectionHeaderView.h"

@interface CollectionViewController ()

@property (nonatomic, retain) NSMutableArray *sections;
@property (nonatomic, retain) ArtworkInformation *collectionInfo;

@end

@implementation CollectionViewController

@synthesize collectionInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = collectionInfo.collectionDescription;
        headerView.headerText.text = title;
        
        //UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
        //headerView.backgroundImage.image = headerImage;
        
        reusableview = headerView;
    }
    return reusableview;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    collectionInfo = [[ArtworkInformation alloc] init];
    NSString *collectionPicked = self.navigationController.navigationBar.topItem.title;
        
    [collectionInfo generateInfo:collectionPicked];
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

    return collectionInfo.titles.count;
}

-(IBAction)swipedRight:(UIGestureRecognizer *)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{

        ArtCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.title.text = collectionInfo.titles[indexPath.row];
        cell.description.text = collectionInfo.smallDescription[indexPath.row];
        cell.previewImage.image = collectionInfo.imageThumbnails[indexPath.row];
        
        return cell;
}

//Controls the transfer to the detail view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showCamera"])
    {
        filterView *filter = [segue destinationViewController];
        filter.typeOfFilters = self.navigationController.navigationBar.topItem.title;
    }
    
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
            NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
            
            //Used for title of the Detail View
            NSInteger indexPath = selectedIndexPath.row + 1;
            NSInteger lengthOfArray = [collectionInfo.titles count];
            
            //Creates the detailView that and begins adding everything for it to present to the users since this is templateted (sp?)
            DetailViewController *detailViewController = [segue destinationViewController];
            detailViewController.title =  [NSString stringWithFormat:@"%u of %u",  indexPath, lengthOfArray ];
            
            //This will have to be the image stored in the cell
            UIImage *imageToSend = collectionInfo.largeImages[selectedIndexPath.row];
            
            detailViewController.theImage = imageToSend;
            [detailViewController setArtTitle:collectionInfo.titles[selectedIndexPath.row]];
            [detailViewController setArtDescription:collectionInfo.smallDescription[selectedIndexPath.row]];
            detailViewController.extendedDescription = collectionInfo.extendedDescription[selectedIndexPath.row];
            
            //Sending the Array to Detail View for swipe navigation
            detailViewController.arrayOfArt = [[NSArray alloc]initWithArray:self.sections];
            detailViewController.currentViewIndex = selectedIndexPath.row;
            
            return;

    }
}

@end