//
//  InformationViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "InformationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface InformationViewController ()

@end

@implementation InformationViewController

@synthesize navBar;
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
    
    NSLog(@"%@", navBar.barTintColor);
    
    self.descriptionOfWork.clipsToBounds = YES;
    self.descriptionOfWork.layer.cornerRadius = 10.0f;
    
    // first load - if size too small, too big - reset.
    _fontSizeF = [[NSUserDefaults standardUserDefaults] floatForKey:@"Font Size"];
    if(_fontSizeF < 30 || _fontSizeF > 42) {
        [[NSUserDefaults standardUserDefaults] setFloat:30.0f forKey:@"Font Size"];
        _fontSizeF = [[NSUserDefaults standardUserDefaults] floatForKey:@"Font Size"];
    }
    _smallerFontSizeF = _fontSizeF-12;
    
    //Make sure the color of the bar buttons in the Nav Bar are the same as the collection they are currently in. iOS 7 style
    for( UIBarButtonItem * button in self.navBar.subviews)
    {
        button.tintColor = self.navBar.barTintColor;
    }
    
    [self updateDisplay];
    
    // write the size the font loaded at
    //NSLog(@"%f", _fontSizeF);
    //NSLog(@"%f", _smallerFontSizeF);
}

- (void)updateDisplay {
    //Color and size of text
    UIColor *_black=[UIColor blackColor];
    UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:_fontSizeF];
    UIFont *smallerFont=[UIFont fontWithName:@"Helvetica" size:_smallerFontSizeF];
    
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

-(IBAction)changeFontSize:(id)sender;
{
    // change the font size
    _fontSizeF = _fontSizeF+6;
    _smallerFontSizeF = _smallerFontSizeF+6;
    
    // if it's too big, go back round
    if (_fontSizeF > 42) {
        _fontSizeF = 30;
        _smallerFontSizeF = 18;
    }
    
    // always set user default
    [[NSUserDefaults standardUserDefaults] setFloat:_fontSizeF forKey:@"Font Size"];
    
    [self updateDisplay];
    
    // lemme know dat font size
    NSLog(@"%f", _fontSizeF);
    NSLog(@"%f", _smallerFontSizeF);
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