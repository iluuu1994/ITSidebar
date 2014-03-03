//
// Copyright (c) 2013 - 2014, Ilija Tovilo
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the organization nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL ILIJA TOVILO BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

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
    NSLog(@"%@: %lu", [sender selectedItem], (unsigned long)[sender selectedIndex]);
    [self.label setStringValue:[NSString stringWithFormat:@"%lu", (unsigned long)[sender selectedIndex]]];
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
