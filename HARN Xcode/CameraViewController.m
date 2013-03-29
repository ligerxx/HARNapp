//
//  CameraViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import "CameraViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CameraViewController

@synthesize imageToBeSaved = _imageToBeSaved;

-(IBAction)saveImage:(id)sender
{
    UIImage *imageToSave;
    imageToSave = _imageView.image;
    UIImageWriteToSavedPhotosAlbum((imageToSave), nil, nil, nil);
    
    //ADD CODE TO LEAVE THE CAMERA UI ALL TOGETHER AND RETURN TO WHATEVER COLLECTION WAS LAST BEING VIEWED IN THE STACK
}


-(IBAction)share:(id)sender
{
    NSArray *sharedItems;   //Items that will be shared
    
    NSString *sharedText = @""; //This string would be the initial text that is in the share sheet
    
    sharedItems = @[sharedText, _imageView.image]; //adding the text and image into the array that is initializing below
    
    
    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:sharedItems applicationActivities:nil];
    
    shareSheet.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll, UIActivityTypeMessage];
    
    //Present it to the public
    [self presentViewController:shareSheet animated:YES completion:NULL];
}

-(IBAction)cancelView:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
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
    [super viewDidLoad];      // Custom initialization
        self.title = @"Share & Save";
    
    /*CGRect bounds;
    
    bounds.origin = CGPointZero;
    bounds.size = imageToBeSaved.size;
    
    _imageView.bounds = bounds;*/
    
    [_imageView setImage:self.imageToBeSaved];
    
    //Takes in the image passed from the filtered view
    CALayer *layer = _imageView.layer;
    
    //Adds a border
    [layer setBorderColor: [[UIColor grayColor] CGColor]];
    [layer setBorderWidth:3.0f];
    [layer setShadowColor: [[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:0.9f];
    [layer setShadowOffset: CGSizeMake(1, 3)];
    [layer setShadowRadius:4.0];
    [_imageView setClipsToBounds:NO];
    
    if(_imageView.image == nil)
    {
        shareButton.enabled = NO;
        savePhoto.hidden = YES;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
