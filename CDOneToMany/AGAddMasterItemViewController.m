//
//  AGAddMasterItemViewController.m
//  CDOneToMany
//
//  Created by Issam Bendaas on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AGAddMasterItemViewController.h"
#import "AGMasterItem.h"

@interface AGAddMasterItemViewController ()

@end

@implementation AGAddMasterItemViewController

@synthesize delegate;
@synthesize titleTextField;
@synthesize descriptionTextField;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
   
    [super viewDidUnload];
    [self setTitleTextField:nil];
    [self setDescriptionTextField:nil];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
- (IBAction)cancel:(id)sender {
    
    [self.delegate addMasterItemDetailsViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender {
    AGMasterItem *masterItem = [[AGMasterItem alloc]init];
    masterItem.name = self.titleTextField.text;
    masterItem.itemDescription = self.descriptionTextField.text;
    
    [self.delegate addMasterItemDetailsViewController:self didAddMasterItem:masterItem];
    
}
@end
