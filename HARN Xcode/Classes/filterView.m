//
//  filterView.m
//  HARN
//
//  Created by Casey Feldman on 3/14/13.
//
//

#import "filterView.h"
#import <QuartzCore/QuartzCore.h>
#import "FilterPreview.h"
#import "UIImageExtension.h"
#import "CameraViewController.h"

@implementation filterView

@synthesize filtersScrollView = _filterScrollView;

@synthesize typeOfFilters;

static const int FILTER_LABEL = 001;

bool firstTimeOpen = true;

-(IBAction)showCameraUI:(id)sender
{
    for(UIView *subview in [self.filtersScrollView subviews]) {
        [subview removeFromSuperview];
    }
    
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
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
    /*THIS WAS THE ORIGINAL SPEC TAKEN FROM APPLE'S DOCS TO OPEN THE CAMERA GUI.
     
     [self startCameraControllerFromViewController: self
     usingDelegate: self];*/
}

-(void)initializeCameraUI
{
    for(UIView *subview in [self.filtersScrollView subviews]) {
        [subview removeFromSuperview];
    }
    
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
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    /*When the picture is taken the didFinishPickingMediaWithInfo method of the UIImagePickerControllerDelegate is invoked. The didFinishPickingMediaWithInfo parameter info has the information about the new image. The implementation below shows how to set the new image to the UIImageView control on the view.
     */
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    originalImage = image;
    
    [self.imageView setImage:image];
    
    _save.enabled = YES;
    _retake.hidden = YES;
    
    //If you do not dismiss the model view controller as done below then you will be stuck at the camera screen.
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.filtersScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 405, 320, 100)];
    
    [self.filtersScrollView setScrollEnabled:YES];
    [self.filtersScrollView setShowsVerticalScrollIndicator:NO];
    self.filtersScrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.filtersScrollView];
    
    //Load the set of filters again
    [self loadFiltersForImage:image];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    for(UIView *subview in [self.filtersScrollView subviews]) {
        [subview removeFromSuperview];
    }
    
    _save.enabled = NO;
    _retake.hidden = NO;
    
    [self.background setImage:[UIImage imageNamed:@"retake@2x.png"]];
    [self.filtersScrollView setBackgroundColor:[UIColor clearColor]];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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
    
    [controller presentViewController:cameraUI animated: YES completion:nil];
    return YES;
}

