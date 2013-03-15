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

// @3/1/13 - Make this a preference
NSInteger currentSize = 0;

@implementation InformationViewController

-(IBAction)donePressed:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)changeFontSize:(id)sender;
{
 
    UIColor *_black=[UIColor blackColor];   
    
    if(currentSize == 0)        //LARGE SIZE
    {
        NSString *titleOfArt = [NSString stringWithFormat:@"%@\n", _artTitle];
        NSMutableAttributedString *attTitle=[[NSMutableAttributedString alloc] initWithString:titleOfArt];
        NSInteger _stringLength=[titleOfArt length];
        UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:36.0f];
        [attTitle addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
        [attTitle addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, _stringLength)];
        
        NSMutableAttributedString *descriptionOfArt = [[NSMutableAttributedString alloc] initWithString:_artDescription];
        UIFont *smallerFont =[UIFont fontWithName:@"Helvetica" size:24.0f];
        [descriptionOfArt addAttribute:NSFontAttributeName value:smallerFont range:NSMakeRange(0, [_artDescription length])];
        [descriptionOfArt addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, [_artDescription length])];
        
        [attTitle appendAttributedString:descriptionOfArt];
        
        [_descriptionOfWork setAttributedText: attTitle];
        
        currentSize++;
    }else if(currentSize == 1)      //LARGEST SIZE
    {
        NSString *titleOfArt = [NSString stringWithFormat:@"%@\n", _artTitle];
        
        NSMutableAttributedString *attTitle=[[NSMutableAttributedString alloc] initWithString:titleOfArt];
        NSInteger _stringLength=[titleOfArt length];
        UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:42.0f];
        [attTitle addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
        [attTitle addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, _stringLength)];
        
        NSMutableAttributedString *descriptionOfArt = [[NSMutableAttributedString alloc] initWithString:_artDescription];
        UIFont *smallerFont =[UIFont fontWithName:@"Helvetica" size:30.0f];
        [descriptionOfArt addAttribute:NSFontAttributeName value:smallerFont range:NSMakeRange(0, [_artDescription length])];
        [descriptionOfArt addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, [_artDescription length])];
        
        [attTitle appendAttributedString:descriptionOfArt];
        
        [_descriptionOfWork setAttributedText: attTitle];
        
        currentSize++;
    }else                           //ORIGINAL SIZE
    {
        NSString *titleOfArt = [NSString stringWithFormat:@"%@\n", _artTitle];
        
        NSMutableAttributedString *attTitle=[[NSMutableAttributedString alloc] initWithString:titleOfArt];
        NSInteger _stringLength=[titleOfArt length];
        UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:30.0f];
        [attTitle addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
        [attTitle addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, _stringLength)];
        
        NSMutableAttributedString *descriptionOfArt = [[NSMutableAttributedString alloc] initWithString:_artDescription];
        UIFont *smallerFont =[UIFont fontWithName:@"Helvetica" size:18.0f];
        [descriptionOfArt addAttribute:NSFontAttributeName value:smallerFont range:NSMakeRange(0, [_artDescription length])];
        [descriptionOfArt addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, [_artDescription length])];
        
        [attTitle appendAttributedString:descriptionOfArt];
        
        [_descriptionOfWork setAttributedText: attTitle];
        
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
    
    //Color and size of text
    UIColor *_black=[UIColor blackColor];
    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:30.0f];
    UIFont *smallerFont =[UIFont fontWithName:@"Helvetica" size:18.0f];
    
    //Start by making a normal String with a line break that is equal to the title of the work of art
    NSString *titleOfArt = [NSString stringWithFormat:@"%@\n", _artTitle];
    
    //Format it the way we want (bold text that will be larger than the description).
    //This NSMutableAttributedString will eventually be the main one we add stuff too.
    NSMutableAttributedString *attTitle=[[NSMutableAttributedString alloc] initWithString:titleOfArt];    
    NSInteger _stringLength=[titleOfArt length];
    [attTitle addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)]; //for the length of the title make it big, bold, and beautiful
    [attTitle addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, _stringLength)]; //now PAINT IT, PAINT IT, PAINT IT, PAINT IT BLACK!
    
    //Similar to the section above but we make it the smaller font
    NSMutableAttributedString *descriptionOfArt = [[NSMutableAttributedString alloc] initWithString:_artDescription];
    [descriptionOfArt addAttribute:NSFontAttributeName value:smallerFont range:NSMakeRange(0, [_artDescription length])];
    [descriptionOfArt addAttribute:NSForegroundColorAttributeName value:_black range:NSMakeRange(0, [_artDescription length])];
    
    //Merge the two different attributed strings into one string (the attTitle string)
    [attTitle appendAttributedString:descriptionOfArt];
    
    //Add the one big string with different styles to the textview
    [_descriptionOfWork setAttributedText: attTitle];
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
