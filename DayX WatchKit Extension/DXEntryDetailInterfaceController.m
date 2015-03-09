//
//  DXEntryDetailInterfaceController.m
//  DayX
//
//  Created by Julien Guanzon on 3/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXEntryDetailInterfaceController.h"
#import <DayXKit/DayXKit.h>


@interface DXEntryDetailInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *entryText;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *entryTitle;

@end


@implementation DXEntryDetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    if ([context isKindOfClass:[Entry class]]) {
        Entry *entry = context;
        [self.entryTitle setText:entry.title];
        [self.entryText setText:entry.text];
        
    }
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



