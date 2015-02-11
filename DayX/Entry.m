//
//  Entry.m
//  DayX
//
//  Created by Julien Guanzon on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const titleKey = @"titleKey";
static NSString * const textKey = @"textKey";
static NSString * const timeStampKey = @"timeStampKey";

static NSString * const entryListKey = @"entryListKey";


@implementation Entry


-(NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entriesDictionary = [NSMutableDictionary new];
    
    if (self.title != nil) {
        entriesDictionary[titleKey] = self.title;
    }
    
    if (self.text != nil) {
        entriesDictionary[textKey] = self.text;
    }
    if (self.date != nil) {
        entriesDictionary[timeStampKey] = self.date;
    }
    
    return entriesDictionary;
}



-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.title = dictionary[titleKey];
        self.text = dictionary[textKey];
        self.date = dictionary[timeStampKey];
    }
    
    return self;
}



+ (NSMutableArray *)loadEntriesFromDefaults {
    
    NSDictionary *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[self alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }
    return entries;
}


+ (void) storeEntriesInDefaults:(NSArray *)entries {
    NSMutableArray *entryDictionaries= [NSMutableArray new];
    for (Entry *eachEntry in entries) {
        [entryDictionaries addObject:[eachEntry entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}



@end








