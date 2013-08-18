//
//  PropertyType.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Property;

@interface PropertyType : NSManagedObject

@property (nonatomic, retain) NSString * typeDesc;
@property (nonatomic, retain) NSSet *propertiesofType;
@end

@interface PropertyType (CoreDataGeneratedAccessors)

- (void)addPropertiesofTypeObject:(Property *)value;
- (void)removePropertiesofTypeObject:(Property *)value;
- (void)addPropertiesofType:(NSSet *)values;
- (void)removePropertiesofType:(NSSet *)values;

@end
