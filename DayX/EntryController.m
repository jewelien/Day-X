//
//  EntryControler.m
//  Entries
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
    });
    return sharedInstance;
}

- (NSArray *)entries {  //this runs when someone calls the entries property in the .h file..Overriding the getter method..make method for a property.
    //???to override setter do another private method "-(voidsetEntries:(NSArray *)entries {}" --do on .h when its set?
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    //When you fetchRequest gives us an array.
    
//    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
//    return objects;  //another way to right this below..
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
}

- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text addDate:(NSDate *)date {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry"
                                                 inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.text = text;
    entry.timestamp = date;
    
    [self synchronize];
}

- (void)removeEntry:(Entry *)entry {

    [entry.managedObjectContext deleteObject:entry];
//    [[Stack sharedInstance].managedObjectContext deleteObject:entry]; another way to write.
    [self synchronize];

}


//instead of synchronize usually use save. but since we're using synchonize already.
- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

@end
