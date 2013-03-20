//
//  filterView.h
//  HARN
//
//  Created by Casey Feldman on 3/14/13.
//
//

#import <UIKit/UIKit.h>

@interface filterView : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    CIContext *_context;
    NSMutableArray *filters;
    CIImage *beginImage;
    UIImage *originalImage;
    UIScrollView *filtersScrollView;
    UIView *selectedFilterView;
    UIImage *finalImage;
}

-(IBAction)showCameraUI:(id)sender;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIImageView *background;
@property IBOutlet UIButton *retake;
@property IBOutlet UIBarButtonItem *save;
@property (nonatomic, retain) IBOutlet UIScrollView *filtersScrollView;
@property(strong,nonatomic) CIContext *context;

@end
