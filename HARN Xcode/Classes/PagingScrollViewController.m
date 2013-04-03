//
//  PagingScrollViewController.m
//  PagingScrollView
//
//  Created by Matt Gallagher on 24/01/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "PagingScrollViewController.h"
#import "PageViewController.h"
#import "DataSource.h"
#import "DetailViewController.h"

@implementation PagingScrollViewController

- (void)applyNewIndex:(NSInteger)newIndex pageController:(PageViewController *)pageController
{
	NSInteger pageCount = [[DataSource sharedDataSource] numDataPages];
	BOOL outOfBounds = newIndex >= pageCount || newIndex < 0;

	if (!outOfBounds)
	{
		CGRect pageFrame = pageController.view.frame;
		pageFrame.origin.y = 0;
		pageFrame.origin.x = scrollView.frame.size.width * newIndex;
		pageController.view.frame = pageFrame;
	}
	else
	{
		CGRect pageFrame = pageController.view.frame;
		pageFrame.origin.y = scrollView.frame.size.height;
		pageController.view.frame = pageFrame;
	}

	pageController.pageIndex = newIndex;
}

- (void)viewDidLoad
{
	currentPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	nextPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	[scrollView addSubview:currentPage.view];
	[scrollView addSubview:nextPage.view];

    /* This gesture is added to the scrollview if a user taps a work of art or its label and then goes to the method goToDetailView
     * which opens the segue "goToDetail" and presents the detail view of the featured work.
     */
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToDetailView:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [scrollView addGestureRecognizer:tapRecognizer];
    
	NSInteger widthCount = [[DataSource sharedDataSource] numDataPages];
	if (widthCount == 0)
	{
		widthCount = 1;
	}
	
    scrollView.contentSize =
		CGSizeMake(
			scrollView.frame.size.width * widthCount,
			scrollView.frame.size.height);
	scrollView.contentOffset = CGPointMake(0, 0);

	pageControl.numberOfPages = [[DataSource sharedDataSource] numDataPages];
	pageControl.currentPage = 0;
	
	[self applyNewIndex:0 pageController:currentPage];
	[self applyNewIndex:1 pageController:nextPage];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
	
	NSInteger lowerNumber = floor(fractionalPage);
	NSInteger upperNumber = lowerNumber + 1;
	
	if (lowerNumber == currentPage.pageIndex)
	{
		if (upperNumber != nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:nextPage];
		}
	}
	else if (upperNumber == currentPage.pageIndex)
	{
		if (lowerNumber != nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:nextPage];
		}
	}
	else
	{
		if (lowerNumber == nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:currentPage];
		}
		else if (upperNumber == nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:currentPage];
		}
		else
		{
			[self applyNewIndex:lowerNumber pageController:currentPage];
			[self applyNewIndex:upperNumber pageController:nextPage];
		}
	}
	
	[currentPage updateTextViews:NO];
	[nextPage updateTextViews:NO];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)newScrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
	NSInteger nearestNumber = lround(fractionalPage);

	if (currentPage.pageIndex != nearestNumber)
	{
		PageViewController *swapController = currentPage;
		currentPage = nextPage;
		nextPage = swapController;
	}

	[currentPage updateTextViews:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)newScrollView
{
	[self scrollViewDidEndScrollingAnimation:newScrollView];
	pageControl.currentPage = currentPage.pageIndex;
}

- (IBAction)changePage:(id)sender
{
	NSInteger pageIndex = pageControl.currentPage;

	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageIndex;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
}

- (IBAction)goToDetailView:(id)sender
{
 //NSLog(@"Button Touched");
    [self performSegueWithIdentifier:@"goToDetail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Creates the detailView that and begins adding everything for it to present to the users since this is templateted (sp?)
    DetailViewController *detailViewController = [segue destinationViewController];
    
    //This will have to be the changed to the image stored in the CoreData
    
    UIImage *imageToSend = currentPage.theImage;
    
    
    //ALL OF THESE MUST BE UPDATED TO THE ACTUAL INFORMATION VIA COREDATA
    detailViewController.theImage = imageToSend;
    [detailViewController setArtTitle:@"A Title from the main screen"];
    [detailViewController setArtDescription:@"The most featured work in all the land!"];
}


@end
