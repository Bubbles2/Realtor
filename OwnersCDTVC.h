//
//  OwnersCDTVC.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "AddOwnerVC.h"
#import "ModifyOwner.h"

@interface OwnersCDTVC : CoreDataTableViewController <AddOwnerVCDelegate,ModifyOwnerVCDelegate> 

// Handle to Data Base

@property (nonatomic, strong) NSManagedObjectContext  *managedObjectContext;
- (void)theSaveButtonOnTheAddOwnerVCWasTapped:(AddOwnerVC *)controller;
- (void)theSaveButtonOnTheModifyOwnerVCWasTapped:(ModifyOwner *)controller;



@end
