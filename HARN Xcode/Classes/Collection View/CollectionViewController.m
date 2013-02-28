//
//  CollectionViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "CollectionViewController.h"
#import "ArtCell.h"
#import "DetailViewController.h"
#import "floatingButton.h"

@interface CollectionViewController ()

@property (nonatomic, retain) NSMutableArray *sections;

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
    
    self.title = @"Asian";
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
    
    return [self.sections count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
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
    }
}

@end