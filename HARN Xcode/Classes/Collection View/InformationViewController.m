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

// @3/1/13 - Make this a preference
//NSInteger currentSize = 0;

@implementation InformationViewController

@synthesize artTitle = _artTitle;
@synthesize artDescription = _artDescription;


-(IBAction)donePressed:(id)sender;
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    // property list
    NSString *preferencesFile = [[NSBundle mainBundle] pathForResource:@"Preferences" ofType:@"plist"];
    _preferences = [[NSDictionary alloc] initWithContentsOfFile:preferencesFile];
    _fontSize = [_preferences objectForKey:@"typeSize"];
    _smallerFontSize = [_preferences objectForKey:@"smallerTypeSize"];
    [self updateDisplay];
}

- (void)updateDisplay {
    //Color and size of text
    UIColor *_black=[UIColor blackColor];
    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:[_fontSize floatValue]];
    UIFont *smallerFont =[UIFont fontWithName:@"Helvetica" size:[_smallerFontSize floatValue]];
    
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

//******************************************************************************************************************//
// not getting saved to my plist permanently, because i'm writing to the instance only.
// in order to save, must create a copy of my plist - read only.
// look into using NSUserDefaults instead. horrible.
-(IBAction)changeFontSize:(id)sender;
{
    _fontSize = [NSNumber numberWithInt:[_fontSize intValue]+6];
    _smallerFontSize = [NSNumber numberWithInt:[_smallerFontSize intValue]+6];
    
    if ([_fontSize intValue] > 42) {
        _fontSize = [NSNumber numberWithInt:30];
        _smallerFontSize = [NSNumber numberWithInt:18];
    }
    
    [self updateDisplay];
    
    NSLog(@"%@", _fontSize);
    NSLog(@"%@", _smallerFontSize);
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