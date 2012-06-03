//
//  AGSubItem.h
//  CDOneToMany
//
//  Created by Issam Bendaas on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGSubItem : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *itemDescription;


-(id)initSubItemWithName:(NSString *)name itemDescription:(NSString *)itemDescription;
@end
