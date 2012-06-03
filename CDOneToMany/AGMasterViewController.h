//
//  AGMasterViewController.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGDetailViewController;
@class AGDetailTableViewController;

#import <CoreData/CoreData.h>
#import "AGAddMasterItemViewController.h"


@interface AGMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, AGAddMasterItemViewControllerDelegate>

@property (strong, nonatomic) AGDetailViewController *detailViewController;
@property (strong, nonatomic) AGDetailTableViewController *detailTableViewController;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//Just to hold the Master Itemes 
@property (strong, nonatomic) NSMutableArray *masterItems;
@property (strong, nonatomic) NSMutableArray *subItems;
@end
