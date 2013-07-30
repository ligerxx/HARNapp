//
//  MapGPSViewController.m
//  HARN
//
//  Created by Casey Feldman on 7/19/13.
//
//

#import "MapGPSViewController.h"

@interface MapGPSViewController ()

@end

@implementation MapGPSViewController

@synthesize locationView;

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
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 29.637019;
    coordinate.longitude = -82.370363;
    
    self.locationView.delegate = self;
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(point.coordinate, 50, 50);
    
    //[locationView addAnnotation:point];
    
    CLLocationCoordinate2D harnBoundaries[4]=
    {
        //NW corner
        CLLocationCoordinate2DMake(29.637474, -82.371051),
        
        //SW corner
        CLLocationCoordinate2DMake(29.636155, -82.371051),
        
        //SE corner
        CLLocationCoordinate2DMake(29.636155, -82.369599),
        
        //NE corner
        CLLocationCoordinate2DMake(29.637474, -82.369599),
    };
    
    MKPolygon *imageOverlayPolygon = [MKPolygon polygonWithCoordinates:harnBoundaries count:4];
    [self.locationView addOverlay:imageOverlayPolygon];
    
    [locationView setRegion:region animated:YES];
}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay
{
    MKPolygonView *polyView = [[MKPolygonView alloc] initWithOverlay:overlay];
    
    UIImage *harnMapImage = [UIImage imageNamed:@"harngpsoverlay.png"];
    MKMapRect mapRectangle = [overlay boundingMapRect];
    
    CGSize imageSize = CGSizeMake(mapRectangle.size.width, mapRectangle.size.height);
    
    UIGraphicsBeginImageContext(imageSize);
    [harnMapImage drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    
    UIImage *imageToBeUsedForOverlay = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    polyView.fillColor = [UIColor colorWithPatternImage:imageToBeUsedForOverlay];
    
    return polyView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
