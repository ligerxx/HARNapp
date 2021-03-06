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
    NSArray *arrayOfArt;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *homeButton; //Only used for front page navigation

@property (strong, nonatomic) IBOutlet UIBarButtonItem *shareButton; 

@property (strong, nonatomic) IBOutlet UIImageView* previewImage;
@property (nonatomic, retain) UIImage *theImage;

@property (strong, nonatomic) NSString *artTitle;
@property (strong, nonatomic) IBOutlet UILabel* titleOfWork;

@property (strong, nonatomic) NSString *artDescription;
@property (strong, nonatomic) IBOutlet UILabel* descriptionOfWork;

@property (strong, nonatomic) NSString *extendedDescription;

@property int *currentViewIndex;
@property (strong, nonatomic) NSArray *arrayOfArt;

@property (strong) IBOutlet UIButton *info;

//Used for gesture navigation
-(IBAction)swipedLeft:(UIGestureRecognizer *)sender;
//-(IBAction)swipedRight:(UIGestureRecognizer *)sender;

//Share Button Action
-(IBAction)share:(id)sender;

-(void)setImage:(UIImage *)image;
-(void)setArtTitle:(NSString *)name;
-(void)setArtDescription:(NSString *)someDescription;

@end
