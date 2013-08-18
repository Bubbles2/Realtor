//
//  OwnersCDTVC.m
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import "OwnersCDTVC.h"
#import "Owner.h"
#import "ModifyOwner.h"

@interface OwnersCDTVC ()

@end

@implementation OwnersCDTVC
///***********************************************
// Step to use snippet
// 1. Go to storyboard and create a table view controller
// 2. Create Data model (Need to remember Enity Name and cell identifier)
// 3. Import Core Data Framework
// 4. Create class to inherit from Core Data Table view Controller
// 5. ** Be careful with the Document Name (You can use Project Name) **
// 6. ** Only change entity names and attributes **
//
// Import Code snippet
///***********************************************

//=======================================================
// The following code will create a document and hence
// a managed object context
// It will set up a fetch request and fetched results controller  to be used by the
// super class
// and set up cell data to be displayed
//=======================================================
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Get a document and ==> the managed object context
    if (!self.managedObjectContext)[self useDemoDocument];
    
}

- (void) useDemoDocument
{
    
    // This section of code will create a document which will be used
    // to provide the managed object context
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    url =[url URLByAppendingPathComponent:@"Realtor"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    // If document does not exist
    if (![[NSFileManager defaultManager]fileExistsAtPath:[url path]]) {
        // create document
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating
         // Document will be created in another thread
          completionHandler:^(BOOL success) {
              if (success) {
                  self.managedObjectContext = document.managedObjectContext;
                  //                [self refresh];
              }
          }];
    }
    else if (document.documentState == UIDocumentStateClosed)
    {
        
        // Open it
        [document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                self.managedObjectContext = document.managedObjectContext;
                
            }
        }];
    }
    else
    {
        // try to use it
        // this code will call the setter (self.managedObjectContext) for the managed object context which will also create the
        // create a fetch request and set the fetched results controller used to display the table data.
        self.managedObjectContext = document.managedObjectContext;
        
    }
    
    
}
-(void) setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if (managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Owner"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil; // all Jobs
        // Must be sorted in order of Sections (if we have any) , if we use cache we can not modify request
        // Update the Fetched results controller for the stanford Core Data Table
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    }
    else
    {
        self.fetchedResultsController = nil ;
        
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ownercell"];
    
    Owner *owner = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = owner.name;
    cell.detailTextLabel.text = owner.address;
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set up call to Add New Owner
    if ([segue.identifier isEqualToString:@"Add Owner"]) {
        NSLog(@"Setting up Delegate");
        AddOwnerVC *addOwnerVC = segue.destinationViewController;
        addOwnerVC.delegate = self;
        addOwnerVC.managedObjectContext = self.managedObjectContext;
    }
    // Set up call to Modify Owner
    if ([segue.identifier isEqualToString:@"modify Owner"]) {
        //
        ModifyOwner *modifyOwner = segue.destinationViewController;
        modifyOwner.managedObjectContext = self.managedObjectContext;
        modifyOwner.delegate = self;
        //
        // get selected Owner 
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Owner *selectedOwner  = [self.fetchedResultsController objectAtIndexPath:indexPath];
        modifyOwner.selOwner = selectedOwner;
             
        
     }
}

- (void)theSaveButtonOnTheAddOwnerVCWasTapped:(AddOwnerVC *)controller
{
    // do something here like refreshing the table or whatever
    NSLog(@"Save Button on add owner was pressed ");
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
    
}

- (void)theSaveButtonOnTheModifyOwnerVCWasTapped:(ModifyOwner *)controller
{
    // do something here like refreshing the table or whatever
    NSLog(@"Save Button on modify owner was pressed ");
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
    
}

@end
