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
    _artTitle = name;
    
}
-(void)setArtDescription:(NSString *)someDescription
{
    _artDescription = someDescription;
}

-(IBAction)swipeHandler:(UIGestureRecognizer *)sender
{
    
}

-(IBAction)share:(id)sender
{
    NSArray *sharedItems;
    NSString *sharedText = @"";
    
    sharedItems = @[sharedText, _previewImage.image];
    
    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:sharedItems applicationActivities:nil];
    
    [self presentViewController:shareSheet animated:YES completion:NULL];
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
    
    _titleOfWork.text = _artTitle;
    _descriptionOfWork.text = _artDescription;
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
        
        infoView.artTitle = self.artTitle;
        infoView.artDescription = self.artDescription;
    }
}

@end
