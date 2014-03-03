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
//  ITSidebar.h
//  ITSidebar
//
//  Created by Ilija Tovilo on 2/22/13.
//  Copyright (c) 2013 Ilija Tovilo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ITSidebarItemCell;

@interface ITSidebar : NSView
@property (strong) NSMatrix *matrix;

@property (strong, nonatomic) id target;
@property (nonatomic) SEL action;

// Customisation
@property (nonatomic) NSSize cellSize;
@property (nonatomic) NSColor *backgroundColor;
@property (nonatomic) NSScrollerKnobStyle scrollerKnobStyle;
@property (nonatomic) ITSidebarItemCell *selectedItem;
@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic) BOOL allowsEmptySelection;

+ (Class)sidebarItemCellClass;

// Add/Remove Cells
- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image target:(id)target action:(SEL)action;
- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image alternateImage:(NSImage *)alternateImage target:(id)target action:(SEL)action;

- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image;
- (ITSidebarItemCell *)addItemWithImage:(NSImage *)image alternateImage:(NSImage *)alternateImage;

- (void)removeRow:(NSInteger)row;

// Select Cells
- (void)deselectAllItems;

@end
