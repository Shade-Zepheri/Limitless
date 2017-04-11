//
//  ChangesController.h
//  Cydia
//
//  Created on 8/30/16.
//

#import "FilteredPackageListController.h"

@class Database;

@interface ChangesController : FilteredPackageListController {
    unsigned upgrades_;
}

- (instancetype)initWithDatabase:(Database *)database;

@end
