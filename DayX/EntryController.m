//
//  EntryControler.m
//  Entries
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"


@interface EntryController ()

@property (strong, nonatomic) DBTable *entriesTable;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        sharedInstance.datastore = [[DBDatastoreManager sharedManager] openDefaultDatastore:nil];
        sharedInstance.entriesTable = [sharedInstance.datastore getTable:@"Entries"];
    });
    return sharedInstance;
}

- (NSArray *)entries {
    
    return  [self.entriesTable query:nil error:nil];
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
//    NSArray *objects = [[DBStack sharedInstance].managedObjectContext executeFetchRequest:request error:NULL];
//    return objects;
    
}


- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text date:(NSDate *)date {

//    DBRecord *record = don't need the record..not doing anything with it.
    [self.entriesTable insert:@{ kTITLE : title,
                                kTEXT : text,
                                kDATE : date }];
    
//    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry"
//                                                   inManagedObjectContext:[DBStack sharedInstance].managedObjectContext];
//    entry.title = title;
//    entry.text = text;
//    entry.timestamp = date;
    
    [self synchronize];
    
}

- (void)removeEntry:(NSString *)entryID {
    DBRecord *recordToDelete = [self.entriesTable getRecord:entryID error:nil];
    [recordToDelete deleteRecord];
//    [entry.managedObjectContext deleteObject:entry];
    [self synchronize];
}

- (void)synchronize {
//    [[DBStack sharedInstance].managedObjectContext save:NULL];
    [self.datastore sync:nil];
    
}

+ (void)updateSharedInstance {
    [EntryController sharedInstance].datastore = [[DBDatastoreManager sharedManager] openDefaultDatastore:nil];
    [EntryController sharedInstance].entriesTable = [[EntryController sharedInstance].datastore getTable:@"Entries"];
}

@end
