//
//  AGMasterViewController.m
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AGMasterViewController.h"

#import "AGDetailViewController.h"

#import "AGMasterItem.h"
#import "AGSubItem.h"
#import "AGDetailTableViewController.h"

@interface AGMasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation AGMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize detailTableViewController = _detailTableViewController;
@synthesize masterItems = _masterItems;
@synthesize subItems = _subItems;


- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

        //self.detailViewController = (AGDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.detailTableViewController = (AGDetailTableViewController *)[[self.splitViewController.viewControllers lastObject]topViewController];
    [self.detailTableViewController.tableView reloadData];
    
    AGSubItem *subItem1 = [[AGSubItem alloc]initSubItemWithName:@"sub1" itemDescription:@"this is sub1"];
    AGSubItem *subItem2 = [[AGSubItem alloc]initSubItemWithName:@"sub2" itemDescription:@"this is sub2"];
    AGSubItem *subItem3 = [[AGSubItem alloc]initSubItemWithName:@"sub3" itemDescription:@"this is sub3"];
    self.subItems = [NSMutableArray arrayWithObjects:subItem1,subItem2, nil];
    //AGMasterItem *masterItem = [AGMasterItem addMasterItemes];
    self.masterItems = [NSMutableArray arrayWithCapacity:20];
    AGMasterItem *m1 = [[AGMasterItem alloc]initMasterItemWithName:@"Master 1" itemDescription:@"Disc1" subItems:self.subItems];
    self.subItems = [NSMutableArray arrayWithObjects:subItem1,subItem2,subItem3, nil];
    AGMasterItem *m2 = [[AGMasterItem alloc]initMasterItemWithName:@"Master 2" itemDescription:@"Disc2" subItems:self.subItems];
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:m1, m2, nil];
   
    self.masterItems = array;
  
    
   
   // self.mastername = m1.itemDescription;
   // self.masterItems = [NSMutableArray ];
    //NSLog(@"master m1:%a, m2:%a", self.masterItem.name, m2.name);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)insertNewObject:(id)sender
{
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
         // Replace this implementation with code to handle the error appropriately.
         // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Prepare Fore Seguway
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddMasterItem"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		
        AGAddMasterItemViewController *masterItemVC = [[navigationController viewControllers] objectAtIndex:0];

        masterItemVC.delegate = self;
       
		
	}
}
#pragma mark - Table View
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Don't allow selections in the bottom section
    /*
    if (indexPath.section == 1) {
        return nil;
    }
    */
    return indexPath;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 200)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    
    /*
    if (section == 0) {
        label.text = @"Master Items";
    } else if (section == 1) {
        label.text = @"Subitems";
    }
    */
    label.text = @"Master Items";
    return label;
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return [[self.fetchedResultsController sections] count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    //return [sectionInfo numberOfObjects];
    
    /*
    if (section == 0) {
        return [self.masterItems count];
    } 
    
    else {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath) {
            AGMasterItem *master = [self.masterItems objectAtIndex:indexPath.row]; 
            return [master.subItem count];
            //return [[self.subItems objectAtIndex:indexPath.row] count];
            
            //return [self.subItems count];
            //return 3;

        }
            }
    return 0;
    */
    return [self.masterItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterItemCell"];
    
     
    /*
    if (indexPath.section == 0) {
        AGMasterItem *master = [self.masterItems objectAtIndex:indexPath.row];
        cell.textLabel.text = master.name;
    }if (indexPath.section == 1)
    {
        //AGMasterItem *master = [self.masterItems objectAtIndex:indexPath.row];
        //NSLog(@"%d", indexPath.row);
        //cell.textLabel.text = [master.subItem objectAtIndex:0];
        cell.textLabel.text = [self.subItems objectAtIndex:indexPath.row];
        
    }
    
   */
    AGMasterItem *master = [self.masterItems objectAtIndex:indexPath.row];
    cell.textLabel.text = master.name;
    cell.detailTextLabel.text = master.itemDescription;
     return cell;
     
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    //self.detailViewController.detailItem = object;
     [self.tableView reloadData];  
    
    
    AGMasterItem *master = [self.masterItems objectAtIndex:indexPath.row];
    
    self.detailTableViewController.subItems = master.subItems;
    self.detailTableViewController.title = master.name;
    [self.detailTableViewController.tableView reloadData];
}
#pragma mark - AGMasterItemViewControllerDelegate
-(void) addMasterItemDetailsViewControllerDidCancel:(AGAddMasterItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addMasterItemDetailsViewController:(AGAddMasterItemViewController *)controller didAddMasterItem:(AGMasterItem *)masterItem
{
    AGMasterItem *master = [[AGMasterItem alloc]init ];
    masterItem = master;
    [self.masterItems addObject:masterItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.masterItems count]-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (__fetchedResultsController != nil) {
        return __fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return __fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"timeStamp"] description];
}



@end
