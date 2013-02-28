//
//  InformationViewController.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController
{
    NSString *artTitle;
    NSString *artDescription;
}

-(IBAction)donePressed:(id)sender;
-(IBAction)changeFontSize:(id)sender;

@property (strong, nonatomic) NSString* artTitle;
@property (strong, nonatomic) NSString* artDescription;
@property (weak, nonatomic) IBOutlet UITextView *descriptionOfWork;
@property NSInteger currentSize;

-(void)setArtTitle:(NSString *)name;
-(void)setArtDescription:(NSString *)someDescription;

@end
