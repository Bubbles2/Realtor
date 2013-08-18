//
//  AddOwnerVC.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Owner.h"
#import "Property.h"

// Set up protocol to allow delegation for this class
@class AddOwnerVC;
@protocol AddOwnerVCDelegate
- (void)theSaveButtonOnTheAddOwnerVCWasTapped:(AddOwnerVC *)controller;
@end

@interface AddOwnerVC : UIViewController

@property (nonatomic, weak) id <AddOwnerVCDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
// Screen properties
@property (weak, nonatomic) IBOutlet UITextField *ownerNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerAddressTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerPostCodeTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerTelephoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerEmailTxt;
@property (weak, nonatomic) IBOutlet UITextField *propertyAddress;
- (IBAction)hideKeyBoard:(id)sender;


- (IBAction)save:(id)sender;

@end
