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
    NSString *artTitle;
    NSString *artDescription;
}

@property (strong, nonatomic) IBOutlet UIImageView* previewImage;
@property (nonatomic, retain) UIImage *theImage;

@property (strong, nonatomic) NSString *artTitle;
@property (strong, nonatomic) IBOutlet UILabel* titleOfWork;

@property (strong, nonatomic) NSString *artDescription;
@property (strong, nonatomic) IBOutlet UILabel* descriptionOfWork;

-(void)setImage:(UIImage *)image;
-(void)setArtTitle:(NSString *)name;
-(void)setArtDescription:(NSString *)someDescription;

@end
