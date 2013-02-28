//
//  InformationViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "InformationViewController.h"


@interface InformationViewController ()
{
}

@end

NSInteger currentSize = 0;

@implementation InformationViewController

-(IBAction)donePressed:(id)sender;
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)changeFontSize:(id)sender;
{
    
    if(currentSize == 0){    
        [_descriptionOfWork setFont:[UIFont systemFontOfSize:18]];
        currentSize++;
    }else if(currentSize == 1)
    {
        [_descriptionOfWork setFont:[UIFont systemFontOfSize:22]];
        currentSize++;
    }else{
          [_descriptionOfWork setFont:[UIFont systemFontOfSize:14]];
        currentSize = 0;
    }
}

-(void)setArtTitle:(NSString *)name
{
    _artTitle = name;
    
}
-(void)setArtDescription:(NSString *)someDescription
{
    _artDescription = someDescription;
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
    
    _descriptionOfWork.text = [NSString stringWithFormat:@"%@\n%@", _artTitle, _artDescription];
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
