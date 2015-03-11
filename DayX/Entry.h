//
//  Entry.h
//  DayX
//
//  Created by Joshua Howland on 10/2/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString * const EntryRecordKey = @"entry";
//these needs to match what we entered in the cloudkit/webdashboard..
static NSString * const EntryIdentifierKey = @"identifier";
static NSString * const EntryTitleKey = @"title";
static NSString * const EntryTextKey = @"text";
static NSString * const EntryTimeStampKey = @"timestamp";


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timestamp;

@property (nonatomic, retain) NSString* identifier;
@property (nonatomic) NSNumber *uploaded;

@end
