//
//  Entry.h
//  DayX
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *date;

-(NSDictionary *)entryDictionary;
-(id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)loadEntriesFromDefaults;
+ (void) storeEntriesInDefaults:(NSArray *)entries;



@end
