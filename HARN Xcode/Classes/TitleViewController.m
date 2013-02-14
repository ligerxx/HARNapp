//
//  TitleViewController.m
//  HARN
//
//  Created by Lauren Gray on 2/14/13.
//
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController
@synthesize topLayer = _topLayer;
@synthesize layerPosition = _layerPosition;

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
	// Do any additional setup after loading the view.
    self.layerPosition = self.topLayer.frame.origin.x;
}

#define VIEW_HIDDEN 260

- (void)animateLayerToPoint:(CGFloat)x {
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         CGRect frame = self.topLayer.frame;
                         frame.origin.x = x;
                         self.topLayer.frame = frame;
                     }
                     completion:^(BOOL finished){
                         self.layerPosition = self.topLayer.frame.origin.x;
                     }];
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan {
    // if we are performing this pan, do:
    if (pan.state == UIGestureRecognizerStateChanged) {
        // view we are looking at
        CGPoint point = [pan translationInView:self.topLayer];
        // new frame we are creating
        CGRect frame = self.topLayer.frame;
        // our frame should be located at 0 plus however much we are panning
        frame.origin.x = self.layerPosition + point.x;
        // check that we can't pan past the page
        if (frame.origin.x < 0) frame.origin.x = 0;
        // setting it equal
        self.topLayer.frame = frame;
    }
    // once we've lifted our finger, do:
    if (pan.state == UIGestureRecognizerStateEnded) {
        // if you let go before reaching the midpoint, snap back
        if (self.topLayer.frame.origin.x < 160) {
            [self animateLayerToPoint:0];
        } else {
            [self animateLayerToPoint:VIEW_HIDDEN];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTopLayer:nil];
    [super viewDidUnload];
}
@end
