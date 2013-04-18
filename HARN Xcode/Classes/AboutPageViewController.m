//
//  AboutPageViewController.m
//  HARN
//
//  Created by Casey Feldman on 4/13/13.
//
//

#import "AboutPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutPageViewController ()

@end

@implementation AboutPageViewController

-(IBAction)visitSite:(UIButton *)sender
{
    if([sender isEqual:followCasey])
    {
        //Check to see if they use Twitterific and if so then open my profile
        BOOL awesome = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitterrific://account/screen_name/profile?screen_name=ligerxx"]];
        
        if(!awesome)
        {
            //well we can't all be awseome so...I'll just open my portfolio ;)
            awesome = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.caseyfeldman.me/"]];
        }
    }
    else{
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.laurengraydesigns.com"]];
    }
}

-(IBAction)swipedRight:(UIGestureRecognizer *)sender
{
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Takes in the image passed from the filtered view
    CALayer *layer = caseyImage.layer;
    CALayer *layer2 = laurenImage.layer;
    
    //Adds a border
    [layer setBorderColor: [[UIColor grayColor] CGColor]];
    [layer setBorderWidth:1.0f];
    [layer setShadowColor: [[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:0.9f];
    [layer setShadowOffset: CGSizeMake(1, 3)];
    [layer setShadowRadius:8.0f];
    [caseyImage setClipsToBounds:YES];
    
    [layer2 setBorderColor: [[UIColor grayColor] CGColor]];
    [layer2 setBorderWidth:1.0f];
    [layer2 setShadowColor: [[UIColor blackColor] CGColor]];
    [layer2 setShadowOpacity:0.9f];
    [layer2 setShadowOffset: CGSizeMake(1, 3)];
    [layer2 setShadowRadius:8.0f];
    [laurenImage setClipsToBounds:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
