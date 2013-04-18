//
//  MapViewController.m
//  HARN
//
//  Created by Casey Feldman on 4/15/13.
//
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize scrollView, mapView, openMaps;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)launchMaps:(id)sender
{
    //See if they have Google Maps installed and give that preference first
   BOOL googleMaps = [[UIApplication sharedApplication] canOpenURL:
     [NSURL URLWithString:@"comgooglemaps://"]];
    
    if(!googleMaps){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.apple.com/?q=3259+Hull+Road+Gainesville,+FL+32611-2700"]];
    }else{
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:@"comgooglemaps://?saddr=&daddr=Samuel+P.+Harn+Museum+of+Art,+3259+Hull+Road,+Gainesville,+Florida&directionsmode=driving"]];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [scrollView setBackgroundColor:[UIColor blackColor]];
    [scrollView setCanCancelContentTouches:NO];
    scrollView.clipsToBounds = YES; // default is NO, we want to restrict drawing within our scrollview
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"harnmap.png"]];
    mapView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:mapView];
    [scrollView setContentSize:CGSizeMake(mapView.frame.size.width, mapView.frame.size.height)];
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 3;
    scrollView.delegate = self;
    [scrollView setScrollEnabled:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)scrollViewDidZoom:(UIScrollView *)aScrollView {
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    mapView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                   scrollView.contentSize.height * 0.5 + offsetY);
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

-(void)showInfo:(id)sender
{
    
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return mapView;
}
@end
