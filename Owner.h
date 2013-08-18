//
//  Owner.h
//  Realtor
//
//  Created by Donncha Finlay on 05/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Property;

@interface Owner : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * exclusive;
@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) NSString * mobile;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * valuation;
@property (nonatomic, retain) NSNumber * clientCode;
@property (nonatomic, retain) NSString * postCode;
@property (nonatomic, retain) NSSet *properties;
@end

@interface Owner (CoreDataGeneratedAccessors)

- (void)addPropertiesObject:(Property *)value;
- (void)removePropertiesObject:(Property *)value;
- (void)addProperties:(NSSet *)values;
- (void)removeProperties:(NSSet *)values;

@end
