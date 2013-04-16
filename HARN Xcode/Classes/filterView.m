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

@synthesize typeOfFilters, save;

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
    
    save.enabled = YES;
    _retake.hidden = YES;
    
    //If you do not dismiss the model view controller as done below then you will be stuck at the camera screen.
    [self dismissViewControllerAnimated:YES completion:nil];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    if(result.height != 568)
    {
        self.filtersScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 315, 320, 100)];
    }else{
        self.filtersScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 405, 320, 100)];
    }
    
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
    
    save.enabled = NO;
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
        // OASIS
        filterName2 = @"Oasis";
        //CIFilter *oasisFalseColor = [CIFilter filterWithName:@"CIFalseColor" keysAndValues: @"inputImage", filterPreviewImage, @"inputColor0", [CIColor colorWithRed:94/255. green:38/255. blue:18/255.], @"inputColor1", [CIColor colorWithRed:250/255. green:240/255. blue:230/255.], nil];
        /* CIFilter *oasisRadialGradient = [CIFilter filterWithName:@"CIRadialGradient" keysAndValues:
         @"inputCenter", [CIVector vectorWithX:500.f Y:500.f],
         @"inputRadius0", [NSNumber numberWithFloat:100.0f],
         @"inputRadius1", [NSNumber numberWithFloat:500.0f],
         @"inputColor0", [CIColor colorWithRed:0/255. green:0/255. blue:238/255.],
         @"inputColor1", [CIColor colorWithRed:0/255. green:238/255. blue:0/255.],
         nil]; */
        UIImage *oasisPic = [UIImage imageNamed:@"blue-green.png"];
        oasisPic = [self resizeTexture:oasisPic width:width height:height];
        CIImage *oasisTexture = [[CIImage alloc] initWithImage:oasisPic];
        CIFilter *oasisBlend = [CIFilter filterWithName:@"CILightenBlendMode" keysAndValues: @"inputImage", filterPreviewImage, @"inputBackgroundImage", oasisTexture, nil];
        CIFilter *oasisGamma = [CIFilter filterWithName:@"CIGammaAdjust" keysAndValues:@"inputImage", oasisBlend.outputImage, @"inputPower", [NSNumber numberWithFloat:.95], nil];
        CIFilter *oasis = [CIFilter filterWithName:@"CIColorControls" keysAndValues:@"inputImage", oasisGamma.outputImage, @"inputSaturation", [NSNumber numberWithFloat:1.57], @"inputBrightness", [NSNumber numberWithFloat:-.05], @"inputContrast", [NSNumber numberWithFloat:1.15], nil];
        filter2 = oasis;
    } else if ([typeOfFilters isEqualToString:@"Ancient American"]) {
        // Nasca
        filterName1 = @"Nasca";
        UIImage *nascaPic = [UIImage imageNamed:@"nasca.png"];
        nascaPic = [self resizeTexture:nascaPic width:width height:height];
        CIImage *nascaTexture = [[CIImage alloc] initWithImage:nascaPic];
        CIFilter *nascaFalse = [CIFilter filterWithName:@"CIFalseColor" keysAndValues:@"inputImage", filterPreviewImage, nil];
        CIFilter *nasca = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:kCIInputBackgroundImageKey, nascaTexture, kCIInputImageKey, nascaFalse.outputImage, nil];
        filter1 = nasca;
        // KUZCO
        filterName2 = @"Kuzco";
        CIFilter *posterize = [CIFilter filterWithName:@"CIColorPosterize" keysAndValues:@"inputImage", filterPreviewImage, @"inputLevels", [NSNumber numberWithFloat:10.20f], nil];
        CIFilter *blackWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, posterize.outputImage, @"inputSaturation", [NSNumber numberWithFloat:0.0], nil];
        CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor" keysAndValues:@"inputImage", blackWhite.outputImage, @"inputColor0", [CIColor colorWithRed:255/255. green:0/255. blue:0/255.], @"inputColor1", [CIColor colorWithRed:255/255. green:255/255. blue:100/255.], nil];
        CIFilter *kuzco = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:@"inputImage", falseColor.outputImage, @"inputBackgroundImage", filterPreviewImage, nil];
        filter2 = kuzco;
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
        // POP
        filterName2 = @"Pop";
        CIFilter *hueFilter = [CIFilter filterWithName:@"CIHueAdjust" keysAndValues:kCIInputImageKey, filterPreviewImage, nil];
        float low_bound = -3.14;
        float high_bound = 3.14;
        float rndValue = (((float)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
        [hueFilter setValue:[NSNumber numberWithFloat:rndValue] forKey:@"inputAngle"];
        filter2 = hueFilter;
    } else if ([typeOfFilters isEqualToString:@"Modern"]) {
        // IMPRESS
        filterName1 = @"Impress";
        CIFilter *posterize = [CIFilter filterWithName:@"CIColorPosterize" keysAndValues:@"inputImage", filterPreviewImage, @"inputLevels", [NSNumber numberWithFloat:12.9f], nil];
        CIFilter *impressGamma = [CIFilter filterWithName:@"CIHighlightShadowAdjust" keysAndValues:kCIInputImageKey, posterize.outputImage, @"inputRadius", [NSNumber numberWithFloat:4.25], @"inputShadowAmount", [NSNumber numberWithFloat:1.00], @"inputHighlightAmount", [NSNumber numberWithFloat:1.00], nil];
        CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:@"inputImage", impressGamma.outputImage, @"inputRadius",[NSNumber numberWithFloat:2.66], nil];
        CIFilter *impress = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:@"inputImage", blur.outputImage, @"inputBackgroundImage", filterPreviewImage, nil];
        filter1 = impress;
        
        // DREAM
        filterName2 = @"Dream";
        CIFilter *bloom = [CIFilter filterWithName:@"CIBloom" keysAndValues:@"inputImage", filterPreviewImage, @"inputRadius", [NSNumber numberWithFloat:7.26], @"inputIntensity", [NSNumber numberWithFloat:1.0], nil];
        CIFilter *dream = [CIFilter filterWithName:@"CIColorControls" keysAndValues: @"inputImage", bloom.outputImage, @"inputSaturation", [NSNumber numberWithFloat:1.26], nil];
        filter2 = dream;
        
    } else if ([typeOfFilters isEqualToString:@"Photography"]) {
        // Silver
        filterName1 = @"Silver";
        UIImage *dustPic = [UIImage imageNamed:@"dust.png"];
        dustPic = [self resizeTexture:dustPic width:width height:height];
        CIImage *dustTexture = [[CIImage alloc] initWithImage:dustPic];
        
        CIFilter *daguerroColor = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:@"inputImage", filterPreviewImage, @"inputColor", [CIColor colorWithRed:.85 green:0.85 blue:0.85], nil];
        CIFilter *composite = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:@"inputImage", dustTexture, @"inputBackgroundImage", daguerroColor.outputImage, nil];
        CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
        [vignette setValue:composite.outputImage forKey:kCIInputImageKey];
        [vignette setValue:[NSNumber numberWithFloat:0.99f] forKey:@"inputIntensity"];
        [vignette setValue:[NSNumber numberWithFloat:2.0f] forKey:@"inputRadius"];
        filter1 = vignette;
        
        //Cyan
        filterName2 = @"Cyan";
        CIFilter *cyanColor = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:@"inputImage", filterPreviewImage, @"inputColor", [CIColor colorWithRed:0.0 green:0.682 blue:0.937], nil];
        CIFilter *cyanEV = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:@"inputImage", dustTexture, @"inputEV", [NSNumber numberWithFloat:0.8], nil];
        CIFilter *cyanComposite = [CIFilter filterWithName:@"CIOverlayBlendMode" keysAndValues:@"inputImage", cyanEV.outputImage, @"inputBackgroundImage", cyanColor.outputImage, nil];
        filter2 = cyanComposite;
        
    } else if ([typeOfFilters isEqualToString:@"Prints and Drawings Bef..."]) {
        // X-Hatch
        filterName1 = @"X-Hatch";
        CIFilter *xhatchScreen = [CIFilter filterWithName:@"CIHatchedScreen" keysAndValues:@"inputImage", filterPreviewImage, @"inputAngle", [NSNumber numberWithFloat:0.64], @"inputWidth", [NSNumber numberWithFloat: 40.97], @"inputSharpness", [NSNumber numberWithFloat: 0.09], nil];
        filter1 = xhatchScreen;
        
        //Sketch
        filterName2 = @"Char";
        CIFilter *sketchEV = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:@"inputImage", filterPreviewImage, @"inputEV", [NSNumber numberWithFloat:1.8], nil];
        CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:@"inputImage", sketchEV.outputImage, @"inputRadius",[NSNumber numberWithFloat:1.66], nil];
        CIFilter *sketch = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:@"inputImage", blur.outputImage, @"inputColor", [CIColor colorWithRed:.85 green:0.85 blue:0.85], nil];
        filter2 = sketch;
    }
    
    if(filterName2 == nil)
    {
        filterName2 = @"Hue";
        CIFilter *hueFilter = [CIFilter filterWithName:@"CIHueAdjust" keysAndValues:kCIInputImageKey, filterPreviewImage, nil];
        [hueFilter setValue:[NSNumber numberWithFloat:2.389] forKey:@"inputAngle"];
        filter2 = hueFilter;
    }
     
    
    filters = [[NSMutableArray alloc] init];
    
    //NSLog(@" filters array is created");
    [filters addObjectsFromArray:[NSArray arrayWithObjects:
                                  [[FilterPreview alloc] initWithNameAndFilter:@"Camera" filter:nil],[[FilterPreview alloc] initWithNameAndFilter:@"Original" filter: nil],
                                  [[FilterPreview alloc] initWithNameAndFilter:filterName1 filter:filter1],
                                  [[FilterPreview alloc] initWithNameAndFilter:filterName2 filter:filter2]
                                  
                                  , nil]];
    
    //NSLog(@"everything is in the filters array");
    
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
            
            UIImageView *filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original.png"]];
            
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
 
        UIImageView *filterPreviewImageView;
            
            
        //PREVIEW IMAGES ARE MADE HERE FROM STOCK IMAGES
        if([filter.name isEqualToString:@"Sahara"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sahara-preview.png"]];
        }else if ([filter.name isEqualToString:@"Oasis"])
        {
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"oasis-preview.png"]];
        }else if ([filter.name isEqualToString:@"Nasca"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nasca-preview.png"]];
        }else if ([filter.name isEqualToString:@"Kuzco"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kuzco-preview.png"]];            
        }else if ([filter.name isEqualToString:@"Zen"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zen-preview.png"]];            
        }else if ([filter.name isEqualToString:@"Jade"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jade-preview.png"]];            
        }else if ([filter.name isEqualToString:@"Warhol"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"warhol-preview.png"]];
        }else if ([filter.name isEqualToString:@"Pop"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pop-preview.png"]];            
        }else if ([filter.name isEqualToString:@"Silver"])
        {
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"silver-preview.png"]];
        }else if ([filter.name isEqualToString:@"Cyan"])
        {
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cyan-preview.png"]];            
        }else if ([filter.name isEqualToString:@"Impress"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"impress-preview.png"]];
        }else if ([filter.name isEqualToString:@"Dream"])
        {
           filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dream-preview.png"]];            
        }else if ([filter.name isEqualToString:@"X-Hatch"])
        {
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xhatch-preview.png"]];
        }else if ([filter.name isEqualToString:@"Char"])
        {
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"char-preview.png"]];
        }else
        {
            // create filter preview image views
            filterPreviewImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original.png"]];
        }
        
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
    save.enabled = NO;
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
