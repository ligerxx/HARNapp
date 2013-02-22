//
//  DetailViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView* previewImage;
@property (strong, nonatomic) IBOutlet UILabel* titleOfWork;
@property (strong, nonatomic) IBOutlet UILabel* descriptionOfWork;

@end
