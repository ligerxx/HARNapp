//
//  CollectionHeaderView.h
//  HARN
//
//  Created by Casey Feldman on 4/19/13.
//
//

#import <UIKit/UIKit.h>

@interface CollectionHeaderView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *headerBackground;
@property (weak, nonatomic) IBOutlet UITextView *headerText;

@end
