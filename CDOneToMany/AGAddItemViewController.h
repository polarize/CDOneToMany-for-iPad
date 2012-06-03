//
//  AGAddItemViewController.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AGAddItemViewController;
@class AGSubItem;

@protocol AGAddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AGAddItemViewController *)controller;
- (void)addItemViewController:(AGAddItemViewController *)controller didAddSubItem:(AGSubItem *)masterItem;

@end


@interface AGAddItemViewController : UITableViewController


@property (nonatomic, weak) id <AGAddItemViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
