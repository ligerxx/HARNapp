//
//  MapGPSViewController.h
//  HARN
//
//  Created by Casey Feldman on 7/19/13.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface MapGPSViewController : MapViewController
{
    IBOutlet UIBarButtonItem *openInOtherApp;
}

@property (nonatomic) IBOutlet MKMapView *locationView;


-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay;
- (IBAction)launchMaps:(id)sender;
- (IBAction)closeView:(id)sender;

@end
