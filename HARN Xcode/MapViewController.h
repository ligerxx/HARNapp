//
//  MapViewController.h
//  HARN
//
//  Created by Casey Feldman on 4/15/13.
//
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView * mapView;
}

@property (nonatomic, retain) IBOutlet UIImageView * mapView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (IBAction)showInfo:(id)sender;

@end
