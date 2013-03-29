//
//  CameraViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController
{
    UIImage *imageToBeSaved;
    UIImage *finalImage;
    
    IBOutlet UIButton *savePhoto;
    IBOutlet UIButton *cancel;
    IBOutlet UIBarButtonItem *shareButton;
    
}

-(IBAction)saveImage:(id)sender;
-(IBAction)cancelView:(id)sender;
-(IBAction)share:(id)sender;

//This property is what is is taken from filterView
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) UIImage *imageToBeSaved;

@end
