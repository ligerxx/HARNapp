//
//  TitleViewController.m
//  HARN
//
//  Created by Lauren Gray on 2/14/13.
//
//

#import "TitleViewController.h"
#import "CollectionViewController.h"
#import "AboutPageViewController.h"
#import "PagingScrollViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController
@synthesize topLayer = _topLayer;
@synthesize layerPosition = _layerPosition;
@synthesize titleArray = _titleArray;
@synthesize selectedCell, nowFeaturing, slider, bottomLayerHidden;

BOOL _bottomVisible;


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
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale != 2.0)) {
        //Non-retina devices should use a different slider image
        
        [slider setImage:[UIImage imageNamed:@"mainmenu.png"] forState:UIControlStateNormal];
        [slider setImage:[UIImage imageNamed:@"mainmenu.png"] forState:UIControlStateSelected];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
    // plist loading in for icons and titles in table view
    NSString *propertiesFile;
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
        propertiesFile = [[NSBundle mainBundle] pathForResource:@"Properties-iOS6" ofType:@"plist"];
    } else {
        // Load resources for iOS 7 or later
        propertiesFile = [[NSBundle mainBundle] pathForResource:@"Properties" ofType:@"plist"];
    }
    
    _properties = [[NSMutableArray alloc] initWithContentsOfFile:propertiesFile];
    
    // create shadows
    self.topLayer.layer.shadowOffset = CGSizeMake(-1,0);
    self.topLayer.layer.shadowOpacity = .7;
    // optimize them
    self.topLayer.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.topLayer.bounds].CGPath;
    // here are the layers we'll apply them to!
    self.layerPosition = self.topLayer.frame.origin.x;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPanLayer:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.topLayer addGestureRecognizer:tapRecognizer];
    
    nowFeaturing.text = @"A Project By UF Students";
}

// the number of pixels we want displayed for our navigation
#define VIEW_HIDDEN 250

// animate our layer to the specified point in pixels
- (void)animateLayerToPoint:(CGFloat)x {
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         CGRect frame = self.topLayer.frame;
                         frame.origin.x = x;
                         self.topLayer.frame = frame;
                     }
                     completion:^(BOOL finished){
                         self.layerPosition = self.topLayer.frame.origin.x;
                     }];
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan {
    // if we are performing this pan, do:
    if (pan.state == UIGestureRecognizerStateChanged) {
        // view we are looking at
        CGPoint point = [pan translationInView:self.topLayer];
        // new frame we are creating
        CGRect frame = self.topLayer.frame;
        // our frame should be located at 0 plus however much we are panning
        frame.origin.x = self.layerPosition + point.x;
        // check that we can't pan past the page
        if (frame.origin.x < 0) frame.origin.x = 0;
        // setting it equal
        self.topLayer.frame = frame;
    }
    // once we've lifted our finger, do:
    if (pan.state == UIGestureRecognizerStateEnded) {
        // if you let go before reaching the midpoint, snap back
        if (self.topLayer.frame.origin.x < 160) {
            [self animateLayerToPoint:0];
            _bottomVisible = NO;
            self.container.userInteractionEnabled = YES; //Should enable the swiping through the gallery in the top layer
            bottomLayerHidden = TRUE;
        } else {
            [self animateLayerToPoint:VIEW_HIDDEN];
            _bottomVisible = YES;
            self.container.userInteractionEnabled = NO; //Should disable the swiping through the gallery in the top layer
            bottomLayerHidden = FALSE;

        }
    }
}

// now we can use our list view button to do the panning for us
- (IBAction)tapToPanLayer:(id)sender {
    if (_bottomVisible == NO) {
        [self animateLayerToPoint:VIEW_HIDDEN];
        _bottomVisible = YES;
        self.container.userInteractionEnabled = NO; //Should disable the swiping through the gallery in the top layer
        bottomLayerHidden = TRUE;
    } else {
        [self animateLayerToPoint:0];
        _bottomVisible = NO;
        self.container.userInteractionEnabled = YES; //Should disable the swiping through the gallery in the top layer
        bottomLayerHidden = FALSE;
    }
}

// for populating our navigation list:

// how many sections to expect
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_properties count];
}

// how many rows to expect
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // number of rows it should expect should be based on the section
    NSDictionary *dictionary = [_properties objectAtIndex:section];
    //NSLog(@"%lu", (unsigned long)[dictionary count]);
    NSArray *array = [dictionary objectForKey:@"data"];
    //NSLog(@"%lu", (unsigned long)[array count]);
    return [array count];
}

