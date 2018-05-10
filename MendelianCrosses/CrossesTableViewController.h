//
//  CrossesTableViewController.h
//  MendelianCrosses
//
//  Created by Jing Wei Li on 5/9/18.
//  Copyright © 2018 Jing Wei Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MendelianCrossesModel.h"

@interface CrossesTableViewController : UITableViewController

@property (strong, nonatomic) MendelianCrossesModel *crosses;

@end