-(UIImage *)resizeTexture:(UIImage *)image width:(CGFloat)resizedWidth height:(CGFloat)resizedHeight
{
    UIGraphicsBeginImageContext(CGSizeMake(resizedWidth ,resizedHeight));
    [image drawInRect:CGRectMake(0, 0, resizedWidth, resizedHeight)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

-(void) loadFiltersForImage:(UIImage *) image
{
    
    CIImage *filterPreviewImage = [[CIImage alloc] initWithImage:image];
    CGFloat width;
    CGFloat height;
    NSString *filterName1, *filterName2;
    CIFilter *filter1, *filter2;
    
    if(originalImage.size.width > originalImage.size.height )
    {
        //landscape dimensions
        width = _imageView.image.size.width;
        height = _imageView.image.size.height;
    }else
    {
        //portrait dimensions
        width = _imageView.image.size.height;
        height = _imageView.image.size.width;
    }
    
    if ([typeOfFilters isEqualToString:@"African"]) {
        // SAHARA
        filterName1 = @"Sahara";
        UIImage *saharaPic = [UIImage imageNamed:@"sahara.png"];
        saharaPic = [self resizeTexture:saharaPic width:width height:height];
        CIImage *saharaTexture = [[CIImage alloc] initWithImage:saharaPic];
        CIFilter *sepiaFilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,filterPreviewImage,
                                 @"inputIntensity",[NSNumber numberWithFloat:0.4],nil];
        CIFilter *sahara = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:kCIInputBackgroundImageKey, saharaTexture, kCIInputImageKey, sepiaFilter.outputImage, nil];
        filter1 = sahara;
        // Oasis, Jambo
    } else if ([typeOfFilters isEqualToString:@"Ancient American"]) {
        // Cuzco, Nasca, Wari
    } else if([typeOfFilters isEqualToString:@"Asian"]) {
        // ZEN
        filterName1 = @"Zen";
        UIImage *zenPic = [UIImage imageNamed:@"zen.png"];
        zenPic = [self resizeTexture:zenPic width:width height:height];
        CIImage *zenTexture = [[CIImage alloc] initWithImage:zenPic];
         CIFilter *sepiaFilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,filterPreviewImage,
         @"inputIntensity",[NSNumber numberWithFloat:0.4],nil];
         CIFilter *zen = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:kCIInputBackgroundImageKey, zenTexture, kCIInputImageKey, sepiaFilter.outputImage, nil];
        filter1 = zen;
        // JADE
        filterName2 = @"Jade";
        UIImage *jadePic = [UIImage imageNamed:@"jade.png"];
        jadePic = [self resizeTexture:jadePic width:width height:height];
        CIImage *jadeTexture = [[CIImage alloc] initWithImage:jadePic];
        CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
        [vignette setValue:filterPreviewImage forKey:kCIInputImageKey];
        [vignette setValue:[NSNumber numberWithFloat:1.0f] forKey:@"inputIntensity"];
        [vignette setValue:[NSNumber numberWithFloat:30.0f] forKey:@"inputRadius"];
        CIFilter *neueJade = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:kCIInputBackgroundImageKey, jadeTexture, kCIInputImageKey, vignette.outputImage, nil];
        filter2 = neueJade;
    } else if ([typeOfFilters isEqualToString:@"Contemporary"]) {
        // WARHOL
        filterName1 = @"Warhol";
        CIFilter *warholHalftone = [CIFilter filterWithName:@"CIDotScreen" keysAndValues:kCIInputImageKey, filterPreviewImage, @"inputAngle", [NSNumber numberWithFloat:0.86], @"inputWidth", [NSNumber numberWithFloat:18.34], @"inputSharpness", [NSNumber numberWithFloat:0.20], nil];
        CIFilter *warholOverlay = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:kCIInputBackgroundImageKey, filterPreviewImage, kCIInputImageKey, warholHalftone.outputImage, nil];
        CIFilter *warholGamma = [CIFilter filterWithName:@"CIGammaAdjust" keysAndValues:kCIInputImageKey, warholOverlay.outputImage, @"inputPower", [NSNumber numberWithFloat:0.45], nil];
        CIFilter *warhol = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, warholGamma.outputImage, @"inputSaturation", [NSNumber numberWithFloat:1.57], @"inputBrightness", [NSNumber numberWithFloat:0.05], nil];
        filter1 = warhol;
        // Pop
    } else if ([typeOfFilters isEqualToString:@"Modern"]) {
        // Urbana, Dream, Impress
    } else if ([typeOfFilters isEqualToString:@"Photography"]) {
        // Daguerrotype, Mark, Cyanotype, Silver
    } else if ([typeOfFilters isEqualToString:@"Prints"]) {
        // X-Hatch, Sketch
    }
    
    if(filterName2 == nil)
    {
        filterName2 = @"Hue";
        CIFilter *hueFilter = [CIFilter filterWithName:@"CIHueAdjust" keysAndValues:kCIInputImageKey, filterPreviewImage, nil];
        [hueFilter setValue:[NSNumber numberWithFloat:2.389] forKey:@"inputAngle"];
        filter2 = hueFilter;
    }
     
    
    filters = [[NSMutableArray alloc] init];
    
    NSLog(@" filters array is created");
    [filters addObjectsFromArray:[NSArray arrayWithObjects:
                                  [[FilterPreview alloc] initWithNameAndFilter:@"Camera" filter:nil],[[FilterPreview alloc] initWithNameAndFilter:@"Original" filter: nil],
                                  [[FilterPreview alloc] initWithNameAndFilter:filterName1 filter:filter1],
                                  [[FilterPreview alloc] initWithNameAndFilter:filterName2 filter:filter2]
                                  
                                  , nil]];
    
    NSLog(@"everything is in the filters array");
    
    [self createPreviewViewsForFilters];
}

