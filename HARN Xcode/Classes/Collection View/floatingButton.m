//
//  floatingButton.m
//  HARN
//
//  Created by Casey Feldman on 2/22/13.
//
//

#import "floatingButton.h"

@implementation floatingButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage* img = [UIImage imageNamed:@"circleCamera.png"];
    	[self setBackgroundImage:img forState:UIControlStateNormal];
    	self.adjustsImageWhenHighlighted = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
