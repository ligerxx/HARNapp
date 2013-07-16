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

@property (nonatomic, strong) NSString* artTitle;
@property (nonatomic, strong) NSString* artDescription;
@property (strong, nonatomic) IBOutlet UITextView *descriptionOfWork;

@property (nonatomic) IBOutlet UINavigationBar *navBar;
@property UIColor *navBarTint;
@property NSInteger currentSize;

-(void)setArtTitle:(NSString *)name;
-(void)setArtDescription:(NSString *)someDescription;
-(void)updateDisplay;

@property (nonatomic, strong) NSDictionary *preferences;

@property (nonatomic) float fontSizeF;
@property (nonatomic) float smallerFontSizeF;

@end