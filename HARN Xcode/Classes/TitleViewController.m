//
//  TitleViewController.m
//  HARN
//
//  Created by Lauren Gray on 2/14/13.
//
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController
@synthesize topLayer = _topLayer;
@synthesize layerPosition = _layerPosition;
@synthesize titleArray = _titleArray;
@synthesize dataArray = _dataArray;
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
    // create shadows
    self.topLayer.layer.shadowOffset = CGSizeMake(-1,0);
    self.topLayer.layer.shadowOpacity = .7;
    // optimize them
    self.topLayer.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.topLayer.bounds].CGPath;
    // here are the layers we'll apply them to!
    self.layerPosition = self.topLayer.frame.origin.x;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
     //Initialize the dataArray
     _dataArray = [[NSMutableArray alloc] init];
    //First section data
    NSArray *firstItemsArray = [[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", @"Item 1", @"Item 2", @"Item 3", nil];
     NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
     [_dataArray addObject:firstItemsArrayDict];
     //Second section data
     NSArray *secondItemsArray = [[NSArray alloc] initWithObjects:@"Item 4", @"Item 5", @"Item 6", @"Last Item", nil];
     NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
     [_dataArray addObject:secondItemsArrayDict];

}

#define VIEW_HIDDEN 260

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

- (IBAction)tapToPanLayer:(id)sender {
    if (_bottomVisible == NO) {
        [self animateLayerToPoint:VIEW_HIDDEN];
        _bottomVisible = YES;
    } else {
        [self animateLayerToPoint:0];
        _bottomVisible = NO;
    }
}

// how many sections to expect
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArray count];
}

// how many rows to expect
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [_dataArray objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"data"];
    return [array count];
}

// our headers
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"Section 1";
    else
        return @"Section 2";
}

// loop through dataArray and do the hard work
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictionary = [_dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}

// what??
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//Get the selected country
    
    NSString *selectedCell = nil;
    NSDictionary *dictionary = [_dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    selectedCell = [array objectAtIndex:indexPath.row];
    
    NSLog(@"%@", selectedCell);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTopLayer:nil];
    //[self setTableView:nil];
    [super viewDidUnload];
}
@end
