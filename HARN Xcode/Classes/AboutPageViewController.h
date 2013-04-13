//
//  AboutPageViewController.h
//  HARN
//
//  Created by Casey Feldman on 4/13/13.
//
//

#import <UIKit/UIKit.h>

@interface AboutPageViewController : UIViewController
{
    IBOutlet UIImageView *caseyImage;
    IBOutlet UIImageView *laurenImage;
    IBOutlet UIButton *followCasey;
    IBOutlet UIButton *followLauren;
    
}

-(IBAction)visitSite:(UIButton *)sender;

@end
