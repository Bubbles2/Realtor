//
//  ModifyOwner.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Owner.h"
#import "AddProperty.h"

// Set up protocol to allow delegation for this class
@class ModifyOwner;
@protocol ModifyOwnerVCDelegate
- (void)theSaveButtonOnTheModifyOwnerVCWasTapped:(ModifyOwner *)controller;
@end
// The following code allows us to display a table view from an array and a normal controller
// we just have to declare the protocols in the header file and implement the metods
//
@interface ModifyOwner : UIViewController <UITableViewDataSource, UITableViewDelegate,AddPropertyDelegate>

//
@property (nonatomic, weak) id <ModifyOwnerVCDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Owner *selOwner;
// Screen properties
@property (weak, nonatomic) IBOutlet UITextField *ownerNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerAddressTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerPostCodeTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerTelephoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *ownerEmailTxt;
- (void) theSaveButtonOnTheAddPropertyWasTapped:(AddProperty *)controller;


@end
