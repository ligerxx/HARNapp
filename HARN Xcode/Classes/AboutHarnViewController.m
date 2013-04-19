//
//  AboutHarnViewController.m
//  HARN
//
//  Created by Casey Feldman on 4/19/13.
//
//

#import "AboutHarnViewController.h"

@interface AboutHarnViewController ()

@end

@implementation AboutHarnViewController

-(IBAction)visitSite:(UIButton *)sender
{
    if([sender isEqual:openFacebook])
    {
        NSURL *urlApp = [NSURL URLWithString:@"fb://profile/83410142857"];
        //Check to see if they use Facebook and if so then open the profile
        BOOL awesome = [[UIApplication sharedApplication] openURL:urlApp];
        
        if(!awesome)
        {
            //well we can't all be awseome so...I'll just open Safari)
            awesome = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/HarnMuseumofArt"]];
        }
    }
    else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.harn.ufl.edu"]];
    }
}

-(IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
