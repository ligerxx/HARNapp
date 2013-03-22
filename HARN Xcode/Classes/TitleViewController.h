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

@property (weak, nonatomic) IBOutlet UIView *topLayer;
@property (strong, nonatomic) IBOutlet UINavigationBar *viewDeckController;
@property (nonatomic) CGFloat layerPosition;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *properties;

@property (nonatomic) NSString * selectedCell;

@end
