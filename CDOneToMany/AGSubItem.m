//
//  AGSubItem.m
//  CDOneToMany
//
//  Created by Issam Bendaas on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AGSubItem.h"

@implementation AGSubItem
@synthesize name = _name;
@synthesize itemDescription = _itemDescription;

-(id)initSubItemWithName:(NSString *)name itemDescription:(NSString *)itemDescription
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.itemDescription = itemDescription;
    }
    return  self;
}

@end
