//
//  AGAddMasterItemViewController.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AGAddMasterItemViewController;
@class AGMasterItem;

@protocol AGAddMasterItemViewControllerDelegate <NSObject>

- (void)addMasterItemDetailsViewControllerDidCancel:(AGAddMasterItemViewController *)controller;
- (void)addMasterItemDetailsViewController:(AGAddMasterItemViewController *)controller didAddMasterItem:(AGMasterItem *)masterItem;

@end


@interface AGAddMasterItemViewController : UITableViewController

@property (nonatomic, weak) id <AGAddMasterItemViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;


@end
