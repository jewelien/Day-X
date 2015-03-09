//
//  DXEntryRowController.m
//  DayX
//
//  Created by Julien Guanzon on 3/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXEntryRowController.h"
#import <WatchKit/WatchKit.h>

@interface DXEntryRowController ()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *entryTitle;

@end

@implementation DXEntryRowController


- (void)updateEntryTitleWithString:(NSString *)title {
    if (!title) {
        return;
    }
    [self.entryTitle setText:title];
}

@end
