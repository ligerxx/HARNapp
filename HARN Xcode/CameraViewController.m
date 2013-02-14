//
//  CameraViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/13/13.
//
//

#import "CameraViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FilterPreview.h"
#import "UIImageExtension.h"

//@interface CameraViewController ()

//@end

@implementation CameraViewController

-(IBAction)showCameraUI:(id)sender
{
    _imageView.image = nil;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentModalViewController:imagePicker animated:YES];
    
    /*THIS WAS THE ORIGINAL SPEC TAKEN FROM APPLE'S DOCS TO OPEN THE CAMERA GUI.
     
     [self startCameraControllerFromViewController: self
                                    usingDelegate: self];*/
}

-(void)initializeCameraUI
{
    _imageView.image = nil;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentModalViewController:imagePicker animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    /*When the picture is taken the didFinishPickingMediaWithInfo method of the UIImagePickerControllerDelegate is invoked. The didFinishPickingMediaWithInfo parameter info has the information about the new image. The implementation below shows how to set the new image to the UIImageView control on the view. 
     */
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:image];
    
    //If you do not dismiss the model view controller as done below then you will be stuck at the camera screen. 
    [self dismissModalViewControllerAnimated:YES];
    
    //Load the set of filters again
    [self loadFiltersForImage:image];
}

-(IBAction)saveImage:(id)sender
{
    UIImage *imageToSave;
    imageToSave = _imageView.image;
    UIImageWriteToSavedPhotosAlbum((imageToSave), nil, nil, nil);
}

-(IBAction)closeCamera:(id)sender
{
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    cameraUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeCamera];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate;
    
    [controller presentModalViewController: cameraUI animated: YES];
    return YES;
}

-(void) loadFiltersForImage:(UIImage *) image
{
    
    CIImage *filterPreviewImage = [[CIImage alloc] initWithImage:image];
    
    CIFilter *sepiaFilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,filterPreviewImage,
                             @"inputIntensity",[NSNumber numberWithFloat:0.8],nil];
    
    
    CIFilter *colorMonochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:kCIInputImageKey,filterPreviewImage,
                                 @"inputColor",[CIColor colorWithString:@"Red"],
                                 @"inputIntensity",[NSNumber numberWithFloat:0.8], nil];
    
    filters = [[NSMutableArray alloc] init];
    
    
    [filters addObjectsFromArray:[NSArray arrayWithObjects:
                                  [[FilterPreview alloc] initWithNameAndFilter:@"Sepia" filter:sepiaFilter],
                                  [[FilterPreview alloc] initWithNameAndFilter:@"Mono" filter:colorMonochrome]
                                  
                                  , nil]];
    
    
    [self createPreviewViewsForFilters];
}

-(void) createPreviewViewsForFilters
{
    int offsetX = 0;
    for(int index = 0; index < [filters count]; index++)
    {
        UIView *filterView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, 0, 60, 60)];
        
        // create a label to display the name
        UILabel *filterNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, filterView.bounds.size.width, 8)];

        filterNameLabel.center = CGPointMake(filterView.bounds.size.width/2, filterView.bounds.size.height + filterNameLabel.bounds.size.height);
        
        FilterPreview *filter = (FilterPreview *) [filters objectAtIndex:index];
        
        filterNameLabel.text =  filter.name;
        filterNameLabel.backgroundColor = [UIColor clearColor];
        filterNameLabel.textColor = [UIColor whiteColor];
        filterNameLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:10];
        filterNameLabel.textAlignment = UITextAlignmentCenter;
        
        CIImage *outputImage = [filter.filter outputImage];
        
        CGImageRef cgimg =
        [self.context createCGImage:outputImage fromRect:[outputImage extent]];
        
        UIImage *smallImage =  [UIImage imageWithCGImage:cgimg];
        
        if(smallImage.imageOrientation == UIImageOrientationUp)
        {
            smallImage = [smallImage imageRotatedByDegrees:90];
        }
        
        
        // create filter preview image views
        UIImageView *filterPreviewImageView = [[UIImageView alloc] initWithImage:smallImage];
        
        [filterView setUserInteractionEnabled:YES];
        
        filterPreviewImageView.layer.cornerRadius = 10;
        filterPreviewImageView.opaque = NO;
        filterPreviewImageView.backgroundColor = [UIColor clearColor];
        filterPreviewImageView.layer.masksToBounds = YES;
        filterPreviewImageView.frame = CGRectMake(0, 0, 60, 60);
        
        filterView.tag = index;
        
        [self applyGesturesToFilterPreviewImageView:filterView];
        
        [filterView addSubview:filterPreviewImageView];
        [filterView addSubview:filterNameLabel];
        
        [self.filtersScrollView addSubview:filterView];
        
        offsetX += filterView.bounds.size.width + 10;
        
    }
    
    [self.filtersScrollView setContentSize:CGSizeMake(400, 60)];
}

-(void) applyGesturesToFilterPreviewImageView:(UIView *) view
{
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(applyFilter:)];
    
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    
    [view addGestureRecognizer:singleTapGestureRecognizer];
}

-(void) applyFilter:(id) sender
{
    int filterIndex = [(UITapGestureRecognizer *) sender view].tag;
    FilterPreview *filter = [filters objectAtIndex:filterIndex];
    
    CIImage *outputImage = [filter.filter outputImage];
    
    CGImageRef cgimg =
    [self.context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *finalImage = [UIImage imageWithCGImage:cgimg];
    
    finalImage = [finalImage imageRotatedByDegrees:90];
    
    [self.imageView setImage:finalImage];
    
    CGImageRelease(cgimg);
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.context =[CIContext contextWithOptions:nil];        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.context =[CIContext contextWithOptions:nil];        // Custom initialization

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
