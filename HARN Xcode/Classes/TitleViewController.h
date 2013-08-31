//
//  TitleViewController.h
//  HARN
//
//  Created by Lauren Gray on 2/14/13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TitleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UILabel *nowFeaturing;

}

@property (weak, nonatomic) IBOutlet UIView *topLayer;
@property (strong, nonatomic) IBOutlet UINavigationBar *viewDeckController;
@property (nonatomic) CGFloat layerPosition;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) IBOutlet UIImageView *harnLogo;
@property (nonatomic) IBOutlet UILabel *nowFeaturing;
@property (nonatomic) IBOutlet UIButton *slider;
@property (nonatomic) IBOutlet UIView *container;

@property (nonatomic, strong) NSMutableArray *properties;

@property (nonatomic) NSString * selectedCell;

@property (assign) BOOL bottomLayerHidden;

@end