-(void) createPreviewViewsForFilters
{
    //gap between each of the filter previews
    int offsetX = 15;
    
    for(int index = 0; index < [filters count]; index++)
    {
        //size of each filter view that has both the image preview and the text
        UIView *filterView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, 15, 60, 60)];
        
        filterView.tag = index;
        
        // create a label to display the name
        UILabel *filterNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, filterView.bounds.size.width, 8)];
        
        //position it below the image that will show. This occurs first because the image will be drawn on top of the existing label view
        filterNameLabel.center = CGPointMake(filterView.bounds.size.width/2, filterView.bounds.size.height + filterNameLabel.bounds.size.height);
        
        //Grabs the first filter in the Array "filters"
        FilterPreview *filter = (FilterPreview *) [filters objectAtIndex:index];
        
        //SPECIAL CONDITION FOR CAMERA ICON
        if([filter.name isEqualToString:@"Camera"])
        {
            NSLog(@"Starting Building Camera Preview Text");
            filterNameLabel.text =  filter.name;
            filterNameLabel.backgroundColor = [UIColor clearColor];
            filterNameLabel.textColor = [UIColor whiteColor];
            filterNameLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:10]; //I don't know why Emoji is used...
            filterNameLabel.textAlignment = NSTextAlignmentCenter;
            
            UIImageView *filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camerafiltericon@2x.png"]];
            
            [filterView setUserInteractionEnabled:YES];
            
            //Customize the UIImageView so it looks pretty
            filterPreviewImageView.layer.cornerRadius = 15;
            filterPreviewImageView.opaque = NO;
            filterPreviewImageView.backgroundColor = [UIColor clearColor];
            filterPreviewImageView.layer.masksToBounds = YES;
            filterPreviewImageView.frame = CGRectMake(0, 0, 60, 60);
            
            filterView.tag = index;
            
            [self applyGesturesToFilterPreviewImageView:filterView];
            
            //I swear this is like Inception at this point...
            [filterView addSubview:filterPreviewImageView];
            [filterView addSubview:filterNameLabel];
            
            //IT IS DONE.
            [self.filtersScrollView addSubview:filterView];            
        }else if([filter.name isEqualToString:@"Original"]){
            NSLog(@"Start Making Original image preview option");
            
            filterNameLabel.text =  filter.name;
            filterNameLabel.backgroundColor = [UIColor clearColor];
            filterNameLabel.textColor = [UIColor whiteColor];
            filterNameLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:10]; //I don't know why Emoji is used...
            filterNameLabel.textAlignment = NSTextAlignmentCenter;
            
            UIImageView *filterPreviewImageView = [[UIImageView alloc] initWithImage:originalImage];
            
            [filterView setUserInteractionEnabled:YES];
            
            //Customize the UIImageView so it looks pretty
            filterPreviewImageView.layer.cornerRadius = 15;
            filterPreviewImageView.opaque = NO;
            filterPreviewImageView.backgroundColor = [UIColor clearColor];
            filterPreviewImageView.layer.masksToBounds = YES;
            filterPreviewImageView.frame = CGRectMake(0, 0, 60, 60);
            
            filterView.tag = index;
            
            [self applyGesturesToFilterPreviewImageView:filterView];
            
            //I swear this is like Inception at this point...
            [filterView addSubview:filterPreviewImageView];
            [filterView addSubview:filterNameLabel];
            
            //IT IS DONE.
            [self.filtersScrollView addSubview:filterView];
        }
        else
        {
        
        //sets the information for the UILabel filterNameLabel that was made above
        filterNameLabel.text =  filter.name;
        filterNameLabel.backgroundColor = [UIColor clearColor];
        filterNameLabel.textColor = [UIColor whiteColor];
        filterNameLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:10]; //I don't know why Emoji is used...
        filterNameLabel.textAlignment = NSTextAlignmentCenter;
        
        
        //IMAGE PREVIEW TIME - first make a new outputImage based on the imagePicker's selection of outputImage stored in the filter array
        CIImage *outputImage = [filter.filter outputImage];
        
        //Here is where the outputImage is applied to the preview image coming in
        CGImageRef cgimg =[_context createCGImage:outputImage fromRect:[outputImage extent]];
 
        
        //This is pulled from the extensions and rotates cgimg which will now become smallImage so we are BACK to a UIImage class instead of a CIImage to a CGImageRef (aka the data).
        UIImage *smallImage =  [UIImage imageWithCGImage:cgimg];
        
            //if(originalImage.size.width < originalImage.size.height)
        {
            //DONT THINK THIS DOES ANYTHING GOOD
            //smallImage = [smallImage imageRotatedByDegrees:90];
        }
        
        // create filter preview image views
        UIImageView *filterPreviewImageView = [[UIImageView alloc] initWithImage:smallImage];
        
        [filterView setUserInteractionEnabled:YES];
        
        //Customize the UIImageView so it looks pretty
        filterPreviewImageView.layer.cornerRadius = 15;
        filterPreviewImageView.opaque = NO;
        filterPreviewImageView.backgroundColor = [UIColor clearColor];
        filterPreviewImageView.layer.masksToBounds = YES;
        filterPreviewImageView.frame = CGRectMake(0, 0, 60, 60);
        
        filterView.tag = index;
        
        [self applyGesturesToFilterPreviewImageView:filterView];
        
        //I swear this is like Inception at this point...
        [filterView addSubview:filterPreviewImageView];
        [filterView addSubview:filterNameLabel];
        
        //IT IS DONE.
        [self.filtersScrollView addSubview:filterView];
        }
        
        offsetX += filterView.bounds.size.width + 15;
        
    }
    
    
    //Set the background of the filter selection Scroll View
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"filterpanel@2x.png"] drawInRect:self.view.bounds];
    UIImage *filterBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.filtersScrollView setBackgroundColor:[UIColor colorWithPatternImage:filterBackground]];
    
    //change the background of the other imageview
    [self.background setImage:[UIImage imageNamed:@"edit@2x.png"]];

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
    
    //REOPEN CAMERA CONDITION
    if(filterIndex == 0)
    {
        [self initializeCameraUI];
        return;
    }else if( filterIndex == 1)
    {
        [self.imageView setImage:originalImage];
        return;
    }
    
    FilterPreview *filter = [filters objectAtIndex:filterIndex];
    
    CIImage *outputImage = [filter.filter outputImage];
    
    CGImageRef cgimg =
    [self.context createCGImage:outputImage fromRect:[outputImage extent]];
    
    finalImage = [UIImage imageWithCGImage:cgimg];

    if(originalImage.size.width < originalImage.size.height)
    {
        //Portrait Needs to be rotated
        NSLog(@"Rotated");
        finalImage = [finalImage imageRotatedByDegrees:90];
    }
    
    [self.imageView setImage:finalImage];
    
    CGImageRelease(cgimg);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if(_imageView.image != nil)
        {
            self.context =[CIContext contextWithOptions:nil];
            [self.view addSubview:self.filtersScrollView];
        }
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.context =[CIContext contextWithOptions:nil];        // Custom initialization
    self.title = @"Edit";
    self.filtersScrollView = _filterScrollView;
    
    firstTimeOpen = true;
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
  if(firstTimeOpen)
  {
    firstTimeOpen = false;
    [self initializeCameraUI];  
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goToGallery"])
    {
     
        CameraViewController *newView = [segue destinationViewController];
        
        
        if(_imageView.image != nil){
            //Sends the image taken with the filter to the Gallery for saving/sharing.
            UIImage *imageToSend = _imageView.image;
            newView.imageToBeSaved = imageToSend;
        }
        
    }
}


@end
