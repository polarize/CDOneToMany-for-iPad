//
//  AGMasterItems.m
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AGMasterItem.h"
#import "AGSubItem.h"

@implementation AGMasterItem
@synthesize name ;
@synthesize itemDescription;
@synthesize subItems;
@synthesize subItem;


-(id)init
{
    NSMutableArray *subArray = [NSMutableArray arrayWithCapacity:3];
    return [self initMasterItemWithName:@"Master Item" itemDescription:@"Master Item Description" subItems:subArray];
}

+(id)addMasterItemes
{
    
    AGMasterItem *masterItem1 = [[self alloc]initMasterItemWithName:@"masterItem1" itemDescription:@"masterItem1" subItems:[NSMutableArray arrayWithObjects:@"sub1",@"sub2", nil]];
    AGMasterItem *masterItem2 = [[self alloc]initMasterItemWithName:@"masterItem2" itemDescription:@"masterItem2" subItems:[NSMutableArray arrayWithObjects:@"sub1",@"sub2", nil]];
    NSMutableArray *masterItemsArray = [NSMutableArray arrayWithObjects:masterItem1,masterItem2, nil];
   
    return masterItemsArray;
}

-(id)initMasterItemWithName:(NSString *)aName itemDescription:(NSString *)aitemDescription subItems:(NSMutableArray *)aSubItems
{
    self = [super init];
    
    if (self) {
       
        name = aName;
        itemDescription = aitemDescription;
        subItems = aSubItems;
        
    }
    
    return self;
}

@end
