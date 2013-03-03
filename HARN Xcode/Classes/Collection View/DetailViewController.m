//
//  DetailViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "addToFavoritesActivity.h"
#import "DetailViewController.h"
#import "InformationViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

-(void)setImage:(UIImage *)image
{
    [_previewImage setImage:image];
}
-(void)setArtTitle:(NSString *)name
{
    _artTitle = name;
    
}
-(void)setArtDescription:(NSString *)someDescription
{
    _artDescription = someDescription;
}

-(IBAction)swipedLeft:(UIGestureRecognizer *)sender
{
    if(currentViewIndex != [arrayOfArt count])
    {
        currentViewIndex++;
    }

    _artTitle = [_arrayOfArt objectAtIndex:_currentViewIndex];
    _titleOfWork.text = [_arrayOfArt objectAtIndex:_currentViewIndex];

    self.title = [NSString stringWithFormat:@"%u of %u",  _currentViewIndex, [_arrayOfArt count] ];
    //DESCRIPTION CHANGED HERE
    //_artDescription = _artDescription;

    //PASS LARGER DESCRIPTION HERE

    _previewImage.image = [UIImage imageNamed:@"skeleton.png"];
    
}

-(IBAction)swipedRight:(UIGestureRecognizer *)sender
{
    if(currentViewIndex != 0)
    {
        currentViewIndex--;
    }
    
    _artTitle = [_arrayOfArt objectAtIndex:_currentViewIndex];
    _titleOfWork.text = [_arrayOfArt objectAtIndex:_currentViewIndex];
    
    self.title = [NSString stringWithFormat:@"%u of %u",  _currentViewIndex, [_arrayOfArt count] ];
    //DESCRIPTION CHANGED HERE
    //_artDescription = _artDescription;
    
    //PASS LARGER DESCRIPTION HERE
    
    _previewImage.image = [UIImage imageNamed:@"ceramic.png"];
    
}

-(IBAction)share:(id)sender
{
    NSArray *sharedItems;   //Items that will be shared
    
    NSArray *applicationActivities = @[[[addToFavoritesActivity alloc] init]];
    
    NSString *sharedText = @""; //This string would be the initial text that is in the share sheet
    
    sharedItems = @[sharedText, _previewImage.image]; //adding the text and image into the array that is initializing below
    
    
    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:sharedItems applicationActivities:applicationActivities];
    
    shareSheet.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll, UIActivityTypeMessage];
    
    //Present it to the public
    [self presentViewController:shareSheet animated:YES completion:NULL];
}

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
    
    [_previewImage setImage:_theImage];
    
    _titleOfWork.text = _artTitle;
    _descriptionOfWork.text = _artDescription;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Controls the transfer to the info view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showInfo"])
    {
        InformationViewController *infoView = [segue destinationViewController];
        
        infoView.artTitle = self.artTitle;
        infoView.artDescription = self.artDescription;
    }
}

@end
