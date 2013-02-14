//
//  CameraViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;
    
    CIContext *_context;
    NSMutableArray *filters;
    CIImage *beginImage;
    UIScrollView *filtersScrollView;
    
}
-(IBAction)showCameraUI:(id)sender;
-(IBAction)saveImage:(id)sender;
-(IBAction)closeCamera:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,weak) IBOutlet UIScrollView *filtersScrollView;
@property(strong,nonatomic) CIContext *context;

@end
