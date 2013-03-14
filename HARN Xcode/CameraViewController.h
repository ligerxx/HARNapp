//
//  CameraViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;
    CIContext *_context;
    NSMutableArray *filters;
    CIImage *beginImage;
    UIScrollView *filtersScrollView;
    UIView *selectedFilterView;
    UIImage *finalImage;
    
    IBOutlet UIButton *savePhoto;
    IBOutlet UIBarButtonItem *shareButton;
    
}
-(IBAction)showCameraUI:(id)sender;
-(IBAction)saveImage:(id)sender;
-(IBAction)share:(id)sender;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIScrollView *filtersScrollView;
@property(strong,nonatomic) CIContext *context;

@end
