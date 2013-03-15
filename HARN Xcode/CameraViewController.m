//
//  CameraViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import "CameraViewController.h"

@implementation CameraViewController

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
    
    //Takes in the image passed from the filtered view
    [_imageView setImage:_imageToBeSaved];
    
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
