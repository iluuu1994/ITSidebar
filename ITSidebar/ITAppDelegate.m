// DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
// Version 2, December 2004
//
// Copyright (C) 2013 Ilija Tovilo <support@ilijatovilo.ch>
//
// Everyone is permitted to copy and distribute verbatim or modified
// copies of this license document, and changing it is allowed as long
// as the name is changed.
//
// DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
// TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
// 0. You just DO WHAT THE FUCK YOU WANT TO.

//
//  ITAppDelegate.m
//  ITSidebar
//
//  Created by Ilija Tovilo on 2/22/13.
//  Copyright (c) 2013 Ilija Tovilo. All rights reserved.
//

#import "ITAppDelegate.h"
#import "ITSidebar.h"
#import "ITSidebarItemCell.h"

@implementation ITAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Method 1 - Brdiged NSMatrix Target Action
    // This has the advantage of detecting an empty selection
    {
        /*
        [self.sidebar setTarget:self];
        [self.sidebar setAction:@selector(sidebarChanged:)];
        
        NSArray *items = @[ @"star",
                            @"watch",
                            @"tag",
                            @"trash",
                            @"push"];
        
        [items enumerateObjectsUsingBlock:^(NSString *image, NSUInteger idx, BOOL *stop) {
            ITSidebarItemCell *cell = [self.sidebar addItemWithImage:[NSImage imageNamed:[image stringByAppendingString:@"-pushed"]] alternateImage:[NSImage imageNamed:image]];
            [cell setTag:idx + 1];
        }];
         */
    }


    // Method 2 - NSButtonCell Target Action
    {
        [self.sidebar addItemWithImage:[NSImage imageNamed:@"star-pushed"] alternateImage:[NSImage imageNamed:@"star"] target:self action:@selector(starClicked:)];
        [self.sidebar addItemWithImage:[NSImage imageNamed:@"watch-pushed"] alternateImage:[NSImage imageNamed:@"watch"] target:self action:@selector(watchClicked:)];
        [self.sidebar addItemWithImage:[NSImage imageNamed:@"tag-pushed"] alternateImage:[NSImage imageNamed:@"tag"] target:self action:@selector(tagClicked:)];
        [self.sidebar addItemWithImage:[NSImage imageNamed:@"trash-pushed"] alternateImage:[NSImage imageNamed:@"trash"] target:self action:@selector(trashClicked:)];
         [self.sidebar addItemWithImage:[NSImage imageNamed:@"push-pushed"] alternateImage:[NSImage imageNamed:@"push"] target:self action:@selector(pushClicked:)];
        
        // Because this mehthod does not support empty selection, we obviously disable it.
        // Note to set the allowsEmptySelection AFTER adding the items, because else it won't be able to select the first item
        self.sidebar.allowsEmptySelection = NO;
    }
     
    // You CAN technically mix method 1 and 2, I just recommend some serious debugging.
}

// ****************************************** We can use
// NSMatrix Target Action
- (IBAction)sidebarChanged:(ITSidebar *)sender {
    NSLog(@"%@: %d", [sender selectedItem], [sender selectedIndex]);
    [self.label setStringValue:[NSString stringWithFormat:@"%d", [sender selectedIndex]]];
}

// ****************************************** OOOOOOOR
// NSButtonCell Target Action
- (IBAction)starClicked:(id)sender {
    [self.label setStringValue:@"Star"];
}
- (IBAction)watchClicked:(id)sender {
    [self.label setStringValue:@"Watch"];
}
- (IBAction)tagClicked:(id)sender {
    [self.label setStringValue:@"Tag"];
}
- (IBAction)trashClicked:(id)sender {
    [self.label setStringValue:@"Trash"];
}
- (IBAction)pushClicked:(id)sender {
    [self.label setStringValue:@"Push"];
}

@end
