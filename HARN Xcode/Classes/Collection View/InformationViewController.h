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
}
-(IBAction)changeFontSize:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *descriptionOfWork;

@end
