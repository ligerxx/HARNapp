//
//  DetailViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    UIImageView *previewImage;
    UIImage *theImage;
}

@property (strong, nonatomic) IBOutlet UIImageView* previewImage;
@property (nonatomic, retain) UIImage *theImage;
@property (strong, nonatomic) IBOutlet UILabel* titleOfWork;
@property (strong, nonatomic) IBOutlet UILabel* descriptionOfWork;

-(void)setImage:(UIImage *) image;

@end
