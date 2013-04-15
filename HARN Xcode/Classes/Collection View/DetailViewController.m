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

@synthesize extendedDescription;

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

/*
-(IBAction)swipedLeft:(UIGestureRecognizer *)sender
{
    if( (int) currentViewIndex != [arrayOfArt count])
    {
        currentViewIndex++;
    }

    _artTitle = [_arrayOfArt objectAtIndex:_currentViewIndex];
    _titleOfWork.text = [_arrayOfArt objectAtIndex:_currentViewIndex];

    self.title = [NSString stringWithFormat:@"%d of %u",  _currentViewIndex, [_arrayOfArt count] ];
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
    
    self.title = [NSString stringWithFormat:@"%d of %u", _currentViewIndex, [_arrayOfArt count] ];
    //DESCRIPTION CHANGED HERE
    //_artDescription = _artDescription;
    
    //PASS LARGER DESCRIPTION HERE
    
    _previewImage.image = [UIImage imageNamed:@"ceramic.png"];
    
}
*/
 
-(IBAction)share:(id)sender
{
    NSArray *sharedItems;   //Items that will be shared
    
    //TAKEN OUT FOR THIS RELEASE - THIS IS THE CUSTOM CLASS THAT ADDS THE BUTTON ADD TO FAVORITES
    //NSArray *applicationActivities = @[[[addToFavoritesActivity alloc] init]];
    
    NSString *sharedText = @""; //This string would be the initial text that is in the share sheet
    
    sharedItems = @[sharedText, _previewImage.image]; //adding the text and image into the array that is initializing below
    
    
    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:sharedItems applicationActivities:nil];
    
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
    
    /*This is called when navigating from the front page. In this situation, there would be no UINavigationBar or UINavigationController 
     * created already so we generate a Navigation Bar and share button
     */
    if(self.navigationController == nil)
    {
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
        navBar.barStyle = 2;
        UINavigationItem *navItem = [[UINavigationItem alloc] init];
        [navBar pushNavigationItem:navItem animated:NO];
        navItem.rightBarButtonItem = _shareButton;
        navItem.leftBarButtonItem = _homeButton;
        [self.view addSubview: navBar];
        
    }else
    {
        //We don't need the homebutton in this situation because they navigated here via the collection so remove it from the navigationbar.
        //They should see the normal back button to return to that collection
        _homeButton = nil;
        self.navigationItem.leftBarButtonItem = nil;
    }
        
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
        infoView.artDescription = extendedDescription;
    }
}

@end
