//
//  ArtCell.h
//  HARN
//
//  Created by Casey Feldman on 2/21/13.
//
//

#import <UIKit/UIKit.h>

@interface ArtCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *previewImage;
@property (strong, nonatomic) IBOutlet UILabel* title;
@property (strong, nonatomic) IBOutlet UILabel* description;

@end