// our headers
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Collections";
    else if(section == 1)
        return @"Information";
    else
        return @"Personal";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}

// loop through dataArray and do the hard work
// customize the apparence of table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        // cell style: triange/arrow at end/right of cell
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *dictionary = [_properties objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    // add image to cells...
    NSDictionary *dictionary2 = [_properties objectAtIndex:indexPath.section];
    NSArray *array2 = [dictionary2 objectForKey:@"images"];
    NSString *cellValue2 = [array2 objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:cellValue2];

    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// area where the color and title of the Navigation Bar will be set when someone has clicked on a cell
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // get the selected item in our navigation list
    NSDictionary *dictionary = [_properties objectAtIndex:[self.tableView indexPathForSelectedRow].section];
    NSArray *array = [dictionary objectForKey:@"data"];
    self.selectedCell = [array objectAtIndex:[self.tableView indexPathForSelectedRow].row];

    if ([[segue identifier] isEqualToString:@"navigateToCollection"] && (![self.selectedCell isEqualToString:@"Privacy Policy"] || ![self.selectedCell isEqualToString:@"Map"] || ![self.selectedCell isEqualToString:@"About"]) )
    {
        // write which item we have selected to our output
        NSLog(@"%@", self.selectedCell);
        
        UINavigationController *collection = [segue destinationViewController];
        // set nav bar title
        collection.navigationBar.topItem.title = self.selectedCell;
        // set nav bar color
        if([self.selectedCell isEqualToString:@"African"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.964 green:0.584 blue:0.266 alpha:1]; //ORANGE
        } else if([self.selectedCell isEqualToString:@"Ancient American"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.565 green:0.411 blue:0.8 alpha:1]; //PURPLE
        } else if([self.selectedCell isEqualToString:@"Asian"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.2509 green:0.6 blue:0.2901 alpha:1]; //GREEN
        } else if([self.selectedCell isEqualToString:@"Contemporary"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.88 green:0.05 blue:0.05 alpha:1]; //RED
        } else if([self.selectedCell isEqualToString:@"Oceanic"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.886 green:0.83 blue:0.034 alpha:1]; //YELLOW
        } else if([self.selectedCell isEqualToString:@"Prints and Drawings Bef..."]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.329 green:0.604 blue:0.95 alpha:1]; //BLUE
        } else if([self.selectedCell isEqualToString:@"Photography"]) {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1]; //BLACK
        } else {
            collection.navigationBar.tintColor = [UIColor colorWithRed:0.667 green:0.667 blue:0.667 alpha:1]; //GRAY
        }
    }
    
    UIStoryboard *storyboard = self.storyboard;
    //Special Cases like if someone clicks info, privacy policy, map, etc. This is currently throwing a warning but does work.
    if([self.selectedCell isEqualToString:@"Privacy Policy"])
    {
        UIViewController *privacy = [storyboard instantiateViewControllerWithIdentifier:@"Privacy"];
        [self presentViewController:privacy animated:YES completion:nil];
        
        return;
    }else if ([self.selectedCell isEqualToString:@"About This App"]) {
        
        AboutPageViewController *aboutPage = [storyboard instantiateViewControllerWithIdentifier:@"About"];
        [self presentViewController:aboutPage animated:YES completion:nil];
    }else if ([self.selectedCell isEqualToString:@"About The HARN"]) {
        
        AboutPageViewController *aboutHarnPage = [storyboard instantiateViewControllerWithIdentifier:@"AboutHarn"];
        [self presentViewController:aboutHarnPage animated:YES completion:nil];
    }
    
    if ([self.selectedCell isEqualToString:@"Map"]) {
        //iOS 6 v iOS 7 Condition
        AboutPageViewController *mapPage;
        
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
            // Load resources for iOS 6.1 or earlier
            mapPage = [storyboard instantiateViewControllerWithIdentifier:@"Map"];
        } else {
            // Load resources for iOS 7 or later
            mapPage = [storyboard instantiateViewControllerWithIdentifier:@"NewMap"];
        }

        [self presentViewController:mapPage animated:YES completion:nil];
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Transition the label text
    CATransition *animation = [CATransition animation];
    animation.duration = 2.25;
    animation.type = kCATransitionFade;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [nowFeaturing.layer addAnimation:animation forKey:@"changeTextTransition"];
    
    // Change the text
    nowFeaturing.text = @"Now Featuring";

    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)viewDidUnload {
    [self setTopLayer:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
