//
//  AboutHarnViewController.h
//  HARN
//
//  Created by Casey Feldman on 4/19/13.
//
//

#import <UIKit/UIKit.h>

@interface AboutHarnViewController : UIViewController
{
    IBOutlet UIImageView *harnImage;
    IBOutlet UIButton *openFacebook;
    IBOutlet UIButton *openWebsite;
}

-(IBAction)visitSite:(UIButton *)sender;
-(IBAction)swipedRight:(UIGestureRecognizer *)sender;
-(IBAction)closeView:(id)sender;

@end
