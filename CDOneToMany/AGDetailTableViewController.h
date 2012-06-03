//
//  AGDetailTableViewController.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGAddItemViewController.h"

@interface AGDetailTableViewController : UITableViewController <UISplitViewControllerDelegate,AGAddItemViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *subItems;

@end
