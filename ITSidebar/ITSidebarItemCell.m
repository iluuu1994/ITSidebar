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
//  ITSidebarCell.m
//  ITSidebar
//
//  Created by Ilija Tovilo on 2/22/13.
//  Copyright (c) 2013 Ilija Tovilo. All rights reserved.
//

#import "ITSidebarItemCell.h"

#define kSelectionCornerRadius 5.0
#define kSelectionWidth 2.0

#define kSelectionColor [NSColor colorWithCalibratedRed:0.12f green:0.49f blue:0.93f alpha:1.f]
#define kSelectionHighlightColor [NSColor colorWithCalibratedRed:0.12f green:0.49f blue:0.93f alpha:0.7f]

@implementation ITSidebarItemCell

- (void)drawImageWithFrame:(NSRect)frame inView:(NSView *)controlView {
    NSImage *image;
    if ((self.isHighlighted || [self state] == NSOnState) && self.alternateImage) {
        image = self.alternateImage;
    } else {
        image = self.image;
    }
    [self drawImage:image withFrame:frame inView:controlView];
}
- (void)drawImage:(NSImage *)image withFrame:(NSRect)frame inView:(NSView *)controlView {
    
    [NSGraphicsContext saveGraphicsState];
    {
        [[self shadow] set];
        
        NSRect imgRect = NSInsetRect(frame, ( NSWidth(frame) -[image size].width)/2.0, ( NSHeight(frame) -[image size].height)/2.0);
        [image drawInRect:imgRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
    }
    [NSGraphicsContext restoreGraphicsState];
}

- (NSShadow *)shadow {
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowOffset:NSMakeSize(0, -1)];
    [shadow setShadowColor:[NSColor blackColor]];
    [shadow setShadowBlurRadius:3.0];
    
    return shadow;
}

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    [NSGraphicsContext saveGraphicsState];
    {
        [[self shadow] set];
        [[NSColor whiteColor] set];
        
        [super drawTitle:self.attributedTitle withFrame:cellFrame inView:controlView];
        [self drawImageWithFrame:cellFrame inView:controlView];
    }
    [NSGraphicsContext restoreGraphicsState];
}

- (void)drawBackgroundWithFrame:(NSRect)frame inView:(NSView *)view {
    // We do nothing for this example here..
}

- (void)drawSelectionWithFrame:(NSRect)frame inView:(NSView *)view {
    if ([self state] == NSOnState) {
        [kSelectionColor set];
    } else {
        [kSelectionHighlightColor set];
    }
    
    NSRect strokeRect = NSInsetRect(frame, 10, 10);
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:strokeRect xRadius:kSelectionCornerRadius yRadius:kSelectionCornerRadius];
    [path setLineWidth:kSelectionWidth];
    [path stroke];
}

- (void)drawWithFrame:(NSRect)frame inView:(NSView *)view {
	[NSGraphicsContext saveGraphicsState];
    {
        [self drawBackgroundWithFrame:frame inView:view];
        [self drawInteriorWithFrame:frame inView:view];
    
        if([self state] == NSOnState || [self isHighlighted])
        {
            [self drawSelectionWithFrame:frame inView:view];
        }
    }
    [NSGraphicsContext restoreGraphicsState];
}


@end
