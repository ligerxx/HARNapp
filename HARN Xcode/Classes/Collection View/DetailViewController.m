//
//  DetailViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "DetailViewController.h"
#import "InformationViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

-(void)setImage:(UIImage *)image
{
    [_previewImage setImage:image];
}
-(void)setArtTitle:(NSString *)name
{
    artTitle = name;
    
}
-(void)setArtDescription:(NSString *)someDescription
{
    artDescription = someDescription;
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
    
    [_previewImage setImage:_theImage];
    
    _titleOfWork.text = artTitle;
    _descriptionOfWork.text = artDescription;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Controls the transfer to the info view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showInfo"])
    {
        InformationViewController *infoView = [segue destinationViewController];
        
        [infoView setArtTitle:_artTitle];
        [infoView setArtDescription:_artDescription];
    }
}

@end
