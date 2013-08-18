//
//  Buyer.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Property, PropertyType;

@interface Buyer : NSManagedObject

@property (nonatomic, retain) NSNumber * buyerCode;
@property (nonatomic, retain) NSString * adddress;
@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) NSString * requiredPostCode;
@property (nonatomic, retain) NSString * budget;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * postCode;
@property (nonatomic, retain) NSSet *requiredPropertyTypes;
@property (nonatomic, retain) NSSet *propertiesVisited;
@end

@interface Buyer (CoreDataGeneratedAccessors)

- (void)addRequiredPropertyTypesObject:(PropertyType *)value;
- (void)removeRequiredPropertyTypesObject:(PropertyType *)value;
- (void)addRequiredPropertyTypes:(NSSet *)values;
- (void)removeRequiredPropertyTypes:(NSSet *)values;

- (void)addPropertiesVisitedObject:(Property *)value;
- (void)removePropertiesVisitedObject:(Property *)value;
- (void)addPropertiesVisited:(NSSet *)values;
- (void)removePropertiesVisited:(NSSet *)values;

@end
