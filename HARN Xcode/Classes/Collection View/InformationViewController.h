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

-(IBAction)donePressed:(id)sender;
-(IBAction)changeFontSize:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *descriptionOfWork;
@property NSInteger currentSize;

- (NSInteger)getCurrentSize;
- (void)setCurrentSize:(NSInteger)currentSize;

@end
