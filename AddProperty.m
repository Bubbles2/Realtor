//
//  AddProperty.m
//  Realtor
//
//  Created by Donncha Finlay on 07/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import "AddProperty.h"
#import "Property.h"
#import "NSManagedObjectContext+FastFetch.h"
#import "PropertyType.h"

@interface AddProperty ()

@end

@implementation AddProperty

- (NSMutableArray *)ptArray
{
    // Lazy instantiate in getter
    if(!_ptArray) _ptArray= [[NSMutableArray alloc ]initWithCapacity:10];
    return _ptArray;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getPropertyTypes];

	// Do any additional setup after loading the view.
    
}
- (void)getPropertyTypes
{
    
    NSSet *pts = [[self managedObjectContext] fetchObjectsForEntityName:@"PropertyType" withPredicate:
                   nil];
    
    
    for (PropertyType *pt in pts) {
        NSString *text = pt.typeDesc;
    }
    // Load Property Types into an array to be used in a picker view
    self.ptArray = [pts allObjects];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    // save owner details
    Property *prop =[NSEntityDescription insertNewObjectForEntityForName:@"Property" inManagedObjectContext:self.managedObjectContext];
    prop.propAddress = self.propAddressTxt.text;
    prop.owner = self.selOwner;
     [self.managedObjectContext save:nil];  // write to database
     [self.delegate theSaveButtonOnTheAddPropertyWasTapped:self];
    
}

- (IBAction)showHidePropertyPickerContainer:(UIButton *)sender {
}

// Manage the contents of Picker View

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.ptArray count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    PropertyType  *ptsel = [self.ptArray objectAtIndex:row];
    return ptsel.typeDesc;
    
/*
    // Depending on the component we are working with we allocate values
    if (component == 0 ) {
        return [self.contactNames objectAtIndex:row];
    }
    else
    {
        return [self.contactPhones objectAtIndex:row];
        
    }*/
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    
    /*float rate = [[exchangeRates objectAtIndex:row] floatValue];
     float dollars = [dollarText.text floatValue];
     float result = dollars * rate;
     
     NSString *resultString = [[NSString alloc] initWithFormat:
     @"%.2f USD = %.2f %@", dollars, result,
     [countryNames objectAtIndex:row]];
     resultLabel.text = resultString;*/
    // Create formatted string
    //NSString *namphn =[[NSString alloc]initWithFormat:@"%@ - %@", [self.contactNames objectAtIndex:row],[self.contactPhones objectAtIndex:row]];
    //
    PropertyType  *ptsel = [self.ptArray objectAtIndex:row];
    
    [self.propertyTypeBtn setTitle:ptsel.typeDesc forState:UIControlStateNormal];
}



@end
