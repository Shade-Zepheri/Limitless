//
//  CydiaObject.h
//  Cydia
//
//  Created on 8/30/16.
//

#import "Menes/Menes.h"
#import "CyteKit.h"

@interface CydiaObject : NSObject {
    _H<CyteWebViewController> indirect_;
    _transient id delegate_;
}

- (id) initWithDelegate:(IndirectDelegate *)indirect;

@end