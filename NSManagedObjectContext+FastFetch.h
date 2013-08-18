//
//  NSManagedObjectContext+FastFetch.h
//  Realtor
//
//  Created by Donncha Finlay on 07/08/13.
//  Copyright (c) 2013 Donncha Finlay. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (FastFetch)

- (NSSet *)fetchObjectsForEntityName:(NSString *)newEntityName
                       withPredicate:(id)stringOrPredicate, ...;

@end
