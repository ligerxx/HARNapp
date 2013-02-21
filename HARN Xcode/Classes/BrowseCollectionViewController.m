//
//  BrowseCollectionViewController.m
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import "BrowseCollectionViewController.h"

@interface BrowseCollectionViewController ()

@end

@implementation BrowseCollectionViewController

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
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setTintColor:[UIColor greenColor]];
    
    self.title = @"Asian";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
