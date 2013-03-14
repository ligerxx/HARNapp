//
//  TitleViewController.m
//  HARN
//
//  Created by Lauren Gray on 2/14/13.
//
//

#import "TitleViewController.h"
#import "CollectionViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController
@synthesize topLayer = _topLayer;
@synthesize layerPosition = _layerPosition;
@synthesize titleArray = _titleArray;
@synthesize dataArray = _dataArray;

@synthesize properties = _properties;
@synthesize personalNavigation = _personalNavigation;
@synthesize currentExhibition = _currentExhibition;
@synthesize typeSize = _typeSize;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // plist shit
    NSString *propertiesFile = [[NSBundle mainBundle] pathForResource:@"Properties" ofType:@"plist"];
    _properties = [[NSDictionary alloc] initWithContentsOfFile:propertiesFile];
    _personalNavigation = [_properties objectForKey:@"personalNavigation"];
    _currentExhibition = [_properties objectForKey:@"currentExhibition"];
    
    // create shadows
    self.topLayer.layer.shadowOffset = CGSizeMake(-1,0);
    self.topLayer.layer.shadowOpacity = .7;
    // optimize them
    self.topLayer.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.topLayer.bounds].CGPath;
    // here are the layers we'll apply them to!
    self.layerPosition = self.topLayer.frame.origin.x;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
     // initialize the dataArray
     _dataArray = [[NSMutableArray alloc] init];
    // first section data - will need to automate, later
    NSArray *firstItemsArray = [[NSArray alloc] initWithObjects:@"African", @"Ancient American", @"Asian", @"Contemporary", @"Modern", @"Photography", @"Prints and Drawings Before 1234", nil];
     NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
     [_dataArray addObject:firstItemsArrayDict];
     // second section data
     NSArray *secondItemsArray = [[NSArray alloc] initWithObjects:@"Favorites", @"Photos", nil];
     NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
     [_dataArray addObject:secondItemsArrayDict];

}

// the number of pixels we want displayed for our navigation
#define VIEW_HIDDEN 265

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
        } else {
            [self animateLayerToPoint:VIEW_HIDDEN];
            _bottomVisible = YES;
        }
    }
}

// now we can use our list view button to do the panning for us
- (IBAction)tapToPanLayer:(id)sender {
    if (_bottomVisible == NO) {
        [self animateLayerToPoint:VIEW_HIDDEN];
        _bottomVisible = YES;
    } else {
        [self animateLayerToPoint:0];
        _bottomVisible = NO;
    }
}

// for populating our navigation list:

// how many sections to expect
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArray count];
}

// how many rows to expect
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // number of rows it should expect should be based on the section
    //NSDictionary *dictionary = [_dataArray objectAtIndex:section];
    //NSArray *array = [dictionary objectForKey:@"data"];
    //return [array count];
    
    return [_currentExhibition count];
}

// our headers
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Collections";
    else
        return @"Personal";
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
    
    //NSDictionary *dictionary = [_dataArray objectAtIndex:indexPath.section];
    //NSArray *array = [dictionary objectForKey:@"data"];
    //NSString *cellValue = [array objectAtIndex:indexPath.row];
    //cell.textLabel.text = cellValue;
    
    NSString *currentExhibitionDisplay = [_currentExhibition objectAtIndex:indexPath.row];
    cell.textLabel.text = currentExhibitionDisplay;
    
    return cell;
}

// user selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	// get the selected item in our navigation list
    NSString *selectedCell = nil;
    NSDictionary *dictionary = [_dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    
    // write which item we have selected to our output
    NSLog(@"%@", selectedCell);
    
    // animate the deselection
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*// push the collection view when an item is selected
     CollectionViewController *cvController = [[CollectionViewController alloc] initWithNibName:@"%@" bundle:[NSBundle mainBundle]];
     [self.navigationController pushViewController:cvController animated:YES];*/
    
    //[(UINavigationController*)self.viewDeckController performSegueWithIdentifier:@"navigateToCollection" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTopLayer:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
