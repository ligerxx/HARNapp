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
#import "TitleViewController.h"

@implementation PagingScrollViewController

@synthesize moreInfoView, showMoreInfoHasBeenExpanded;

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
    showMoreInfoHasBeenExpanded = FALSE;
	currentPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	nextPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	[scrollView addSubview:currentPage.view];
	[scrollView addSubview:nextPage.view];
    
    //THIS!!!! HELPING WITH AUTOLAYOUT TRANSLATION PROBLEMS
    scrollView.translatesAutoresizingMaskIntoConstraints = YES;

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

-(void)viewDidAppear:(BOOL)animated
{
    //This function is used to keep the Now Featuring label for iPhone 5 screen sizes at the top after returning from a collection despite the AutoLayout constraints
    CGSize result = [[UIScreen mainScreen] bounds].size;
    TitleViewController *mainScreen = (TitleViewController*) self.parentViewController;
    
    if(result.height >= 568 && showMoreInfoHasBeenExpanded == TRUE )
    {
        //move Now Featuring Label
        CGRect frame = mainScreen.nowFeaturing.frame;
        frame.origin.y = 31;
        [mainScreen.nowFeaturing setFrame:frame];
    }
    
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
	if(showMoreInfoHasBeenExpanded == TRUE)
    {
        [self fadeOutMoreInfo];
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
        currentPage.moreInfo = nextPage.moreInfo;
		nextPage = swapController;
        nextPage.moreInfo = swapController.moreInfo;
	}
	if(showMoreInfoHasBeenExpanded == TRUE)
    {
        [self fadeInMoreInfo];
    }
	[currentPage updateTextViews:YES];
}

-(void)fadeOutMoreInfo
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.16];
    [UIView setAnimationDelegate:self];
    moreInfoView.alpha = 0.0;
    [UIView commitAnimations];
}
-(void)fadeInMoreInfo
{
    moreInfoView.text = currentPage.moreInfo;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.16];
    [UIView setAnimationDelegate:self];

    moreInfoView.alpha = 1.0;
    
    [UIView commitAnimations];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)newScrollView
{
	[self scrollViewDidEndScrollingAnimation:newScrollView];
	pageControl.currentPage = currentPage.pageIndex;
    if(showMoreInfoHasBeenExpanded == TRUE)
    {
        [self fadeInMoreInfo];
    }
}

- (IBAction)changePage:(id)sender
{
	NSInteger pageIndex = pageControl.currentPage;
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageIndex;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
    //[self fadeInMoreInfo];

}

- (IBAction)goToDetailView:(id)sender
{
    TitleViewController *mainScreen = (TitleViewController*) self.parentViewController;
    
  if(showMoreInfoHasBeenExpanded == FALSE)
  {

    moreInfoView = [[UITextView alloc] initWithFrame:CGRectMake(40,130,240,180)];
    moreInfoView.backgroundColor = [UIColor clearColor];
    moreInfoView.scrollEnabled = FALSE;
    moreInfoView.editable = FALSE;
    moreInfoView.text = currentPage.moreInfo;
    moreInfoView.textAlignment = 1;
    moreInfoView.textColor = [UIColor blackColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.16];
    [UIView setAnimationDelegate:self];
    
    //fadeout HARN logo
    mainScreen.harnLogo.alpha = 0.0;
    
   //fade out if 3.5" screen otherwise move it up
   CGSize result = [[UIScreen mainScreen] bounds].size;
   //CGRect scrollViewHeight = mainScreen.container.frame;
   CGRect keepPageControlerDown = pageControl.frame;
      
   if(result.height != 568)
   {
       mainScreen.nowFeaturing.alpha = 0.0;
   }else{      
    //move Now Featuring Label
       CGRect frame = mainScreen.nowFeaturing.frame;
       frame.origin.y = 31;
       [mainScreen.nowFeaturing setFrame:frame];
   }
      
      //move the Container
      scrollView.transform = CGAffineTransformTranslate(scrollView.transform, 0.0, -150.0);
    
    //add the more info
    [self.view addSubview:moreInfoView];
    
    [UIView commitAnimations];
    [pageControl setFrame: keepPageControlerDown];
    showMoreInfoHasBeenExpanded = TRUE;
  }else{
      
      CGContextRef context = UIGraphicsGetCurrentContext();
      [UIView beginAnimations:nil context:context];
      [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
      [UIView setAnimationDuration:0.16];
      [UIView setAnimationDelegate:self];
      
      //fadeout HARN logo
      mainScreen.harnLogo.alpha = 1.0;
      //fade out if 3.5" screen otherwise move it up
      CGSize result = [[UIScreen mainScreen] bounds].size;
      
      //CGRect containerFrame = mainScreen.container.frame;
      //CGRect scrollViewHeight = mainScreen.container.frame;
      CGRect keepPageControlerDown = pageControl.frame;
      
      if(result.height != 568)
      {
          mainScreen.nowFeaturing.alpha = 1.0;

      }else{
          //move Now Featuring Label
          
          CGRect frame = mainScreen.nowFeaturing.frame;
          frame.origin.y = 160;
          [mainScreen.nowFeaturing setFrame:frame];
          
          //move the Container
          /*scrollViewHeight.origin.y = +10;
          containerFrame.size.height = 359;
          [mainScreen.container setFrame:containerFrame];
          [scrollView setFrame:scrollViewHeight];*/
      }
      
      //Move the container
      scrollView.transform = CGAffineTransformIdentity;
      
      [self.moreInfoView removeFromSuperview];
      
      [UIView commitAnimations];
      
      [pageControl setFrame: keepPageControlerDown];
      showMoreInfoHasBeenExpanded = FALSE;
  }

}


@end
