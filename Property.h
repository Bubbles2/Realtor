//
//  Property.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Owner, PropertyType;

@interface Property : NSManagedObject

@property (nonatomic, retain) NSString * propAddress;
@property (nonatomic, retain) NSNumber * novisits;
@property (nonatomic, retain) NSNumber * dateAvailable;
@property (nonatomic, retain) NSDate * dateStart;
@property (nonatomic, retain) NSNumber * propertyCode;
@property (nonatomic, retain) Owner *owner;
@property (nonatomic, retain) PropertyType *propertyType;

@end
