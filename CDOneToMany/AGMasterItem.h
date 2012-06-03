//
//  AGMasterItems.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 02.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AGSubItem;
@interface AGMasterItem : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) NSMutableArray *subItems;

@property (strong, nonatomic) AGSubItem *subItem;


+(id)addMasterItemes;
//-(NSMutableArray *)addSubItems:(AGSubItem *)subItmes;

-(id)initMasterItemWithName:(NSString *)aName itemDescription:(NSString *)aItemDescription subItems:(NSMutableArray *)aSubItems;

@end
