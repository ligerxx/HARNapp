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
    UIScrollView *filtersScrollView;
    UIView *selectedFilterView;
    UIImage *finalImage;
}

-(IBAction)showCameraUI:(id)sender;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property IBOutlet UIButton *retake;
@property (nonatomic, retain) IBOutlet UIScrollView *filtersScrollView;
@property(strong,nonatomic) CIContext *context;

@end
