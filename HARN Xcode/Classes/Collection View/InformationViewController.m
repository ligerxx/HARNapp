//
//  InformationViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "InformationViewController.h"


@interface InformationViewController ()

@end

@implementation InformationViewController

-(IBAction)donePressed:(id)sender;
{
    [self dismissModalViewControllerAnimated:YES];
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

- (void)viewDidUnload {
    [self setDescriptionOfWork:nil];
    [super viewDidUnload];
}
@end
