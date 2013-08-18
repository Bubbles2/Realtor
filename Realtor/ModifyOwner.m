//
//  ModifyOwner.m
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import "ModifyOwner.h"
#import "Owner.h"
#import "Property.h"

@interface ModifyOwner ()
@property (weak, nonatomic) NSArray *prps;

@end

@implementation ModifyOwner

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.ownerNameTxt.text = self.selOwner.name;
    self.ownerAddressTxt.text = self.selOwner.address;
    self.ownerPostCodeTxt.text = self.selOwner.postCode;
    self.ownerTelephoneTxt.text = self.selOwner.telephone;
    self.ownerEmailTxt.text =self.selOwner.email;
  }

- (IBAction)save:(id)sender
{
    // Update use existing object
    self.selOwner.name = self.ownerNameTxt.text;
    self.selOwner.address = self.ownerAddressTxt.text;
    self.selOwner.postCode = self.ownerPostCodeTxt.text;
    self.selOwner.telephone = self.ownerTelephoneTxt.text;
    self.selOwner.email = self.ownerEmailTxt.text;
    
    [self.managedObjectContext save:nil];  // write to database
    // In the implementation
    // Pass control to delegate
    NSLog(@"Telling the Class Delegate that Save was tapped on the AddOwnerVC");
    [self.delegate theSaveButtonOnTheModifyOwnerVCWasTapped:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set up call to Add New Property
    if ([segue.identifier isEqualToString:@"addProperty"]) {
        NSLog(@"Setting up Delegate");
        AddProperty *addProperty = segue.destinationViewController;
        addProperty.delegate = self;
        addProperty.selOwner = self.selOwner;
        addProperty.managedObjectContext = self.managedObjectContext;
    }
    

}

- (void) theSaveButtonOnTheAddPropertyWasTapped:(AddProperty *)controller
{
    // do something here like refreshing the table or whatever
    NSLog(@"Save Button on add owner was pressed ");
    // close the delegated view
    [controller.navigationController popViewControllerAnimated:YES];
    
    
}
// Manage Tavle view of properties
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    // copy set to array
    self.prps =[self.selOwner.properties sortedArrayUsingDescriptors:nil];
    return self.selOwner.properties.count;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"propcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Property *prop = self.prps[indexPath.row];
    cell.textLabel.text = prop.propAddress;
    

    
    return cell;
}

@end
