//
//  AddOwnerVC.m
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import "AddOwnerVC.h"

@interface AddOwnerVC ()

@end

@implementation AddOwnerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)hideKeyBoard:(id)sender {
    [self.ownerNameTxt resignFirstResponder];
    [self.ownerAddressTxt resignFirstResponder];
    [self.ownerEmailTxt resignFirstResponder];
    [self.propertyAddress resignFirstResponder];

    
}

- (IBAction)save:(id)sender
{
    // save owner details
    Owner *owner =[NSEntityDescription insertNewObjectForEntityForName:@"Owner" inManagedObjectContext:self.managedObjectContext];
    owner.name = self.ownerNameTxt.text;
    owner.address = self.ownerAddressTxt.text;
    owner.postCode = self.ownerPostCodeTxt.text;
    owner.telephone = self.ownerTelephoneTxt.text;
    owner.email = self.ownerEmailTxt.text;
    // Save propery details
    Property *property =[NSEntityDescription insertNewObjectForEntityForName:@"Property" inManagedObjectContext:self.managedObjectContext];
    property.propAddress = self.propertyAddress.text;
    // update owner for property
    [owner addPropertiesObject:property];
    //
    
    [self.managedObjectContext save:nil];  // write to database
    // In the implementation
    // Pass control to delegate
    NSLog(@"Telling the Class Delegate that Save was tapped on the AddOwnerVC");
    [self.delegate theSaveButtonOnTheAddOwnerVCWasTapped:self];
    
}


@end
