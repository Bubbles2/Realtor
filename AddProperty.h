//
//  AddProperty.h
//  Realtor
//
//  Created by Donncha Finlay on 07/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Owner.h"


// Set up protocol to allow delegation for this class
@class AddProperty;
@protocol AddPropertyDelegate
- (void)theSaveButtonOnTheAddPropertyWasTapped:(AddProperty *)controller;
@end


@interface AddProperty : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <AddPropertyDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Owner *selOwner;
@property (weak, nonatomic) IBOutlet UITextField *propAddressTxt;
@property (weak, nonatomic) IBOutlet UIButton *propertyTypeBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *propertyTypePicker;
@property (weak,nonatomic) NSMutableArray *ptArray;


- (IBAction)save:(id)sender;
- (IBAction)showHidePropertyPickerContainer:(UIButton *)sender;



@end
